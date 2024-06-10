package controller;

import javax.inject.Inject;
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

import service.IF_JoinService;
import service.IF_LoginService;
import vo.MemberVO;


@Controller
public class LoginController {

	@Inject
	IF_JoinService jservice;

	@Inject
	IF_LoginService lservice;
	
	@GetMapping("/loginpage")
	public String loginpage() throws Exception {

		return "loginForm";
	}
	
	@PostMapping("loginchk")
	public String login(@RequestParam("id")String id, @RequestParam("pass")String pass, HttpSession session,Model model) throws Exception {
		if(chkdup(id)=="true") {
			System.out.println("id 없음");
			model.addAttribute("msg","존재하지않는 아이디입니다.");
			return "redirect:/loginpage";
		};
		MemberVO mvo = lservice.loginser(id);
		if(mvo != null) {
			if(mvo.getPass().equals(pass)) {
				//로그인 성공
				//세션처리
				// 이때 서버는 쿠키를 만들고 세션영역을 쿠키로 구분이 가능하다. 
				// 클라이언트는 접속시 쿠키값을 서버에 전송하고, 서버에서는 쿠키값을 참고하여 세션에서 등록 된 변수값을 가져온다.
				if(session.getAttribute("userid") != null) {// 쓰레기 있다면
					session.removeAttribute("userid");   // 지워라
					session.removeAttribute("username");   // 지워라
					session.removeAttribute("grade");   // 지워라
				}
				session.setAttribute("userid", mvo.getId());
				session.setAttribute("username", mvo.getName());
				session.setAttribute("grade", "vip");
				
			}else {
				System.out.println("비밀번호 일치 x");
				model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
				return "redirect:/loginpage";
			}
		}
		
		
		return "redirect:/main";
	}

			
		
	
	@GetMapping("/test")
	public String test() throws Exception {

		return "test";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/loginpage";
	}
	
	

	@GetMapping("/join")
	public String join() throws Exception {

		return "joinForm";
	}


	@RequestMapping(value = "/JoinMember", method = RequestMethod.POST)
	public String inputsave(@ModelAttribute MemberVO mvo) throws Exception { // 이건 클라이언트가 요청한 파라미터의 변수명과 VO의 이름이 같아야함


		jservice.inputMember(mvo); //컨트롤러는 서비스 단한테 저장서비스를 지시
		return "redirect:/profile"; // 매핑에 대한 이름
	}

	@RequestMapping(value="/chkid", method = RequestMethod.GET)
	@ResponseBody
	public String chkdup(@RequestParam("nowid") String nowid) throws Exception {
		
		return jservice.chkid(nowid);
	}
}
