package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_BlockService;
import service.IF_FollowListService;

@Controller
public class ListController {

	@Inject
	IF_FollowListService fservice;
	
	@Inject
	IF_BlockService bservice;
	
	
	@GetMapping("/list_fnb/*")
	public String fnbList(Model model, HttpSession session, HttpServletRequest req) throws Exception {
		
		String id = (String)session.getAttribute("userid");
		
		String[] uri = req.getRequestURI().split("/");
		String curType = uri[uri.length-1].split("\\?")[0];
		// list_fnb 이후의 식별자에 따라 DB에서 가져오는 데이터를 다르게 함.
		if (curType.equals("list_fnb") || curType.equals("followings")) {
			model.addAttribute("followings", fservice.getFollowingsProfile(id));
		} else if (curType.equals("followers")) {
			model.addAttribute("interfollowers", fservice.getInterFollowersProfile(id));
			model.addAttribute("followers", fservice.getFollowersProfile(id));
		} else if (curType.equals("blocked")) {
			model.addAttribute("blocked", bservice.getBlocked(id));
		} else { // 이외의 요청의 경우 main으로 돌려보낸다.
			return "redirect:/main";
		}
		
		return "followAndBlockList";
	}
}
