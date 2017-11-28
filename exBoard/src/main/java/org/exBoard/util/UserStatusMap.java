package org.exBoard.util;

import java.util.HashMap;
import java.util.Map;

import org.exBoard.domain.UserImpl;

public class UserStatusMap{
	private Map<String,UserImpl> statusMap;
	private static UserStatusMap instance;
	
	private UserStatusMap(){
		statusMap = new HashMap<>();
	};
	public static UserStatusMap getInstance(){
		if(instance==null){
			instance = new UserStatusMap();
		}
		return instance;
	};
	public void pushUserData(UserImpl user){
		statusMap.put(user.getUsername(), user);
	};
	public UserImpl getUserData(String key){
		return statusMap.get(key);
	};
	public void removeData(String key){
		statusMap.remove(key);
	}
	@Override
	public String toString() {
		return "UserStatusMap [statusMap=" + statusMap + "]";
	}
	
}
