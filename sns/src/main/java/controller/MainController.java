package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_CommService;
import service.IF_MainService;
import service.IF_ProfileService;
import vo.PostVO;
import vo.ProfileVO;

@Controller
@EnableAsync
public class MainController {
	@Inject
	IF_MainService mainSer;
	
	@Inject
	IF_CommService cser;
	
	@Inject
	IF_ProfileService pservice;

	@GetMapping("main")
	public String mint(Model model, HttpSession session) throws Exception {

		List<PostVO> attachList = mainSer.attachAll();
		model.addAttribute("aList", attachList);
		return "main";
	}
	
	@GetMapping("menu-profile")
	@ResponseBody
	public ProfileVO menuProfile(HttpSession session) throws Exception {
		String curId = (String)session.getAttribute("userid");
		ProfileVO pvo = pservice.select(curId);
		return pvo;
	}

	@GetMapping("myPost")
	public String post(Model model, @ModelAttribute PostVO postvo,
			@RequestParam(value="order", required = false) String order,
			@RequestParam(value="no", required = false) int no ) throws Exception {
		// 해당 포스트 글번호의 댓글 리스트 
		model.addAttribute("commlist",cser.CommList(postvo.getNo()));
		model.addAttribute("Commcnt", cser.cntComm(postvo.getNo()));
		
		//클릭한 게시물
		PostVO pvo = mainSer.takePostVO(no);
		pvo.setFilename(mainSer.getAttach(no));
		//게시물 작성자
		ProfileVO proVO = pservice.select(pvo.getId());
		model.addAttribute("postvo", pvo);
		model.addAttribute("proVO", proVO);
		
		int re_no = pvo.getRe_no();
		if (re_no != 0) { // 리포스트한 게시물일 경우
			//클릭한 게시물의 리포스트 게시물
			PostVO repvo = mainSer.takePostVO(re_no);
			repvo.setFilename(mainSer.getAttach(re_no));
			// 클릭한 게시물의 리포스트 게시물 작성자
			ProfileVO reProVO = pservice.select(repvo.getId());
			model.addAttribute("repvo", repvo);
			model.addAttribute("reProVO", reProVO);
		}
		return "myPost";
	}

	
	



}
