package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_CommService;
import service.IF_MainService;
import service.IF_ProfileService;
import vo.PostVO;

@Controller
@EnableAsync
public class MainController {
	@Inject
	IF_MainService mser;
	@Inject
	IF_CommService cser;
	@Inject
	IF_ProfileService pser;

	@GetMapping("main")
	public String mint(Model model, HttpSession session) throws Exception {

		List<PostVO> attachList = mser.attachAll();
		for(PostVO pvo : attachList) {
			int ccnt = mser.takeCommCnt(pvo.getNo());
			int p_love = mser.takeP_loveCnt(pvo.getNo());
			int reCnt = mser.takeReCnt(pvo.getNo());
			// 해당 글의 댓글 수
			pvo.setCommCnt(ccnt);
			// 해당 글의 좋아요 수
			pvo.setP_love(p_love);
			// 해당 글의 리포스트 수
			pvo.setReCnt(reCnt);
		}
		model.addAttribute("aList", attachList);
		model.addAttribute("profilelist",pser.allprofileList());
		return "main";
	}

	@GetMapping("myPost")
	public String post(Model model, @ModelAttribute PostVO postvo, @RequestParam(value="order", required = false) String order,@RequestParam(value="no", required = false) int no ) throws Exception {
		// 해당 포스트 글번호의 댓글 리스트 
			model.addAttribute("commlist",cser.CommList(postvo.getNo())); 
			model.addAttribute("Commcnt", cser.cntComm(postvo.getNo()));
			model.addAttribute("postvo", mser.takePostVO(no));
	
		
		

		return "myPost";
	}
	
	@GetMapping("p_show")
	@ResponseBody
	public void p_show(@RequestParam("no") int no) throws Exception {
		mser.p_show(no);
	}
}
