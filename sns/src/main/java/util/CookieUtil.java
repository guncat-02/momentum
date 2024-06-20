package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

@Controller
public class CookieUtil {

	
	public void setCookie(HttpServletResponse res, String key, String value) {
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge(60*60); // 1h. 60s*60m.
		cookie.setPath("/"); // 모든 path에서 접근 가능.
		res.addCookie(cookie);
	}
	
	public String getCookie(HttpServletRequest req, String key) {
		Cookie[] cookies = req.getCookies();
		for (Cookie c : cookies) {
			// method의 매개변수로 넘긴 값을 Key로 하는 cookie 있을 경우
			if (c.getName().equals(key)) {
				// 그 cookie의 value를 return.
				return c.getValue();
			}
		}
		return null;
	}
	
	public void removeCookie(HttpServletResponse res, String key) {
		Cookie cookie = new Cookie(key, null);
		cookie.setMaxAge(0);
		res.addCookie(cookie);
	}
	
	public void clearCookie(HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				c.setMaxAge(0);
				res.addCookie(c);
			}
		}
	}
	
	
	
}
