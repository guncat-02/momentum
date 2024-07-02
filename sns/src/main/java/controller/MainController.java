package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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
import service.IF_FollowListService;
import service.IF_MainService;
import service.IF_ProfileService;
import vo.PostVO;
import vo.ProfileVO;

@Controller
@EnableAsync
public class MainController {
	@Inject
	IF_MainService mser;
	@Inject
	IF_CommService cser;
	@Inject
	IF_ProfileService pser;
	@Inject
	IF_FollowListService fser;
	
	// 세션 로그인 유저가 팔로우하는 아이디 리스트
	List<String> followIdList;
	// 세션 로그인 유저가 팔로우하는 아이디에 대해 출력된 게시물 번호
	List<Integer> selectedPostNoList = new ArrayList<>();

	@GetMapping("main")
	public String mint(Model model, HttpSession session) throws Exception {
		String sessionId = (String)session.getAttribute("userid");
		// 로그인 유저가 팔로우하는 아이디
		followIdList = fser.getFollowingsId(sessionId);
		// 로그인 유저의 아이디도 추가.
		// main에서 나의 게시물도 볼 수 있도록.
		followIdList.add(sessionId);
		
		// 로그인 유저가 팔로우하는 아이디의 게시물의 rownum max값.
		int maxNum = mser.getCurMaxNum(followIdList);
		
		
		// Paging을 위한 번호와 where절의 id 저장한 hashmap 사용.
		HashMap<String, Object> fPostMap = new HashMap<>();
		fPostMap.put("pageNo", maxNum);
		fPostMap.put("fList", followIdList);
		
		List<PostVO> postList = mser.getFollowingPostList(fPostMap);
		for (PostVO pvo : postList) {
			// 파일 추가
			pvo.setFilename(mser.getAttach(pvo.getNo()));
			// 현재 출력 된 게시물 번호 미리 저장. 추후 추천 게시물에서는 출력되지 않도록 하기 위함.
			selectedPostNoList.add((Integer)pvo.getNo());
			System.out.println(pvo.toString());
		}
		
		for(PostVO pvo : postList) {
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
		
		model.addAttribute("aList", postList);
		model.addAttribute("profilelist",pser.allprofileList());
		model.addAttribute("maxNum", maxNum);
		return "main";
	}
	
	@GetMapping("p_show")
	@ResponseBody
	public void p_show(@RequestParam("no") int no) throws Exception {
		mser.p_show(no);
	}
	
	@PostMapping("p_love")
	@ResponseBody
	public void p_love(@RequestParam("no") int no,HttpSession session) throws Exception {
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", String.valueOf(session.getAttribute("userid")));
		params.put("no", no);
		mser.p_love(params);
	}
	
	@PostMapping("p_loveCancel")
	@ResponseBody
	public void p_loveCancel(@RequestParam("no") int no,HttpSession session) throws Exception {
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", String.valueOf(session.getAttribute("userid")));
		params.put("no", no);
		mser.p_loveCancel(params);
	}
	
	@PostMapping("/chklove")
	@ResponseBody
	public List<Integer> chklove(@RequestParam("id") String id) throws Exception {

		List<Integer> p_loveList = mser.chklove(id);
		return p_loveList;
	}
	
	@GetMapping("menu-profile")
	@ResponseBody
	public ProfileVO menuProfile(HttpSession session) throws Exception {
		String curId = (String)session.getAttribute("userid");
		ProfileVO pvo = pser.select(curId);
		return pvo;
	}

	@GetMapping("myPost")
	public String post(Model model, @ModelAttribute PostVO postvo,
			@RequestParam(value="order", required = false) String order,
			@RequestParam(value="no", required = false) int no ) throws Exception {
		// 해당 포스트 글번호의 댓글 리스트 
		model.addAttribute("commlist",cser.CommList(postvo.getNo()));
		model.addAttribute("Commcnt", cser.cntComm(postvo.getNo()));
		
		//클릭한 게시물
		PostVO pvo = mser.takePostVO(no);
		pvo.setFilename(mser.getAttach(no));
		//게시물 작성자
		ProfileVO proVO = pser.select(pvo.getId());
		model.addAttribute("postvo", pvo);
		model.addAttribute("proVO", proVO);
		
		int re_no = pvo.getRe_no();
		if (re_no != 0) { // 리포스트한 게시물일 경우
			//클릭한 게시물의 리포스트 게시물
			PostVO repvo = mser.takePostVO(re_no);
			repvo.setFilename(mser.getAttach(re_no));
			// 클릭한 게시물의 리포스트 게시물 작성자
			ProfileVO reProVO = pser.select(repvo.getId());
			model.addAttribute("repvo", repvo);
			model.addAttribute("reProVO", reProVO);
		}
		return "myPost";
	}

	// 팔로우 한 유저의 게시물 페이징
	@GetMapping("newFollowingPost")
	public String newFollowingPost(@RequestParam("pageNo")int pageNo, Model model) throws Exception {
		
		HashMap<String, Object> fPostMap = new HashMap<>();
		fPostMap.put("pageNo", pageNo);
		fPostMap.put("fList", followIdList);
		
		List<PostVO> postList = mser.getFollowingPostList(fPostMap);
		System.out.println("followingPost");
		for (PostVO pvo : postList) {
			// 파일 선택
			pvo.setFilename(mser.getAttach(pvo.getNo()));
			// 현재 출력 된 게시물 번호 미리 저장. 추후 추천 게시물에서는 출력되지 않도록 하기 위함.
			selectedPostNoList.add((Integer)pvo.getNo());
			System.out.println(pvo.toString());
		}
		for(PostVO pvo : postList) {
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
	
		
		model.addAttribute("aList", postList);
		model.addAttribute("profilelist",pser.allprofileList());
		
		
		System.out.println("new following page is ready");
		return "main";
	}
	
	// 팔로우한 유저 게시물 페이징 이후 추천 게시물 페이징
	@GetMapping("newRecomPost")
	public String newRecomPost(@RequestParam("pageNo")int pageNo, Model model) throws Exception {
		
		for (Integer i : selectedPostNoList) {
			System.out.print(i+" ");			
		}
		System.out.println();
		
		HashMap<String, Object> recomMap = new HashMap<>();
		recomMap.put("exList", selectedPostNoList);
		recomMap.put("pageNo", pageNo);
		
		List<PostVO> postList = mser.getRecommendPostList(recomMap);
		for(PostVO pvo : postList) {
			pvo.setFilename(mser.getAttach(pvo.getNo()));
			System.out.println(pvo.toString());
		}
		for(PostVO pvo : postList) {
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
		model.addAttribute("aList", postList);
		model.addAttribute("profilelist",pser.allprofileList());
		
		System.out.println("new recom page is ready");
		return "main";
	}
	

}
