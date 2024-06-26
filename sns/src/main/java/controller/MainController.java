package controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_MainService;
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
	public String post(
						Model model
						,@ModelAttribute PostVO postvo
						,@RequestParam("myid") String myid
						,@RequestParam("myname") String myname
						,@RequestParam("mygrade") String mygrade
						)throws Exception {
		
		model.addAttribute("postvo",postvo) ;
		model.addAttribute("myid",myid);
		model.addAttribute("myname",myname);
		model.addAttribute("mygrade",mygrade);
		
		/*
		 * model.addAttribute("filename", filename); model.addAttribute("showCnt",
		 * viewCnt); model.addAttribute("cont", content); model.addAttribute("id",
		 * postname); model.addAttribute("no", no);
		 */
		
		//List<String> myAttach= mainSer.postAttach(no);
		//model.addAttribute("myattach",myAttach);
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
