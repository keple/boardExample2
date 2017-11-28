package org.exBoard.persistence;

import java.util.List;

import org.exBoard.domain.Criteria;
import org.exBoard.domain.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl extends GenericDAO<ReplyVO, Integer, Criteria> {

	@Override
	public List<ReplyVO> getList(Criteria c) {
	
		return session.selectList(namespace+".reply_list", c);
	}

	@Override
	public Integer insert(ReplyVO k) {
		int key = 1;
		try{
			session.insert(namespace+".replyInsert",k);
			
		}catch(Exception e){
			key = 0;
		}
		return key;
	}

	@Override
	public Integer delete(Integer no) {
	
		return null;
	}

	@Override
	public Integer update(ReplyVO k) {

		return null;
	}

	@Override
	public Integer getTotal() {

		return null;
	}

	@Override
	public ReplyVO getObject(Integer v) {

		return null;
	}

	@Override
	public Integer getPrimary(ReplyVO k) {

		return null;
	}

	



}
