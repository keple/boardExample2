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
}
