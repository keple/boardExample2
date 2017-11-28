package org.exBoard.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordEncoding implements PasswordEncoder {
	private PasswordEncoder passwordEncoder;
	
	public PasswordEncoding(){
		this.passwordEncoder = new BCryptPasswordEncoder();
	}
	public PasswordEncoding(PasswordEncoder passEn){
		this.passwordEncoder = passEn;
	}
	
	@Override
	public String encode(CharSequence originPassword) {
		
		return passwordEncoder.encode(originPassword);
	}

	@Override
	public boolean matches(CharSequence originPassword, String newPassword) {
	
		return passwordEncoder.matches(originPassword, newPassword);
	}

}
