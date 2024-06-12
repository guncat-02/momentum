package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String followList(Model model) {
		return "followList";
	}
	
	@GetMapping("/followcancel")
	@ResponseBody
	public List<ProfileVO> followCancel(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo) throws Exception {
		fservice.unfollow(fvo);
		return fservice.getFollowingsProfile(fvo.getId());
	}
	
	@GetMapping("/follow")
	@ResponseBody
	public List<ProfileVO> follow(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo) throws Exception {
		fservice.follow(fvo);
		return fservice.getFollowingsProfile(fvo.getId());
	}
	
	@GetMapping("/follow_followers")
	@ResponseBody
	public List<ProfileVO> getFollowers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") String id) throws Exception {
		return fservice.getFollowersProfile(id);
	}
	
	@GetMapping("/follow_interfollowers")
	@ResponseBody
	public List<ProfileVO> getInterFollowers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") String id) throws Exception {
		return fservice.getInterFollowersProfile(id);
	}
	
	@GetMapping("/follow_followings")
	@ResponseBody
	public List<ProfileVO> getFollowings(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") String id) throws Exception {
		return fservice.getFollowingsProfile(id);
	}
	
}
