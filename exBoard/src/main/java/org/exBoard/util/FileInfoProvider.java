package org.exBoard.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.exBoard.domain.FileInfoDomain;

public class FileInfoProvider {
	private List<FileInfoDomain> domains;
	private InputStream in;
	private List<FileWrapper> wrapperList;
	public FileInfoProvider(Collection<FileInfoDomain> domainList){
		this.domains = (List<FileInfoDomain>) domainList;
		this.in = null;
		this.wrapperList = new ArrayList<>();
	}
	public List<FileWrapper> getFileInfo() throws IOException{
		
		for(FileInfoDomain f:this.domains){
			FileWrapper temp = new FileWrapper();
			File fi = new File("D:\\zzz\\"+f.getFileSrc().substring(f.getFileSrc().indexOf("=")+1));
			
			temp.setOriginName(new String(fi.getName().getBytes(),"UTF-8"));
			temp.setFileSize(fi.length());
			temp.setMimeType(new String(f.getValue().getBytes(),"UTF-8"));
			temp.setSrc(new String(f.getFileSrc().getBytes(),"UTF-8"));
			wrapperList.add(temp);
		}
		
		return wrapperList;
	}
	
	
}
