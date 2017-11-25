package org.exBoard.service;

import java.util.List;

import org.exBoard.domain.BoardVO;
import org.exBoard.domain.Criteria;
import org.exBoard.domain.FileDTO;
import org.exBoard.domain.FileVO;
import org.exBoard.domain.ReplyVO;


public interface ExBoardService {
	public List<BoardVO> getBoardList(Criteria cri);
	public String insertBoard(BoardVO vo,FileDTO dto) throws Exception;
	public String deleteBoard(Integer no);
	public String updateBoard(BoardVO vo,FileDTO dto) throws Exception;
	public Integer getTotal();
	public BoardVO getBoard(Integer bno);
	public String insertReply(ReplyVO rvo);
	public List<ReplyVO> getReplyList(Criteria cri);
	public List<FileVO> getFileList(Criteria cri);
	public FileDTO getFileListAsDTO(Criteria cri);
}
