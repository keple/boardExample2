package org.exBoard.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class FileUtil {
	static Logger logger = Logger.getLogger(FileUtil.class);
	public static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		System.out.println("머꼬이거" + File.separator);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath,yearPath,monthPath,datePath);
		
		return datePath;
	}
	private static void makeDir(String uploadPath, String ... paths) {
		// TODO Auto-generated method stub
		if(new File(paths[paths.length-1]).exists()){
			return;
		}
		
		for(String path : paths){
			
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	public static String makeThumbnail(String uploadPath,String path,String fileName)throws Exception{
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path,fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separator, "/");
	}
	
	public static String uploadFile(String uploadPath,String originalName,byte[] fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath,savedName);
		
		FileCopyUtils.copy(fileData,target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtil.getMediaType(formatName) !=null){
			uploadedFileName = makeThumbnail(uploadPath,savedPath,savedName);
			
		}else{
			uploadedFileName = makeIcon(uploadPath,savedPath,savedName);
		}
		
		logger.info("ddd"+uploadedFileName);
		return uploadedFileName.replace("s_", "");
	
	}

	private static String makeIcon(String uploadPath, String path, String fileName) {
		// TODO Auto-generated method stub
		String iconName = uploadPath + path + File.separator + fileName;
		
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}
	
}
