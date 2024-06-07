package controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import service.IF_FollowListService;
import util.FileDataUtil;
import vo.FollowVO;

@Controller
public class FollowListController {

	@Inject
	FileDataUtil fileDataUtil;
	
	@Inject
	IF_FollowListService fservice;
	
	@GetMapping("/followList")
	public String followList(@ModelAttribute FollowVO fvo, Model model) throws Exception {
		// fvo를 ModelAttribute로 받아오고, 세션의 로그인한 id를 해당 객체의 List<String> id의 0번 인덱스에 대입.
		// 해당 fvo 객체를 전달 및 받아서 model 객체에 추가.
		// 추후 ajax를 통해 내가 팔로우하는 사람과 나를 팔로우하는 사람을 받아와서 출력.
//		fvo.getId().add(id);
//		model.addAttribute("followers", fservice.selectFollowers(fvo));
		return "followList";
	}
	
}
