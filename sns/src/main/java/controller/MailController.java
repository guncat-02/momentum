package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_JoinService;
import service.MailService;


@Controller
@EnableAsync//비동기로 동작하게 하는 어노테이션
public class MailController {
		
	@Autowired
	private MailService mailService;
	
	@Inject
	IF_JoinService jservice;
	
	@RequestMapping(value = "/sendMail.do", method= RequestMethod.GET)
	@ResponseBody
	public String sendSimpleMail(HttpServletRequest request,HttpServletResponse response, @RequestParam("email") String email,@RequestParam("id") String id) throws Exception
	{
		
		int ran = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
		String code = Integer.toString(ran);
		if(jservice.chkemail(id).equals(email)) {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			mailService.sendMail(email,"Momentum 이메일 인증","인증번호: "+code);
			
		}
		else {
			code="null";
		}
		
		return code;
	}
	
	@RequestMapping(value = "/sendJoinMail.do", method= RequestMethod.GET)
	@ResponseBody
	public String sendJoinMail(HttpServletRequest request,HttpServletResponse response, @RequestParam("email") String email) throws Exception
	{
		
		int ran = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
		String code = Integer.toString(ran);
		
		if(jservice.chkdupemail(email)==null) {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			mailService.sendMail(email,"Momentum 이메일 인증","인증번호: "+code);
			
		}
		else {
			code="null";
		}
		
		return code;
	}
	
}

