package controller;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_SettingsService;
import vo.MemberVO;

@Controller
public class SettingsController {
	
	@Inject
	IF_SettingsService sservice;

	@GetMapping("/settings")
	public String settings() {
		return "settings";
	}
	
	@PostMapping("/settings-load.do")
	public void loadJSP(HttpServletRequest req, HttpServletResponse res, @RequestParam("page") String page) throws Exception {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/settings_options/"+page+".jsp");
		rd.forward(req, res);
	}
	
	@PostMapping("/settings-certifyPass")
	public void certifyPass(HttpServletResponse res, @ModelAttribute MemberVO mvo) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
		res.getWriter().print(sservice.certifyPass(mvo));
	}
	
	@PostMapping("/settings-change-name")
	public void changeName(HttpServletResponse res, @ModelAttribute MemberVO mvo) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
		res.getWriter().print(sservice.changeName(mvo));
	}
	
	@PostMapping("/settings-delete-account")
	@ResponseBody
	public boolean deleteAccount(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		if (sservice.deleteAccount((String)session.getAttribute("userid")) != 0) {
			return true;
		}
		return false;
	}
	

}
