package org.exBoard.domain;

import java.util.ArrayList;
import java.util.List;

public class FileDTO {
	private List<String> fileNames;
	
	public FileDTO(){
		this.fileNames = new ArrayList<>();
	}
	public List<String> getFileNames() {
		return fileNames;
	}

	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}

	@Override
	public String toString() {
		return "FileDTO [fileNames=" + fileNames + "]";
	}
	
	
}
