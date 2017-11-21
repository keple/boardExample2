package org.exBoard.util;

public class FileWrapper {

	private String src;
	private String originName;
	
	public FileWrapper(String src,String originalName){
		this.src = src;
		this.originName = originalName;
	}
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}
	@Override
	public String toString() {
		return "FileWrapper [src=" + src + "]";
	}
	
}
