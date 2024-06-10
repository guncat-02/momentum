package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import vo.MemberVO;


@Controller
public class LoginController {

	@Inject
	IF_JoinService jservice;

	@Inject
	IF_LoginService lservice;
	
	@GetMapping("/loginpage")
	public String loginpage(Model model) throws Exception {
		
		return "loginForm";
	}
	
	@PostMapping("loginchk")
	public String login(@RequestParam("id")String id, @RequestParam("pass")String pass, HttpSession session,RedirectAttributes rt) throws Exception {
		if(chkdup(id)=="true") {
			System.out.println("id 없음");
			rt.addFlashAttribute("msg", "존재하지않는 아이디입니다.");
			return "redirect:loginpage";
		};
		MemberVO mvo = lservice.loginser(id);
		if(mvo != null) {
			if(mvo.getPass().equals(pass)) {
				if(session.getAttribute("userid") != null) {
					session.removeAttribute("userid");  
					session.removeAttribute("username");  
				}
				session.setAttribute("userid", mvo.getId());
				session.setAttribute("username", mvo.getName());
				
			}else {
				System.out.println("비밀번호 일치 x");
				rt.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
				return "redirect:loginpage";
			}
		}
		
		
		return "redirect:/test";
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
		return "redirect:loginpage"; // 매핑에 대한 이름
	}

	@RequestMapping(value="/chkid", method = RequestMethod.GET)
	@ResponseBody
	public String chkdup(@RequestParam("nowid") String nowid) throws Exception {
		
		return jservice.chkid(nowid);
	}
	
}
