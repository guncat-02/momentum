package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import service.IF_FollowListService;

@Controller
public class ListController {

	@Inject
	IF_FollowListService fservice;
	
	
	@GetMapping("/list_fnb/**")
	public String fnbList(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("userid");
		model.addAttribute("followings", fservice.getFollowingsProfile(id));
		model.addAttribute("interfollowers", fservice.getInterFollowersProfile(id));
		model.addAttribute("followers", fservice.getFollowersProfile(id));
		return "followAndBlockList";
	}
}
