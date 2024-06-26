package controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.IF_PostingService;
import util.FileDataUtil;
import vo.PostVO;

@Controller
public class PostingController {
	
	@Inject
	FileDataUtil fileDataUtil;
	
	@Inject
	IF_PostingService pservice;

	@GetMapping("/posting")
	public String posting() {
		return "posting";
	}
	
	@PostMapping("/postingSave")
	public String postingSave(@ModelAttribute PostVO pvo, MultipartFile[] file) throws Exception {
		String[] fileName = fileDataUtil.fileUpload(file);
		pvo.setFilename(fileName);
		pservice.insertPost(pvo);
		return "redirect:main";
	}
	
	@GetMapping("/c_like")
	public void c_like(@RequestParam("no") String no) {
		/* pservice.c_like(no); */
	}
	
}
