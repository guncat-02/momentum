package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import service.IF_FollowListService;
import util.FileDataUtil;
import vo.FollowVO;
import vo.ProfileVO;

@Controller
public class FollowListController {

	@Inject
	FileDataUtil fileDataUtil;
	
	@Inject
	IF_FollowListService fservice;
	
	@GetMapping("/followList")
	public String followList(Model model) throws Exception {
		
		// 매개변수 "hello"는 Session 에 로그인한 사용자의 id 정보이다.
		List<ProfileVO> interFollowers = fservice.getInterFollowersProfile("hello");	// 나의 맞팔 팔로워
		List<ProfileVO> followers = fservice.getFollowersProfile("hello");				// 나의 맞팔 X 팔로워
		List<ProfileVO> followings = fservice.getFollowingsProfile("hello");			// 나의 팔로윙
		
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
