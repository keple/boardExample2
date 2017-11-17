package org.exBoard.domain;

public class FileVO {
	private Integer fno;
	private String fileName;
	private Integer bno;
	
	
	public Integer getFno() {
		return fno;
	}
	public void setFno(Integer fno) {
		this.fno = fno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "FileVO [fno=" + fno + ", fileName=" + fileName + ", bno=" + bno + "]";
	}

	
	
}
