package controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String post(
						Model model
						,@RequestParam("postingId") String postname
						,@RequestParam("filename") String filename
						,@RequestParam("showCnt") String viewCnt
						,@RequestParam("cont") String content
						) {
		model.addAttribute("postingId", postname);
		model.addAttribute("filename", filename);
		model.addAttribute("showCnt", viewCnt);
		model.addAttribute("cont", content);
		//사진은 여러개 저장되므로 부트스트랩등의 캐러셀 형태로 보여줄것으로 기획하고있습니다.
		//filename과 글의 no값으로 select문을 해당 메서드에서 돌려 사진 여러개를 가져올 계획입니다.
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
	@GetMapping("/main_mintest/like")
	public String likePost() {
		
	
		return "";
	}
}
