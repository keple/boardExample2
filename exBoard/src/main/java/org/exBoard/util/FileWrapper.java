package org.exBoard.util;

public class FileWrapper {

	private String src;
	private String originName;
	private String mimeType;
	
	public FileWrapper(String src,String originalName,String mime){
		this.src = src;
		this.originName = originalName;
		this.mimeType = mime;
	}
	public String getSrc() {
		return src;
	}

	public String getMimeType() {
		return mimeType;
	}
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
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
		return "FileWrapper [src=" + src + ", originName=" + originName + ", mimeType=" + mimeType + "]";
	}

	
}
