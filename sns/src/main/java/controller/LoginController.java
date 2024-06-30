package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.IF_JoinService;
import service.IF_LoginService;
import service.IF_ProfileService;
import util.CookieUtil;
import vo.MemberVO;

@Controller
public class LoginController {

	@Inject
	IF_JoinService jservice;

	@Inject
	IF_LoginService lservice;

	@Inject
	IF_ProfileService pServe;
	
	// 소스 수정 24.06.19 우승훈.
	// 테마 변경 기능에 cookie 활용 위한 수정 진행.
	// 소스 수정 시작.
	
	// cookie 생성, 조회, 삭제, 클리어 method 정의한 controller.
	// util.CookieUtil
	@Inject
	CookieUtil cookieUtil;

	@GetMapping("/loginpage")
	public String loginpage(Model model) throws Exception {

		return "loginForm";
	}

	@PostMapping("loginchk")
	public String login(@RequestParam("id") String id, @RequestParam("pass") String pass, HttpSession session,
			RedirectAttributes rt, HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (id == "") {
			rt.addFlashAttribute("msg", "아이디 또는 비밀번호를 입력하세요.");
			return "redirect:loginpage";
		}
		if (chkdup(id) == "true") {
			rt.addFlashAttribute("msg", "존재하지않는 아이디입니다.");
			return "redirect:loginpage";
		}
		MemberVO mvo = lservice.loginser(id);

		if(mvo.getPass().equals(pass)) {
			
			// 테마 경로를 쿠키에 저장하고, view에서 활용.
			// 기존의 cookie가 있을 경우 유효 기간 갱신, 그렇지 않을 경우 생성.
			// cookie 관련 기능 동작 위해 현재 method에 매개변수로
			// HttpServletRequest와 HttpServletResponse 추가.

			// 기존 cookie value 저장.
			String cookieVal = cookieUtil.getCookie(req, "curTheme");
			if (cookieVal == null) { // 해당 cookie가 없거나 만료되었을 경우.
				// 새로운 cookie 생성. 기본으로 다크테마 적용.
				cookieUtil.setCookie(res, "curTheme", "0");
			} else { // 해당 cookie가 존재할 경우.
				// 해당 cookie 유효 기간 갱신.
				cookieUtil.setCookie(res, "curTheme", cookieVal);
			}
			
			if (mvo.getAdmin() != null) {
				if (session.getAttribute("userid") != null) {
					session.removeAttribute("userid");
					session.removeAttribute("username");
					session.removeAttribute("nickName");
					session.removeAttribute("admin");
				}
				session.setAttribute("userid", mvo.getId());
				session.setAttribute("username", mvo.getName());
				session.setAttribute("nickName", pServe.matchId(mvo.getId()));
				session.setAttribute("admin", mvo.getAdmin());
				rt.addFlashAttribute("msg", "manager");
				return "redirect:loginpage";
			}else{
				if (session.getAttribute("userid") != null) {
					session.removeAttribute("userid");
					session.removeAttribute("username");
					session.removeAttribute("nickName");
				}
				session.setAttribute("userid", mvo.getId());
				session.setAttribute("username", mvo.getName());
				session.setAttribute("nickName", pServe.matchId(mvo.getId()));
				
				return "redirect:main";
			}
		}else {
			System.out.println("비밀번호 일치 x");
			rt.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:loginpage";
		}

		

	}

	@GetMapping("/pServe")
	public String test() throws Exception {

		return "test";
	}

	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		session.invalidate();
		cookieUtil.clearCookie(req, res);
		return "redirect:/loginpage";
	}

	@GetMapping("/join")
	public String join() throws Exception {

		return "joinForm";
	}

	@RequestMapping(value = "/joinMember", method = RequestMethod.POST)
	public String inputsave(@ModelAttribute MemberVO mvo, Model model) throws Exception { // 이건 클라이언트가 요청한 파라미터의 변수명과
																							// VO의 이름이 같아야함

		jservice.inputMember(mvo); // 컨트롤러는 서비스 단한테 저장서비스를 지시
		model.addAttribute("id", mvo.getId());
		return "redirect:/profile"; // 매핑에 대한 이름
	}

	@RequestMapping(value = "/chkid", method = RequestMethod.GET)
	@ResponseBody
	public String chkdup(@RequestParam("nowid") String nowid) throws Exception {

		return jservice.chkid(nowid);
	}

	@GetMapping("/loginFindId")
	public String findPw() throws Exception {

		return "findPw";
	}
	@GetMapping("/loginidchk")
	@ResponseBody
	public String idchk(@RequestParam("id") String id) throws Exception {
		return lservice.chkidser(id);
	}

	@PostMapping("/loginpwupdate")
	public String updatepw(@ModelAttribute MemberVO mvo) throws Exception {
		lservice.updatepw(mvo);

		return "redirect:/loginpage";
	}
}
