package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vo.SearchVO;

@Controller
public class SearchController {
	@GetMapping("search")
	public String search() {
		return "search";
	}
	
	@GetMapping("searchList")
	public String searChList(@ModelAttribute SearchVO sVO) {
		System.out.println(sVO.getKeyWord());
		return "searchList";
	}
}
