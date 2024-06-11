package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import service.IF_FollowListService;
import service.IF_ProfileService;
import util.FileDataUtil;
import vo.FollowVO;
import vo.ProfileVO;

@Controller
public class FollowListController {

	@Inject
	FileDataUtil fileDataUtil;
	
	@Inject
	IF_FollowListService fservice;
	
	@Inject
	IF_ProfileService pservice;
	
	@GetMapping("/followList")
	public String followList(Model model) throws Exception {
		
		// 매개변수는 Session에서 가져온다.
		List<ProfileVO> interFollowers = fservice.getInterFollowersProfile("brian332");	// 나의 맞팔 팔로워
		List<ProfileVO> followers = fservice.getFollowersProfile("brian332");			// 나의 맞팔 X 팔로워
		List<ProfileVO> followings = fservice.getFollowingsProfile("brian332");			// 나의 팔로윙
		
		System.out.println("followings");
		for (ProfileVO pvo : followings) {
			System.out.println(pvo.toString());
		}
		
		System.out.println("\ninterFollowers");
		for (ProfileVO pvo : interFollowers) {
			System.out.println(pvo.toString());
		}
		
		System.out.println("\nfollowers");
		for (ProfileVO pvo : followers) {
			System.out.println(pvo.toString());
		}
		
		
		model.addAttribute("interFollowersProfile", interFollowers);
		model.addAttribute("followersProfile", followers);
		model.addAttribute("followingsProfile", followings);

		return "followList";
	}
	
	@GetMapping("/unfollow")
	public void unfollow(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo) throws Exception {
		fservice.unfollow(fvo);
	}
	
	@GetMapping("/follow")
	public void follow(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo) throws Exception {
		fservice.follow(fvo);
	}
	
}
