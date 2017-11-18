package org.exBoard.security;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class SHAPassEncoder implements PasswordEncoder {
	private ShaPasswordEncoder shaPassEncoder;
	private Object salt;
	public SHAPassEncoder(){
		this.shaPassEncoder = new ShaPasswordEncoder();
	}
	public SHAPassEncoder(int sha){
		this.shaPassEncoder = new ShaPasswordEncoder(sha);
		
	}
	public void setSalt(Object obj){
		this.salt = obj;
		
	}
	
	public void setEncodeHashAsBase64(boolean encodeHashAsBase64){
		shaPassEncoder.setEncodeHashAsBase64(encodeHashAsBase64);
	}
	@Override
	public String encode(CharSequence originPassword) {
		// TODO Auto-generated method stub
		return shaPassEncoder.encodePassword(originPassword.toString(), salt);
	}

	@Override
	public boolean matches(CharSequence originPassword, String newPassword) {
		// TODO Auto-generated method stub
		return shaPassEncoder.isPasswordValid(newPassword, originPassword.toString(), salt);
	}

}
