package controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.IF_MainService;
import vo.MainVO;

@Controller
public class MainController {
	@Inject
	IF_MainService mainSer;
	
	@GetMapping("main_mintest")
	public String mint(Model model) throws Exception {
		//아직 로그인여부와 소스를 합치지 못해서 임시로 min이라는 id값 으로 main을 임시구현합니다.
		//나중에 로그인된 id를 매개값으로 넘길 예정입니다.
		//화면을 구성하는 게시물은 min이라는 유저가 팔로우하는 minf와 minp의 게시물이 보여집니다.
		List<MainVO> mainSave = mainSer.mainAll("min");
		model.addAttribute("mList",mainSave);
		return "main";
	}
	@PostMapping("myPost")
	public String post() {
		return "myPost";
	}
	
	
}
