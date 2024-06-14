package controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import vo.PostVO;



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
	
	
	@GetMapping("/myPostShow")
	public String myPostShow(Model model, PostVO pvo) throws Exception{
		model.addAttribute("no", pvo.getNo());
		
		return "myPost";
	}
}
