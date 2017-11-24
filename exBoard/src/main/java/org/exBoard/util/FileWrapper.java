package org.exBoard.util;

public class FileWrapper {

	private String src;
	private String originName;
	private String mimeType;
	private long fileSize;
	public FileWrapper(){
		
	}
	public FileWrapper(String src,String originalName,String mime,long fileSize){
		this.src = src;
		this.originName = originalName;
		this.mimeType = mime;
		this.fileSize = fileSize;
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

	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "FileWrapper [src=" + src + ", originName=" + originName + ", mimeType=" + mimeType + ", fileSize="
				+ fileSize + "]";
	}

	
}
