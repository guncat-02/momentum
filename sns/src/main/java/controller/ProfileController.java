package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.IF_CommService;
import service.IF_FollowListService;
import service.IF_MainService;
import service.IF_ProfileService;
import util.FileDataUtil;
import vo.PostVO;
import vo.ProfileVO;

@Controller
public class ProfileController {
	@Inject
	IF_ProfileService pServe;
	@Inject
	IF_FollowListService fServe;
	@Inject
	IF_MainService mserve;
	@Inject
	IF_CommService cserve;

	@Inject
	FileDataUtil upload;

	// 프로필 view 불러오기
	@GetMapping("/profile")
	public String profile(@RequestParam("id") String id, Model model) throws Exception {

		model.addAttribute("id", id);
		return "profile";
	}

	// 닉네임 중복 체크
	@PostMapping("/profileChk")
	public void nickChk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickName = request.getParameter("nickName");
		response.setContentType("text/html; charset=UTF-8");
		if (pServe.chk(nickName) == 0) {
			response.getWriter().print(nickName);
		} else {
			response.getWriter().print("null");
		}
	}

	// profile table에 insert
	@PostMapping("/profileSave")
	public String insert(@ModelAttribute ProfileVO pVO, MultipartFile[] myPhoto) throws Exception {
		if (myPhoto != null) {
			pVO.setPhoto(upload.fileUpload(myPhoto)[0]);
		}
		pServe.insert(pVO);
		return "redirect:/loginpage";
	}

	// 각 개인의 profile 보기
	@GetMapping("/profileShow")
	public String profileShow(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) throws Exception {
		
		if(id==null) {
			ProfileVO p = pServe.select(String.valueOf(session.getAttribute("userid")));
			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(String.valueOf(session.getAttribute("userid"))));
			model.addAttribute("follower", fServe.followerSelect(String.valueOf(session.getAttribute("userid"))));
			List<PostVO> mypostList = mserve.myPostList(String.valueOf(session.getAttribute("userid")));
			for(PostVO pvo : mypostList) {
				int ccnt = mserve.takeCommCnt(pvo.getNo());
				int p_love = mserve.takeP_loveCnt(pvo.getNo());
				int reCnt = mserve.takeReCnt(pvo.getNo());
				pvo.setCommCnt(ccnt);
				pvo.setP_love(p_love);
				pvo.setReCnt(reCnt);
			}
			model.addAttribute("mypostList",mypostList);
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(String.valueOf(session.getAttribute("userid"))));
			return "profileShow";
		}else {
			ProfileVO p = pServe.select(id);
			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(id));
			model.addAttribute("follower", fServe.followerSelect(id));
			List<PostVO> mypostList = mserve.myPostList(id);
			for(PostVO pvo : mypostList) {
				int ccnt = mserve.takeCommCnt(pvo.getNo());
				int p_love = mserve.takeP_loveCnt(pvo.getNo());
				int reCnt = mserve.takeReCnt(pvo.getNo());
				pvo.setCommCnt(ccnt);
				pvo.setP_love(p_love);
				pvo.setReCnt(reCnt);
			}
			model.addAttribute("mypostList",mypostList);
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(id));
			return "userProfile";
		}
		
	}

	// 프로필 댓글 정보
	@GetMapping("/profileComment")
	public String profileComment(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) throws Exception {
		if(id==null) {
			ProfileVO p = pServe.select(String.valueOf(session.getAttribute("userid")));
			
			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(String.valueOf(session.getAttribute("userid"))));
			model.addAttribute("follower", fServe.followerSelect(String.valueOf(session.getAttribute("userid"))));
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(String.valueOf(session.getAttribute("userid"))));
			// 내가 쓴 댓글 리스트
			model.addAttribute("myCommList", cserve.myCommList(String.valueOf(session.getAttribute("userid"))));
			// 내가 쓴 댓글의 글 정보 리스트
			model.addAttribute("mycpList", cserve.mycpList(String.valueOf(session.getAttribute("userid"))));
			// 내가 쓴 댓글 개수
			model.addAttribute("mycommcnt", cserve.mycommcnt(String.valueOf(session.getAttribute("userid"))));
			 
		}
		else if(id!=String.valueOf(session.getAttribute("userid"))){
			ProfileVO p = pServe.select(id);
			
			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(id));
			model.addAttribute("follower", fServe.followerSelect(id));
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(id));
			// 내가 쓴 댓글 리스트
			model.addAttribute("myCommList", cserve.myCommList(id));
			// 내가 쓴 댓글의 글 정보 리스트
			model.addAttribute("mycpList", cserve.mycpList(id));
			// 내가 쓴 댓글 개수
			model.addAttribute("mycommcnt", cserve.mycommcnt(id));
		}
		
		return "profileComment";
	}

	// 프로필 날짜별 media 정보
	@GetMapping("/profileMedia")
	public String profileMedia(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) throws Exception {
		System.out.println(id+"dfdf");
		if(id==null) {
			ProfileVO p = pServe.select(String.valueOf(session.getAttribute("userid")));

			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(String.valueOf(session.getAttribute("userid"))));
			model.addAttribute("follower", fServe.followerSelect(String.valueOf(session.getAttribute("userid"))));
			model.addAttribute("myfiles", mserve.myfiles(String.valueOf(session.getAttribute("userid"))));
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(String.valueOf(session.getAttribute("userid"))));
		}else {
			ProfileVO p = pServe.select(id);
			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(id));
			model.addAttribute("follower", fServe.followerSelect(id));
			model.addAttribute("myfiles", mserve.myfiles(id));
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(id));
		}
		
		return "profileMedia";
	}
	// 좋아요 누른 게시물 모음집
	@GetMapping("/profileLove")
	public String profileLove(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) throws Exception {
		System.out.println(id+"dfdf");
		if(id==null) {
			ProfileVO p = pServe.select(String.valueOf(session.getAttribute("userid")));

			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(String.valueOf(session.getAttribute("userid"))));
			model.addAttribute("follower", fServe.followerSelect(String.valueOf(session.getAttribute("userid"))));
			List<PostVO> lovepostList = mserve.lovePostList(String.valueOf(session.getAttribute("userid")));
			for(PostVO pvo : lovepostList) {
				int ccnt = mserve.takeCommCnt(pvo.getNo());
				int p_love = mserve.takeP_loveCnt(pvo.getNo());
				int reCnt = mserve.takeReCnt(pvo.getNo());
				pvo.setCommCnt(ccnt);
				pvo.setP_love(p_love);
				pvo.setReCnt(reCnt);
			}
			model.addAttribute("lovepostList",lovepostList);
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(String.valueOf(session.getAttribute("userid"))));
			// 프로필 사진이 있는 모든 프로필 리스트
			model.addAttribute("profilelist",pServe.allprofileList());
		}else {
			ProfileVO p = pServe.select(id);

			model.addAttribute("profile", p);
			model.addAttribute("following", fServe.followingSelect(id));
			model.addAttribute("follower", fServe.followerSelect(id));
			List<PostVO> lovepostList = mserve.lovePostList(id);
			for(PostVO pvo : lovepostList) {
				int ccnt = mserve.takeCommCnt(pvo.getNo());
				int p_love = mserve.takeP_loveCnt(pvo.getNo());
				int reCnt = mserve.takeReCnt(pvo.getNo());
				pvo.setCommCnt(ccnt);
				pvo.setP_love(p_love);
				pvo.setReCnt(reCnt);
			}
			model.addAttribute("lovepostList",lovepostList);
			// 글 쓴 개수
			model.addAttribute("postlength", mserve.postLength(id));
			model.addAttribute("profilelist",pServe.allprofileList());
		}
		
		return "profileLove";
	}

	// 프로필 수정
	@PostMapping("/profileUpdate")
	public String update(@ModelAttribute ProfileVO pVO, MultipartFile[] proPhoto, HttpSession session) throws Exception {
		pVO.setId(String.valueOf(session.getAttribute("userid")));
		pVO.setNickName(String.valueOf(session.getAttribute("nickName")));
		String file = upload.fileUpload(proPhoto)[0];
		if (file != null) {
			pVO.setPhoto(file);
		} else {
			if (pVO.getPhoto().equals("COMPLETE")) {
				pVO.setPhoto(null);
			}
		}
		pServe.update(pVO);
		return "redirect:/profileShow";
	}
	
	//프로필 수정 화면 띄우기
	@GetMapping("/profileEdit")
	public String profileEdit(Model model, HttpSession session) throws Exception {
		ProfileVO p = pServe.select(String.valueOf(session.getAttribute("userid")));
		model.addAttribute("profile", p);
		return "profileEdit";
	}
	
	//다른 유저 프로필
	@GetMapping("userprofile")
	public String userProfile(@RequestParam("id") String id, Model model) throws Exception {
		model.addAttribute("profile", pServe.select(id));
		model.addAttribute("following", fServe.followingSelect(id));
		model.addAttribute("follower", fServe.followerSelect(id));
		model.addAttribute("postlength", mserve.postLength(id));
		List<PostVO> mypostList = mserve.myPostList(id);
		for(PostVO pvo : mypostList) {
			int ccnt = mserve.takeCommCnt(pvo.getNo());
			pvo.setCommCnt(ccnt);
		}
		model.addAttribute("mypostList",mypostList);
		return "userProfile";
	}
}
