package org.exBoard.service;

import org.exBoard.domain.UserDTO;

public interface CustomUserService {
	public String registUser(UserDTO dto);
	public Integer checkUser(String checkString);
}
