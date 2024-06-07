package controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_JoinService;
import vo.MemberVO;


@Controller
public class LoginController {

	@Inject
	IF_JoinService jservice;

	@GetMapping("/login")
	public String login() throws Exception {

		return "loginForm";
	}

	@GetMapping("/join")
	public String join() throws Exception {

		return "joinForm";
	}


	@RequestMapping(value = "/JoinMember", method = RequestMethod.POST)
	public String inputsave(@ModelAttribute MemberVO mvo) throws Exception { // 이건 클라이언트가 요청한 파라미터의 변수명과 VO의 이름이 같아야함


		jservice.inputMember(mvo); //컨트롤러는 서비스 단한테 저장서비스를 지시
		return "redirect:login"; // 매핑에 대한 이름
	}

	@RequestMapping(value="/chkid", method =RequestMethod.GET)
	@ResponseBody
	public String chkdup(@RequestParam("nowid") String nowid) throws Exception {
		
		return jservice.chkid(nowid);
	}
}
