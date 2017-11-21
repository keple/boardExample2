package org.exBoard.persistence;

import java.util.List;

import org.exBoard.domain.Criteria;
import org.exBoard.domain.FileVO;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl extends GenericDAO<FileVO, Integer, Criteria> implements FileDAO{

	@Override
	public List<FileVO> getList(Criteria c) {
		// TODO Auto-generated method stub
		System.out.println("Criteria"+c);
		return session.selectList(namespace+".getFileList",c);
	}

	@Override
	public Integer insert(FileVO k) {
		// TODO Auto-generated method stub
		return session.insert(namespace+".fileInsert",k);
	}

	@Override
	public Integer delete(Integer no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(FileVO k) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FileVO getObject(Integer v) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getPrimary(FileVO k) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteAllFromBoard(Integer no) {
		// TODO Auto-generated method stub
		return session.delete(namespace+".deleteAllFromBoard",no);
	}

}
