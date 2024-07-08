package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import service.IF_PostingService;
import service.IF_ProfileService;
import service.IF_SearchService;
import vo.PostVO;
import vo.ProfileVO;
import vo.SearchVO;

@Controller
public class SearchController {
	@Inject
	IF_SearchService sServe;
	@Inject
	IF_PostingService pServe;
	@Inject
	IF_ProfileService proServe;
	
	//search로 가기 위한 메서드
	@GetMapping("search")
	public String search(Model model, HttpSession session) throws Exception {
		model.addAttribute("id", String.valueOf(session.getAttribute("userid")));
		List<String> keyWord = sServe.selectKeyWord();
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("result", pServe.selectPosts(keyWord));
		return "search";
	}
	
	//searchList로 가기 위한 메서드
	@GetMapping("searchList")
	public String searChList(@ModelAttribute SearchVO sVO, HttpSession session, Model model) throws Exception {
		String id = String.valueOf(session.getAttribute("userid"));
		sServe.insertKeyWord(sVO.getKeyWord());
		model.addAttribute("key", sVO);
		model.addAttribute("id", id);
		if(sVO.getKeyType() == null || sVO.getKeyType().trim().equals("")) {
			sVO.setKeyType("인기");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("key", sVO);
		map.put("id", id);
		if(!sVO.getKeyType().equals("사용자")) {
			List<PostVO> pVO = sServe.selectSearchList(map);
			if(pVO != null && pVO.size() != 0) {
				List<String> idList = new ArrayList<>();
				for(int i = 0; i < pVO.size(); i++) {
					idList.add(pVO.get(i).getId());
				}
				List<ProfileVO> ppVO = proServe.searchProfile(idList);
				model.addAttribute("info", pVO);
				model.addAttribute("profile", ppVO);
			}
		} else {
			List<ProfileVO> proVO = proServe.searchUser(map);
			if(proVO != null && proVO.size() != 0) {
				model.addAttribute("info", proVO);
			}
		}
		return "searchList";
	}
}
