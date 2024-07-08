package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_MainService;
import service.IF_ProfileService;
import service.IF_ReportService;
import vo.PostVO;
import vo.ProfileVO;
import vo.ReportVO;

@Controller
@EnableAsync
public class ReportController {
	@Inject
	IF_ReportService rser;
	@Inject
	IF_MainService mser;
	@Inject
	IF_ProfileService pser;
	@PostMapping("reportPost")
	@ResponseBody
	public void reportPost(@ModelAttribute ReportVO rvo,Model model,HttpSession session) throws Exception {
		rvo.setId(String.valueOf(session.getAttribute("userid")));
		rser.Report(rvo);
	}
	
	@GetMapping("getPostModal")
	@ResponseBody
    public String getPostModal(Model model, @RequestParam("no") int no) throws Exception {
            // 게시물 정보 조회
            PostVO pvo = mser.takePostVO(no);
            // 게시물 작성자 정보 조회
            ProfileVO proVO = pser.select(pvo.getId());

            // 모달에 전달할 데이터 설정
            model.addAttribute("postvo", pvo);
            model.addAttribute("proVO", proVO);

            return "manageReport :: #reported_post";
        
    }
}
