package org.exBoard.security;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.exBoard.domain.UserImpl;
import org.exBoard.util.UserStatusMap;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class PostHandler implements AuthenticationSuccessHandler {
	private Logger logger = Logger.getLogger(PostHandler.class);
	@Override
	public void onAuthenticationSuccess(HttpServletRequest arg0, HttpServletResponse arg1, Authentication arg2)
			throws IOException, ServletException {
		
		arg0.getSession().setAttribute("username", UserStatusMap.getInstance().getUserData(arg2.getName()).getUserAlias());
		UserStatusMap.getInstance().removeData(arg2.getName());
		arg1.sendRedirect("/board/list");
		
	}

}
