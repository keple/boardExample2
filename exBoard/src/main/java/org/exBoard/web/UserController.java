package org.exBoard.web;

import javax.inject.Inject;

import org.exBoard.domain.UserDTO;
import org.exBoard.service.CustomUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	CustomUserService uService;
	
	@GetMapping("/regist")
	public void goRegistPage(){
		
	}
	@PostMapping(value="/register",produces="application/text;charset=utf8")
	@ResponseBody
	public String registerUser(UserDTO dto){
		
		System.out.println("RegisterUserPage in");
		System.out.println(dto);
		
		return uService.registUser(dto);
		
	}
}
