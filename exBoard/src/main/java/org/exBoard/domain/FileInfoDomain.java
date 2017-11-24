package org.exBoard.domain;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonProperty;

public class FileInfoDomain {
	private String fileSrc;
	private String value;
	
	public FileInfoDomain(@JsonProperty("fileSrc")String fileSrc,@JsonProperty("value")String value){
		this.fileSrc = fileSrc;
		this.value = value;
	}
	
	public String getFileSrc() {
		return fileSrc;
	}
	
	
	
	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "FileInfoDomain [fileSrc=" + fileSrc + ", value=" + value + "]";
	}
	
}
