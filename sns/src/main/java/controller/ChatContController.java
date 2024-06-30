package controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.IF_ChatContService;
import service.IF_ChatService;
import service.IF_ProfileService;
import util.FileDataUtil;
import vo.ChatContVO;
import vo.ChatRoomVO;
import vo.ProfileVO;

@Controller
public class ChatContController {
	@Inject
	IF_ChatContService ccServe;
	@Inject
	IF_ProfileService pServe;
	@Inject
	IF_ChatService cServe;
	
	@Inject
	FileDataUtil upload;
	
	//채팅 내용을 불러오기 위한 메서드
	@ResponseBody
	@PostMapping("chat/conts")
	public List<ChatContVO> selectCont(@RequestParam("chatNum") String chatNum) throws Exception {
		List<ChatContVO> cont = ccServe.selectCont(chatNum);
		for(int i = 0; i < cont.size(); i++) {
			cont.get(i).setChatTime(cont.get(i).getChatTime().substring(0, 16));
		}
		return cont;
	}
	
	//유저의 프로필을 불러오기 위한 메서드
	@ResponseBody
	@PostMapping("chat/users")
	public List<ProfileVO> profileList(@RequestParam("chatNum") String chatNum) throws Exception {
		List<ChatRoomVO> c = cServe.chatMemberList(chatNum);
		List<String> nick = new ArrayList<>();
		for(int i = 0; i < c.size(); i++) {
			nick.add(c.get(i).getNickName());
		}
		return pServe.profileList(nick);
	}
	
	//채팅을 insert 하기 위한 메서드
	@PostMapping("chat/chatting")
	public void insert(@ModelAttribute ChatContVO ccVO, MultipartFile[] chatFile) throws Exception {
		if(ccVO.getCont() != null && !ccVO.getCont().trim().equals("")) {
			ccServe.insert(ccVO);
		}
		String[] files = upload.fileUpload(chatFile);
		if(files[0] != null) {
			ccVO.setAttachList(files);
			ccServe.insertAttach(ccVO);
		}
	}
}
