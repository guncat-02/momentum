package controller;

import java.util.HashMap;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.IF_CommService;
import service.IF_MainService;
import service.IF_ProfileService;
import service.IF_ReportService;
import vo.BanVO;
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
	@Inject
	IF_CommService cser;
	@PostMapping("reportPost")
	@ResponseBody
	public void reportPost(@ModelAttribute ReportVO rvo,Model model,HttpSession session) throws Exception {
		rvo.setId(String.valueOf(session.getAttribute("userid")));
		rser.Report(rvo);
	}
	
	@GetMapping("/getPostModal")
    public String getPostModal(Model model, @RequestParam("no") int no) throws Exception {
            // 게시물 정보 조회

            PostVO pvo = mser.takePostVO(no);
            // 게시물 작성자 정보 조회
            ProfileVO proVO = pser.select(pvo.getId());
            pvo.setFilename(mser.getAttach(no));
            // 모달에 전달할 데이터 설정
            model.addAttribute("postvo", pvo);
            model.addAttribute("proVO", proVO);

            return "manageReport";
    }
	
	@PostMapping("/banmember")
	public String banmember(@ModelAttribute BanVO bvo,Model model,RedirectAttributes rt) throws Exception {
		System.out.println(bvo.getF_date());
		System.out.println(bvo.getId());
		rser.banmember(bvo);
		rt.addFlashAttribute("msg", bvo.getId());
		return "redirect:/manager/report/";
	}
	
	@GetMapping("/innocence")
	@ResponseBody
	public void innocence(@RequestParam("id") String id,@RequestParam("r_cont") String r_cont) throws Exception {
		System.out.println(id);
		System.out.println(r_cont);
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("r_cont", r_cont);
		rser.innocence(params);
	}
	
}
