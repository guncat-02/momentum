package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_ManagerService;

@Controller
public class ManagerController {
	
	@Inject
	IF_ManagerService mservice;
	
	@GetMapping("/manager") 
	public String managePage(HttpSession session, Model model) throws Exception {
		model.addAttribute("curId", session.getAttribute("userid"));
		return "manageDashboard";
	}
	
	@GetMapping("/manager/user/*")
	public String manageUser(HttpSession session, Model model, HttpServletRequest req) throws Exception {
		
		model.addAttribute("curId", (String)session.getAttribute("userid"));
		
		String[] uri = req.getRequestURI().split("/");
		String curType = uri[uri.length-1].split("\\?")[0];
		
		if (curType.equals("user") || curType.equals("member")) {
			model.addAttribute("users", mservice.getAllMembers());
		} else if (curType.equals("profile")) {
			model.addAttribute("profiles", mservice.getAllProfiles());
		} else if (curType.equals("post")) {
			model.addAttribute("posts", mservice.getAllPosts());
		} else if (curType.equals("admin")) {
			model.addAttribute("users", mservice.getAllAdmins());
		} else if (curType.equals("banned")) {
//			model.addAttribute("users", mservice)
		} else if (curType.equals("comm")) {
			model.addAttribute("comms", mservice.getAllComms());
		} else {
			return "redirect:/manager";
		}
		
		return "manageUser";
		
	}
	
	@GetMapping("/manager/search")
	public String searchInUser(Model model, @RequestParam("searchArea")String area) {
		System.out.println(area);
		if (area.equals("User")) {
			
		} else if (area.equals("Report")) {
			
		} else {
			return "redirect:/manager";
		}
		return "manage"+area;
	}
}
