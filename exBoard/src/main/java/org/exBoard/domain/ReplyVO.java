package org.exBoard.domain;

import java.sql.Timestamp;

public class ReplyVO {
	private int rno;
	private String content;
	private String writer;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int bno;
	private int randomUser;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRandomUser() {
		return randomUser;
	}
	public void setRandomUser(int randomUser) {
		this.randomUser = randomUser;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + ", bno=" + bno + ", randomUser=" + randomUser + "]";
	}

	
}
