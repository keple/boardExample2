package org.exBoard.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.exBoard.domain.BoardVO;
import org.exBoard.domain.Criteria;
import org.exBoard.domain.FileDTO;
import org.exBoard.domain.FileVO;
import org.exBoard.domain.ReplyVO;
import org.exBoard.persistence.BoardDAOImpl;
import org.exBoard.persistence.FileDAOImpl;
import org.exBoard.persistence.ReplyDAOImpl;
import org.exBoard.util.MsgMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ExBoardServiceImpl implements ExBoardService {
	Logger logger = Logger.getLogger(ExBoardServiceImpl.class);
	
	@Inject
	BoardDAOImpl boardDAO;
	@Inject
	ReplyDAOImpl replyDAO;
	@Inject
	FileDAOImpl fileDAO;
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.getList(cri);
	}

	@Override
	@Transactional
	public String insertBoard(BoardVO vo,FileDTO dto) {
		// TODO Auto-generated method stub
		
		String msg = MsgMap.getInstance().getMessage(boardDAO.insert(vo));
		
		Integer pri = boardDAO.getPrimary(vo);
		logger.info(pri);
		FileVO fvo = new FileVO();
		fvo.setBno(pri);
		for(String name:dto.getFileNames()){
			if(name.trim()!=""){
				fvo.setFileName(name);
				fileDAO.insert(fvo);
			}
		}
		
		return msg;
	}

	@Override
	
	public String deleteBoard(Integer no) {
		// TODO Auto-generated method stub

		return MsgMap.getInstance().getMessage(boardDAO.delete(no));
	}

	@Override
	@Transactional
	public String updateBoard(BoardVO vo,FileDTO dto) {
		// TODO Auto-generated method stub
		String msg =MsgMap.getInstance().getMessage(boardDAO.update(vo));
		//아.. 이방법은 안쓰고 싶은데
		//처음부터 download링크랑 같이 본문에 넣었어야 하는거같다..
		fileDAO.deleteAllFromBoard((vo.getBno()));
		FileVO fvo = new FileVO();
		for(String s:dto.getFileNames()){
			if(s.trim()!=""){
				fvo.setFileName(s);
				fvo.setBno(vo.getBno());
				fileDAO.insert(fvo);	
			}
		}
		return msg;
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return boardDAO.getTotal();
	}

	@Override
	@Transactional
	public BoardVO getBoard(Integer bno) {
		// TODO Auto-generated method stub
		boardDAO.increaseBoardCount(bno);
		
		return boardDAO.getObject(bno);
	}

	@Override
	public List<ReplyVO> getReplyList(Criteria cri) {
		// TODO Auto-generated method stub
		return replyDAO.getList(cri);
	}

	@Override
	public String insertReply(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return MsgMap.getInstance().getMessage(replyDAO.insert(rvo));
	}

	@Override
	@Transactional
	public List<FileVO> getFileList(Criteria cri) {
		// TODO Auto-generated method stub
		logger.info(cri);
		FileDTO dto = new FileDTO();
		logger.info("List"+fileDAO.getList(cri));
		
		
		
		return fileDAO.getList(cri); 
	}

	@Override
	public FileDTO getFileListAsDTO(Criteria cri) {
		// TODO Auto-generated method stub
		List<FileVO> voList = fileDAO.getList(cri);
		FileDTO dto = new FileDTO();
		for(int i=0;i<voList.size();i++){
			dto.getFileNames().add(voList.get(i).getFileName());
		}
		
		return dto;
	}



}
