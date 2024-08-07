package interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import service.IF_ManagerService;
import util.CookieUtil;

public class Interceptor extends HandlerInterceptorAdapter{
	@Inject
	IF_ManagerService mser;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Object getSession = session.getAttribute("userid"); // 세션에서 값을 가져옵니다.

		if(getSession == null) { // 로그인한 사람아님
			response.sendRedirect(request.getContextPath()+"/loginpage"); // 처음 화면으로 돌아가
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}


