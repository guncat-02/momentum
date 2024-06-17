package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import service.IF_ProfileService;
import util.FileDataUtil;
import vo.ProfileVO;

@Controller
public class ProfileController {
	@Inject
	IF_ProfileService pServe;
	
	@Inject
	FileDataUtil upload;
	
	//프로필 view 불러오기
	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	//닉네임 중복 체크
	@PostMapping("/profileChk")
	public void nickChk(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String nickName = request.getParameter("nickName");
		response.setContentType("text/html; charset=UTF-8");
		if(pServe.chk(nickName) == 0) {
			response.getWriter().print(nickName);
		} else {
			response.getWriter().print("null");
		}
	}
	
	//profile table에 insert
	@PostMapping("/profileSave")
	public String insert(@ModelAttribute ProfileVO pVO, MultipartFile[] myPhoto) throws Exception {
		if(myPhoto != null) {
			pVO.setPhoto(upload.fileUpload(myPhoto)[0]);
		}
		pServe.insert(pVO);
		return "redirect:/main";
	}
	
	//각 개인의 profile 보기
	@GetMapping("/profileShow")
	public String profileShow(Model model) throws Exception {
		ProfileVO p = pServe.select("nuit0204");
		if(p.getPhoto() == null) {
			p.setPhoto("./resources/img/프로필.png");
		}
		model.addAttribute("profile", p);
		return "profileShow";
	}
}
