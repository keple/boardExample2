package org.exBoard.service;

import javax.inject.Inject;

import org.exBoard.domain.UserDTO;
import org.exBoard.domain.UserVO;
import org.exBoard.persistence.UserDAO;
import org.exBoard.security.PasswordEncoding;
import org.exBoard.util.MsgMap;
import org.springframework.stereotype.Service;

@Service
public class CustomUserServiceImpl implements CustomUserService {
	@Inject
	UserDAO udao;
	@Override
	public String registUser(UserDTO dto) {
		PasswordEncoding passEncoder = new PasswordEncoding();
		
		UserVO uvo = new UserVO();
		
		String newPassword = passEncoder.encode(dto.getPassword());
		
		System.out.println("newPassword"+"\t"+newPassword);
		uvo.setUserid(dto.getUsername());
		uvo.setUpw(newPassword);
		uvo.setRole("user");
		return MsgMap.getInstance().getMessage(udao.registUser(uvo));
	}

}
