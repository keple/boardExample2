package org.exBoard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.exBoard.domain.BoardVO;
import org.exBoard.domain.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession session;
	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		return session.selectList(namespace+".boardList",cri);
	}

	@Override
	public Integer insert(BoardVO k) {
		// TODO Auto-generated method stub
		try{
			session.insert(namespace+".boardInsert", k);
			
		}catch(Exception e){
			return 0;
		}
		return 1;
	}

	@Override
	public Integer delete(Integer no) {
		// TODO Auto-generated method stub
		try{
			session.delete(namespace+".deleteBoard",no);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}

	@Override
	public Integer update(BoardVO k) {
		
		// TODO Auto-generated method stub
		try{
			session.update(namespace+".updateBoard",k);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBoardTotal");
	}

	@Override
	public BoardVO getObject(Integer no) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".findBoard",no);
	}

	@Override
	public Integer getPrimary(BoardVO k) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBno", k);
	}
	public void increaseBoardCount(Integer bno){
		session.update(namespace+".increBoardCount",bno);
	}

}
