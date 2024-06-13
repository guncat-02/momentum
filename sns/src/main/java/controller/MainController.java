package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class MainController {

	@GetMapping("/main")
	public String main() throws Exception{
		
		return "main";
	}
	@GetMapping("/myPost")
	public String myPost() throws Exception{
		return "myPost";
	}
}
