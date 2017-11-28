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
	private String status;
	private List<GrantedAuthority> authList;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		authList = new ArrayList<>();
		
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		if(this.role.equals("admin")||this.role==null){
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		return authList;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userpw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
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
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserImpl [userid=" + userid + ", userpw=" + userpw + ", userAlias=" + userAlias + ", role=" + role
				+ ", authList=" + authList + "]";
	}

	

}
