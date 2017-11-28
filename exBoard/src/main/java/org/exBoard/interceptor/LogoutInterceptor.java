package org.exBoard.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.exBoard.util.UserStatusMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uname = request.getUserPrincipal().getName();
		UserStatusMap.getInstance().removeData(uname);
		return true;
	}

}
