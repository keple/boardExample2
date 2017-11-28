package org.exBoard.persistence;

import java.util.List;

import org.exBoard.domain.Criteria;
import org.exBoard.domain.FileVO;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl extends GenericDAO<FileVO, Integer, Criteria> implements FileDAO{

	@Override
	public List<FileVO> getList(Criteria c) {

		System.out.println("Criteria"+c);
		return session.selectList(namespace+".getFileList",c);
	}

	@Override
	public Integer insert(FileVO k) {

		return session.insert(namespace+".fileInsert",k);
	}

	@Override
	public Integer delete(Integer no) {
	
		return null;
	}

	@Override
	public Integer update(FileVO k) {

		return null;
	}

	@Override
	public Integer getTotal() {
	
		return null;
	}

	@Override
	public FileVO getObject(Integer v) {
	
		return null;
	}

	@Override
	public Integer getPrimary(FileVO k) {
	
		return null;
	}

	@Override
	public Integer deleteAllFromBoard(Integer no) {
		
		return session.delete(namespace+".deleteAllFromBoard",no);
	}

}
