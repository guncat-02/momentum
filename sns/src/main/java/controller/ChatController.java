package controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.IF_ChatService;
import service.IF_FollowListService;
import service.IF_ProfileService;
import util.FileDataUtil;
import util.RandomCode;
import vo.ChatRoomVO;
import vo.ProfileVO;

@Controller
public class ChatController {
	@Inject
	IF_FollowListService fServe;
	@Inject
	IF_ProfileService pServe;
	@Inject
	IF_ChatService cServe;
	
	@Inject
	FileDataUtil upload;
	@Inject
	RandomCode rdCode;
	
	//profile view로 이동
	@GetMapping("selProfile")
	public String selProfile(HttpSession session, Model model) throws Exception {
		String id = String.valueOf(session.getAttribute("userid"));
		List<ProfileVO> pro = pServe.selectProfile(id);
		model.addAttribute("profile", pro);
		List<String> nick = cServe.select(id);
		model.addAttribute("cnt", nick);
		return "selProfile";
	}
	
	//newChat view로 이동
	@GetMapping("newChat")
	public String newChat(HttpSession session, Model model, @RequestParam("nickName") String nick) throws Exception {
		model.addAttribute("nickName", nick);
		String id = String.valueOf(session.getAttribute("userid"));
		model.addAttribute("following", fServe.followingList(id));
		model.addAttribute("follower", fServe.followerList(id));
		return "newChat";
	}
	
	//chat start view로 이동
	@GetMapping("chatStart")
	public String chatStart(HttpSession session) throws Exception {
		if(cServe.chatMemberSelect(String.valueOf(session.getAttribute("userid"))) > 0) {
			return "redirect:selProfile";
		}
		return "chatStart";
	}
	
	//chatroom table에 insert
	@ResponseBody
	@PostMapping("newChatSave")
	public String newChatSave(@ModelAttribute ChatRoomVO cVO, MultipartFile[] chatPhoto, HttpSession session) throws Exception {
		cVO.setChatNum(rdCode.randomCode());
		cVO.setId(String.valueOf(session.getAttribute("userid")));
		String file = upload.fileUpload(chatPhoto)[0];
		if(file != null) {
			cVO.setChatImg(file);
		}
		if(cVO.getChatName() == null || cVO.getChatName().equals("")) {
			cVO.setChatName(cVO.getNickName()+"님의 M");
		}
		cServe.chatRoomInsert(cVO);
		cVO.setOwner("Y");
		cServe.chatMemberInsert(cVO);
		return cVO.getChatNum();
	}
	
	//chatMember table에 insert
	@PostMapping("newChatMember")
	public void newChatMember(HttpServletRequest request) throws Exception {
		ChatRoomVO cVO = new ChatRoomVO();
		String chatNum = request.getParameter("chat");
		String[] id = request.getParameterValues("ids");
		String[] nick = request.getParameterValues("nicks");
		cVO.setChatNum(chatNum);
		for(int i = 0; i < id.length; i++) {
			cVO.setId(id[i]);
			cVO.setNickName(nick[i]);
			cServe.chatMemberInsert(cVO);
		}
	}
	
	//chatting view로 이동
	@GetMapping("chat")
	public String chat(@RequestParam("nickName") String nickName, Model model) throws Exception {
		model.addAttribute("nickName", nickName);
		model.addAttribute("chatList", cServe.chatList(nickName));
		return "chat";
	}
	
	//채팅 프로필 추가
	@GetMapping("profileList")
	public String profileList(HttpSession session, Model model) throws Exception {
		List<ProfileVO> pro = pServe.selectProfile(String.valueOf(session.getAttribute("userid")));
		model.addAttribute("profile", pro);
		return "profileList";
	}
	
	//채팅 프로필 수정
	@GetMapping("profileUpdate")
	public String profileUpdate(HttpSession session, Model model) throws Exception {
		model.addAttribute("profile", pServe.selectSub(String.valueOf(session.getAttribute("userid"))));
		return "profileUpdate";
	}
}
