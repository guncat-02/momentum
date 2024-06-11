package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {
	//시작화면으로 가는 controller
	@GetMapping("/")
	public String start() {
		return "start";
	}
}
