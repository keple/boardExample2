package org.exBoard.service;

import javax.inject.Inject;

import org.exBoard.domain.UserImpl;
import org.exBoard.domain.UserVO;
import org.exBoard.persistence.UserDAO;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


public class LoginUserService implements UserDetailsService {
	@Inject
	UserDAO udao;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserVO uvo = udao.getUserById(username);
		
		UserImpl user = new UserImpl();
		user.setUserid(uvo.getUserid());
		user.setUserpw(uvo.getUpw()); 
		user.setRole(uvo.getRole());
		user.getAuthorities();
		System.out.println("*************************"+user+"*****************");
		
		return user;
	}

}
