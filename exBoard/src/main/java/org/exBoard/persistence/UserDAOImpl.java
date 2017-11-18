package org.exBoard.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.exBoard.domain.UserDTO;
import org.exBoard.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	SqlSession sess;
	final String namespace = "org.exBoard.persistence";
	@Override
	public UserVO getUserById(String uid) {
		// TODO Auto-generated method stub
		return sess.selectOne(namespace+".getUserInfo",uid);
	}
	@Override
	public Integer registUser(UserVO uvo) {
		// TODO Auto-generated method stub
		Integer key = 1;
		try{
			sess.insert(namespace+".insertUser",uvo);
		}catch(Exception e){
			key = 0;
		}
		return key;
	}

}
