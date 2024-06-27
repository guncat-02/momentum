package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.IF_PostingService;
import service.IF_ProfileService;
import util.FileDataUtil;
import vo.CommVO;
import vo.PostVO;
import vo.ProfileVO;

@Controller
public class PostingController {
	
	@Inject
	FileDataUtil fileDataUtil;
	
	@Inject
	IF_PostingService pservice;
	
	@Inject
	IF_ProfileService proservice;

	@GetMapping("/posting")
	public String posting() {
		return "posting";
	}

	
	@PostMapping("/postingSave")
	public String postingSave(@ModelAttribute PostVO pvo, MultipartFile[] file, HttpSession session) throws Exception {
		String[] fileName = fileDataUtil.fileUpload(file);
		pvo.setFilename(fileName);
		pservice.insertPost(pvo);
		return "redirect:main";
	}
	
	@GetMapping("/reposting")
	public String reposting(@RequestParam("no")int no, Model model) throws Exception {
		PostVO rePVO = pservice.selectOnePost(no);
		ProfileVO reProVO = proservice.select(rePVO.getId());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("rePVO", rePVO);
		map.put("reProVO", reProVO);
		model.addAttribute("map", map);
		
		return "repost";
	}
	
	@PostMapping("/repostingSave")
	public String repostingSave(@ModelAttribute PostVO pvo, MultipartFile[] file) throws Exception {
		String[] fileName = fileDataUtil.fileUpload(file);
		pvo.setFilename(fileName);
		pservice.insertRePost(pvo);
		return "redirect:main";
	}
	
}
