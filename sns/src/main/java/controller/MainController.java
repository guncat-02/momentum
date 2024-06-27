package controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_MainService;
import util.CookieUtil;
import vo.PostVO;

@Controller
public class MainController {
	@Inject
	IF_MainService mainSer;
	
	@GetMapping("main")
	public String mint(Model model,
			HttpSession session) throws Exception {
		
		String id = String.valueOf(session.getAttribute("userid"));
		
		List<PostVO> attachList= mainSer.attachAll();
		model.addAttribute("aList",attachList);
		return "main";
	}
	@PostMapping("myPost")
	public String post(Model model, @ModelAttribute PostVO postvo, @RequestParam(value="order", required = false) String order,@RequestParam(value="no", required = false) int no ) throws Exception {
		
		// 해당 포스트 글번호의 댓글 리스트 
//			model.addAttribute("commlist",cser.CommList(postvo.getNo())); 
//			model.addAttribute("Commcnt", cser.cntComm(postvo.getNo()));
			model.addAttribute("postvo", postvo);
	
		return "myPost";
	}

	
	/*
	@PostMapping("/main_mintest/id/like")
	public ResponseEntity likePost() {
		return ResponseEntity<>()
	}
	*/
	
	
	
	/*
	@PostMapping("/main_mintest/like")
	public ResponseEntity likePost() {
		LikeViewResponse likeViewResponse = MainSer.pressLike();
		return new ResponseEntity<>(likeViewResponse , HttpStatus.OK);
	}
	*/
	
}
