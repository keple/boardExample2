package org.exBoard.web;

import org.exBoard.util.UserStatusMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class LoginController {

	@GetMapping("/login")
	public void goLoginPage(@RequestParam(value="error", required=false)String error,
			@RequestParam(value="logout",required=false)String logout,
			Model model){
		System.out.println(UserStatusMap.getInstance().toString());
		
		String key = null;
		if(error!=null){
			key="fail";
		}
			model.addAttribute("test", key);

	}
}
