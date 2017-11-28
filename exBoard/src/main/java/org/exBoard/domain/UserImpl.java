package org.exBoard.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserImpl implements UserDetails {
	private String userid;
	private String userpw;
	private String userAlias;
	private String role;
	private List<GrantedAuthority> authList;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		authList = new ArrayList<>();
		
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		if(this.role.equals("admin")||this.role==null){
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		return authList;
	}

	@Override
	public String getPassword() {
	
		return userpw;
	}

	@Override
	public String getUsername() {
	
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
	
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
	
		return true;
	}

	@Override
	public boolean isEnabled() {
	
		return true;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
	public String getUserAlias() {
		return userAlias;
	}

	public void setUserAlias(String userAlias) {
		this.userAlias = userAlias;
	}
	
	

	@Override
	public String toString() {
		return "UserImpl [userid=" + userid + ", userpw=" + userpw + ", userAlias=" + userAlias + ", role=" + role
				+ ", authList=" + authList + "]";
	}

	

}
