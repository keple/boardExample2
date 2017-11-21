package org.exBoard.util;

import java.util.HashMap;
import java.util.Map;

public class DaumEditorMimeMap {
private static Map<String,String> daumMap;
	
	static{
		
		daumMap = new HashMap<String,String>();
		daumMap.put("JPG", "image/jpg");
		daumMap.put("GIF", "image/gif");
		daumMap.put("PNG", "image/png");
		daumMap.put("TXT", "text/utf-8");
		daumMap.put("HTML", "text/html");
		
		
	}
	
	public static String getMediaType(String type){
		
		return daumMap.get(type.toUpperCase());
	}
}
