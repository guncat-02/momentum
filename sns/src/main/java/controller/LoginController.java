package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class LoginController {
	
	
	@GetMapping("/")
	public String login() throws Exception {
		
		return "loginForm";
	}
	
	@GetMapping("/join")
	public String join() throws Exception {
		
		return "joinForm";
	}
	



	
}
