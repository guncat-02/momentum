package controller;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_BlockService;
import service.IF_FollowListService;
import service.IF_ProfileService;
import util.FileDataUtil;
import vo.BlockVO;
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
	
	@Inject
	IF_BlockService bservice;
	
	@GetMapping("/followList/*") // '/sns/followList/'이후 하나의 식별자에 대한 모든 request 받는다.
	public String followList(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam(value = "id", required = false)String reqId) throws Exception {
		
		String id; // list에 보이는 프로필을 가져올 기준 id
		String curId = (String)session.getAttribute("userid"); // 현재 session의 id
		if (reqId != null) {
			id = reqId;
		} else {
			id = curId;
		}
		
		// 'followList' 이후의 식별자 판단
		String[] uri = req.getRequestURI().split("/"); // '/'기준으로 uri 나눈다.
		String curType = uri[uri.length-1].split("\\?")[0]; // '?'기준으로 uri 나눈다. 특수문자 escape 처리.
		
		List<ProfileVO> fList;
		
		// 'followList' 이후의 식별자에 따라 DB에서 가져오는 데이터 다르게 함.
		if (curType.equals("followList") || curType.equals("followings")) {
			fList = fservice.getFollowingsProfile(id);
		} else if (curType.equals("followers")) {
			// 하나의 list에 또다른 list 요소를 이어붙이는 방법. Collections.addAll() method.
			fList = fservice.getInterFollowersProfile(id);
			Collections.addAll(fList, fservice.getFollowersProfile(id).toArray(new ProfileVO[0]));
		} else { // 이외의 요청의 경우 main으로 돌려보낸다.
			return "redirect:/main";
		}
		// curId가 팔로우하는 유저 id 저장.
		// view에서 목록의 유저에 내가 팔로우 하는 유저가 있을 경우와 없을 경우에 따른 버튼 디자인 다르게 한다.
		List<String> curIdList = fservice.getFollowingsId(curId);
		
		model.addAttribute("followFlag", curIdList);
		model.addAttribute("fList", fList);
		model.addAttribute("reqId", id);
		return "followList";
	}
	
	@GetMapping("/followcancel")
	@ResponseBody
	public int followCancel(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo) throws Exception {
		return fservice.unfollow(fvo);
	}
	
	@GetMapping("/follow")
	@ResponseBody
	public int follow(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FollowVO fvo, @ModelAttribute BlockVO bvo) throws Exception {
		bvo.setId(fvo.getId());
		bvo.setBlockId(fvo.getFollowId());
		int blockFlag = bservice.chkBlocked(bvo);
		if (blockFlag != 0) {
			return -1;
		} else {
			return fservice.follow(fvo);
		}
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
