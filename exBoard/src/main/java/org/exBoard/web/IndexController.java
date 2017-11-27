package org.exBoard.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

	
	
	@GetMapping("index")
	public void goIndex(){
		
		
		
	}
	@GetMapping("test")
	public void goTestPage(){
		
	}
	@GetMapping("file")
	public String goFilePage(){
		
		
		return "/daumEditor/file";
	}
	@GetMapping("image")
	public String foImagePage(){
		
		
		return "/daumEditor/image";
	}
}
