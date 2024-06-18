package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class managerController {
	
	
	@GetMapping("/manager") 
	public String managePage() throws Exception {
		
		return "manageForm";
	}
}
