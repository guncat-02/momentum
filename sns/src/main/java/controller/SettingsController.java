package controller;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping("/settings_load.do")
	public void loadJSP(HttpServletRequest req, HttpServletResponse res, @RequestParam("page") String page) throws Exception {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/settings_options/"+page+".jsp");
		rd.forward(req, res);
	}
	
	@PostMapping("/settings_certifyPass")
	public void certifyPass(HttpServletRequest req, HttpServletResponse res, @ModelAttribute MemberVO mvo) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
		res.getWriter().print(sservice.certifyPass(mvo));
	}
	
	@PostMapping("/settings_change_name")
	public void changeName(HttpServletRequest req, HttpServletResponse res, @ModelAttribute MemberVO mvo) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
		res.getWriter().print(sservice.changeName(mvo));
	}
	
	@PostMapping("/settings_delete_account")
	public void deleteAccount(HttpServletRequest req, HttpServletResponse res, @RequestParam("id") String id) throws Exception {
		
	}
	

}
