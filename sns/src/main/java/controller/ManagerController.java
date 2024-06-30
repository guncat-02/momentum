package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import service.IF_ManagerService;
import vo.ManagerVO;
import vo.PageVO;

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
	public String manageUser(HttpSession session, Model model, HttpServletRequest req,
			@ModelAttribute PageVO pvo, @ModelAttribute ManagerVO mvo) throws Exception {
		
		model.addAttribute("curId", (String)session.getAttribute("userid"));
		
		System.out.println(mvo.toString());
		
		String[] uri = req.getRequestURI().split("/");
		String curType = uri[uri.length-1].split("\\?")[0];
		
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		}
		
		if (curType.equals("user")) {
			pvo.setSearchLoc("member");
		} else if (curType.equals("banned")) {
			pvo.setSearchLoc("ban");
		} else {
			pvo.setSearchLoc(curType);
		}
		System.out.println(mvo.toString());
		System.out.println(pvo.toString());
		int cnt = mservice.getTotalCount(pvo);
		System.out.println(cnt);
		pvo.setTotalCount(cnt);
		
		
		if (curType.equals("user") || curType.equals("member")) {
			model.addAttribute("users", mservice.getAllMembers(pvo));
		} else if (curType.equals("profile")) {
			model.addAttribute("profiles", mservice.getAllProfiles(pvo));
		} else if (curType.equals("post")) {
			model.addAttribute("posts", mservice.getAllPosts(pvo));
		} else if (curType.equals("admin")) {
			model.addAttribute("users", mservice.getAllAdmins(pvo));
		} else if (curType.equals("banned")) {
//			model.addAttribute("users", mservice)
		} else if (curType.equals("comm")) {
			model.addAttribute("comms", mservice.getAllComms(pvo));
		} else {
			return "redirect:/manager";
		}
		
		model.addAttribute("pagevo", pvo);
		model.addAttribute("curURI", req.getRequestURI());
		model.addAttribute("cnt", cnt);
		return "manageUser";
		
	}
	
	@GetMapping("/manager/search")
	public String searchInUser(HttpServletRequest req, Model model, @RequestParam("searchArea")String area,
			@ModelAttribute PageVO pvo) throws Exception {
		String loc = pvo.getSearchLoc();
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		}
		int cnt = 0;
		System.out.println(pvo.toString());

		System.out.println(area);
		if (area.equals("User")) {
			if (loc.equals("member")) {
				cnt = mservice.getMembersSearchCount(pvo);
				pvo.setTotalCount(cnt);
				model.addAttribute("users", mservice.searchMembers(pvo));
			} else if (loc.equals("profile")) {
				cnt = mservice.getProfilesSearchCount(pvo);
				pvo.setTotalCount(cnt);
				model.addAttribute("profiles", mservice.searchProfiles(pvo));
			} else if (loc.equals("post")) {
				cnt = mservice.getPostsSearchCount(pvo);
				pvo.setTotalCount(cnt);
				model.addAttribute("posts", mservice.searchPosts(pvo));
			} else if (loc.equals("comm")) {
				cnt = mservice.getCommsSearchCount(pvo);
				pvo.setTotalCount(cnt);
				model.addAttribute("comms", mservice.searchComms(pvo));
			} else if (loc.equals("admin")) {
				cnt = mservice.getAdminsSearchCount(pvo);
				pvo.setTotalCount(cnt);
				model.addAttribute("users", mservice.searchAdmins(pvo));
			} else if (loc.equals("banned")) {
//				
			}
		} else if (area.equals("Report")) {
			
		} else {
			return "redirect:/manager";
		}
		model.addAttribute("pagevo", pvo);
		model.addAttribute("curURI", req.getRequestURI());
		model.addAttribute("cnt", cnt);
		
		return "manage"+area;
	}
}
