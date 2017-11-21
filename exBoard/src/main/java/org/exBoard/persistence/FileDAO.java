package org.exBoard.persistence;

import java.util.List;

import org.exBoard.domain.BoardVO;
import org.exBoard.domain.FileVO;

public interface FileDAO {
	public Integer deleteAllFromBoard(Integer no);
}
