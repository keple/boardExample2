package org.exBoard.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.exBoard.domain.UserDTO;
import org.exBoard.service.CustomUserService;
import org.exBoard.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	@Inject
	CustomUserService uService;
	
	@Inject
	MailService mService;
	
	@GetMapping("/regist")
	public void goRegistPage(){
		
	}
	@PostMapping(value="/register",produces="application/text;charset=utf8")
	@ResponseBody
	public void registerUser(UserDTO dto,@RequestParam("email")String email){
		
		System.out.println("RegisterUserPage in");
		System.out.println(dto);
		logger.info("이메일 주소" +email);
		StringBuilder builder = new StringBuilder();
		builder.append("인증요청 링크입니다. 해당링크로 접속하시면 가입처리됩니다.");
		//태그 안먹히는거같음.
		builder.append("<br>");
		//아직 링크 만들지는 않음.
		mService.sendMailToUser("인증메일 요청", builder.toString(), "smw195@naver.com", email.trim(), null);
		
		
	}
	@PostMapping(value="/check")
	@ResponseBody
	public Integer validUser(@RequestParam("checkString")String checkString){
		System.out.println(checkString);
		
		return uService.checkUser(checkString);
	}
}
