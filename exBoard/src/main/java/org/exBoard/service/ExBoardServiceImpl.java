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
			fvo.setFileName(name);
			fileDAO.insert(fvo);
		}
		
		return msg;
	}

	@Override
	
	public String deleteBoard(Integer no) {
		// TODO Auto-generated method stub

		return MsgMap.getInstance().getMessage(boardDAO.delete(no));
	}

	@Override
	public String updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
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



}
