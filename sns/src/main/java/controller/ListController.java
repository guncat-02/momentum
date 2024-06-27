package controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import service.IF_FollowListService;
import vo.ProfileVO;

@Controller
public class ListController {

	@Inject
	IF_FollowListService fservice;
	
	
	@GetMapping("/settings_fnb_list")
	public String fnbList(Model model) throws Exception {	
		model.addAttribute("followings", fservice.getFollowingsProfile("brian332"));
		model.addAttribute("interfollowers", fservice.getInterFollowersProfile("brian332"));
		model.addAttribute("followers", fservice.getFollowersProfile("brian332"));
		return "followAndBlockList";
	}
}
