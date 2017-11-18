package org.exBoard.domain;

public class UserVO {
	private String userid;
	private String uname;
	private String upw;
	private String role;
	
	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + userid + ", uname=" + uname + ", upw=" + upw + ", role=" + role + "]";
	}
	
	
}
