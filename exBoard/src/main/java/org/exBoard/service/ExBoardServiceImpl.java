package org.exBoard.service;

import java.io.UnsupportedEncodingException;
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
		
		
		return boardDAO.getList(cri);
	}

	@Override
	@Transactional
	public String insertBoard(BoardVO vo,FileDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		String msg = MsgMap.getInstance().getMessage(boardDAO.insert(vo));
		
		Integer pri = boardDAO.getPrimary(vo);
		logger.info(pri);
		FileVO fvo = new FileVO();
		fvo.setBno(pri);
		for(String name:dto.getFileNames()){
			if(name.trim()!=""){
				fvo.setFileName(new String(name.getBytes(),"UTF-8"));
				fileDAO.insert(fvo);
			}
		}
		
		return msg;
	}

	@Override
	
	public String deleteBoard(Integer no) {
		

		return MsgMap.getInstance().getMessage(boardDAO.delete(no));
	}

	@Override
	@Transactional
	public String updateBoard(BoardVO vo,FileDTO dto) throws Exception {
		
		String msg =MsgMap.getInstance().getMessage(boardDAO.update(vo));
	
		fileDAO.deleteAllFromBoard((vo.getBno()));
		FileVO fvo = new FileVO();
		for(String s:dto.getFileNames()){
		
			if(s.trim()!=""){
				fvo.setFileName(new String(s.getBytes(),"UTF-8"));
				fvo.setBno(vo.getBno());
				fileDAO.insert(fvo);	
			}
		}
		return msg;
	}

	@Override
	public Integer getTotal() {

		return boardDAO.getTotal();
	}

	@Override
	@Transactional
	public BoardVO getBoard(Integer bno) {

		boardDAO.increaseBoardCount(bno);
		
		return boardDAO.getObject(bno);
	}

	@Override
	public List<ReplyVO> getReplyList(Criteria cri) {
	
		return replyDAO.getList(cri);
	}

	@Override
	public String insertReply(ReplyVO rvo) {
	
		return MsgMap.getInstance().getMessage(replyDAO.insert(rvo));
	}

	@Override
	@Transactional
	public List<FileVO> getFileList(Criteria cri) {

		logger.info(cri);
		FileDTO dto = new FileDTO();
		logger.info("List"+fileDAO.getList(cri));
		
		
		
		return fileDAO.getList(cri); 
	}

	@Override
	public FileDTO getFileListAsDTO(Criteria cri) {
	
		List<FileVO> voList = fileDAO.getList(cri);
		FileDTO dto = new FileDTO();
		for(int i=0;i<voList.size();i++){
			dto.getFileNames().add(voList.get(i).getFileName());
		}
		
		return dto;
	}



}
