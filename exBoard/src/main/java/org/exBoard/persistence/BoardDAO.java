package org.exBoard.persistence;

import java.util.List;

import org.exBoard.domain.BoardVO;
import org.exBoard.domain.Criteria;

public interface BoardDAO {
	static final String namespace = "org.exBoard.persistence";
	
	public List<BoardVO> getList(Criteria c);
	public Integer insert(BoardVO k);
	public Integer delete(Integer no);
	public Integer update(BoardVO k);
	public Integer getTotal();
	public BoardVO getObject(Integer v);
	public Integer getPrimary(BoardVO k);
}
