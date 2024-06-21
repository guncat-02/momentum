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
import vo.PostVO;

@Controller
@EnableAsync
public class MainController {
	@Inject
	IF_MainService mainSer;
	
	@Inject
	IF_CommService cser;

	@GetMapping("main")
	public String mint(Model model, HttpSession session) throws Exception {

		List<PostVO> attachList = mainSer.attachAll();
		model.addAttribute("aList", attachList);
		return "main";
	}

	@GetMapping("myPost")
	public String post(Model model, @ModelAttribute PostVO postvo, @RequestParam(value="order", required = false, defaultValue="likeorder") String order,@RequestParam(value="no", required = false) int no ) throws Exception {
		
		// 해당 포스트 글번호의 댓글 리스트 
		System.out.println(order+"//");
		if(order.equals("latest")) {
			model.addAttribute("Commcnt", cser.cntComm(no));
			model.addAttribute("commlist",cser.CommList(no)); 
			model.addAttribute("postvo", postvo);
		}else if(order.equals("likeorder")) {
			System.out.println("like넘어와");
			model.addAttribute("Commcnt", cser.cntComm(no));
			model.addAttribute("commlist",cser.orderlikecomm(no));
			model.addAttribute("postvo", postvo);
		}else {
			model.addAttribute("commlist",cser.CommList(postvo.getNo())); 
			model.addAttribute("Commcnt", cser.cntComm(postvo.getNo()));
			model.addAttribute("postvo", postvo);
		}
		
		
		

		return "myPost";
	}


}
