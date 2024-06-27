package controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_BlockService;
import vo.BlockVO;

@Controller
public class BlockController {
	
	@Inject
	IF_BlockService bservice;

	@GetMapping("/block")
	public void block(HttpServletRequest req, HttpServletResponse res,
			HttpSession session, @ModelAttribute BlockVO bvo) throws Exception {
		if (bvo.getReason().trim() == "") {
			bvo.setReason(null);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("bvo", bvo);
		map.put("id", (String)session.getAttribute("userid"));
		bservice.block(map);
	}
	
	@GetMapping("/blockCancel")
	public void blockCancel(HttpServletRequest req, HttpServletResponse res,
			HttpSession session, @RequestParam("blockId")String blockId) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", (String)session.getAttribute("userid"));
		map.put("blockId", blockId);
		bservice.unblock(map);
	}
}
