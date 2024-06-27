package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_CommService;
import vo.CommVO;

@Controller
@EnableAsync
public class CommCotroller {
	@Inject
	IF_CommService cser;

	// 좋아요 업데이트
	@PostMapping("/c_like")
	@ResponseBody
	public void c_like(@RequestParam("c_no") int c_no, @RequestParam("chkno") int chkno, HttpSession session)
			throws Exception {

		if (chkno == 1) {
			CommVO cvo = new CommVO();
			cvo.setC_no(c_no);
			cvo.setId(String.valueOf(session.getAttribute("userid")));
			cser.incommlike(cvo);

		} else if (chkno == 0) {
			CommVO cvo = new CommVO();
			cvo.setC_no(c_no);
			cvo.setId(String.valueOf(session.getAttribute("userid")));
			cser.cancelcommlike(cvo);
		}
		System.out.println(cser.takelikecnt(c_no) + "댓글 수");

		HashMap<String, Integer> params = new HashMap<>();
		params.put("c_no", c_no);
		params.put("likecnt", cser.takelikecnt(c_no));
		cser.setlike(params);
	}

	// 싫어요 db없데이트
	@PostMapping("/c_dislike")
	@ResponseBody
	public void c_dislike(@RequestParam("c_no") int c_no, @RequestParam("chkno") int chkno, HttpSession session)
			throws Exception {

		if (chkno == 1) {
			CommVO cvo = new CommVO();
			cvo.setC_no(c_no);
			cvo.setId(String.valueOf(session.getAttribute("userid")));
			cser.incommdislike(cvo);

		} else if (chkno == 0) {
			CommVO cvo = new CommVO();
			cvo.setC_no(c_no);
			cvo.setId(String.valueOf(session.getAttribute("userid")));
			cser.cancelcommlike(cvo);
		}

		HashMap<String, Integer> params = new HashMap<>();
		params.put("c_no", c_no);
		params.put("dislikecnt", cser.takedislikecnt(c_no));
		cser.setdislike(params);
	}

	// 댓글 삽입
	@PostMapping("/inputcomm")
	@ResponseBody
	public void incomm(@RequestBody CommVO cvo, HttpSession session, Model model) throws Exception {
		cvo.setId(String.valueOf(session.getAttribute("userid")));
		cser.inputComm(cvo);
		model.addAttribute("Commcnt", cser.cntComm(cvo.getNo()));
		model.addAttribute("commlist", cser.CommList(cvo.getNo()));
	}

	// 댓글 정렬
	@PostMapping("/orderlikecomm")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> orderlikecomm(@RequestParam("order") String order,
	                                                         @RequestParam("no") int no) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        List<CommVO> commlist = new ArrayList<>();
	        if (order.equals("latest")) {
	            commlist = cser.CommList(no);
	        } else if(order.equals("likeorder")) {
	            commlist = cser.orderlikecomm(no);
	        } else {
	        	commlist = cser.orderdislikecomm(no);
	        }
	        response.put("commlist", commlist);
	        return ResponseEntity.ok().body(response);
	    } catch (Exception e) {
	        response.put("error", "Failed to fetch comments");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	@PostMapping("/chklike")
	@ResponseBody
	public List<Integer> chklike(@RequestParam("id") String id, @RequestParam("no") int no) throws Exception {

		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("no", no);
		List<Integer> c_likeList = cser.chklike(params);
		return c_likeList;
	}

	@PostMapping("/chkdislike")
	@ResponseBody
	public List<Integer> chkdislike(@RequestParam("id") String id, @RequestParam("no") int no) throws Exception {

		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("no", no);
		List<Integer> c_likedisList = cser.chkdislike(params);
		return c_likedisList;
	}

	@PostMapping("/mycomm")
	@ResponseBody
	public List<Integer> mycomm(@RequestParam("id") String id, @RequestParam("no") int no) throws Exception {

		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("no", no);
		List<Integer> mycommlist = cser.mycomm(params);
		return mycommlist;
	}

	@GetMapping("/delcomm")
	@ResponseBody
	public void delcomm(@RequestParam("c_no") int c_no) throws Exception {
		cser.delcomm(c_no);
	}

}
