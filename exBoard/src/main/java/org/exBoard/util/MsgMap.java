package org.exBoard.util;

import java.util.HashMap;
import java.util.Map;

public class MsgMap {
	private static MsgMap instance;
	private Map<Integer,String> MessageMap;
	
	private MsgMap(){
		this.MessageMap = new HashMap<Integer,String>();
		init();
	}
	private void init(){
		MessageMap.put(1, "작업에 성공했습니다.");
		MessageMap.put(0, "다시 시도해주세요");
	}
	public String getMessage(Integer key){
		return MessageMap.get(key);
	}
	public static MsgMap getInstance(){
		if(instance== null){
			instance = new MsgMap();
		}
		return instance;
	}
}
