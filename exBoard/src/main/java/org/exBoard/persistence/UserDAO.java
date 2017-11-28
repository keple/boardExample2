package org.exBoard.persistence;

import org.exBoard.domain.UserDTO;
import org.exBoard.domain.UserVO;

public interface UserDAO {
	public UserVO getUserById(String uid);
	public Integer registUser(UserVO uvo);
	public Integer checkUser(String checkString);
}
