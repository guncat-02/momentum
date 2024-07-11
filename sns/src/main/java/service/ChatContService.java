package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import dao.IF_ChatContDao;
import vo.ChatContVO;

@Service
public class ChatContService implements IF_ChatContService {
	@Inject
	IF_ChatContDao ccDao;
	
	//chatcont 를 불러오기 위한 메서드
	@Override
	public List<ChatContVO> selectCont(String chatNum) throws Exception {
		List<ChatContVO> cont = ccDao.selectCont(chatNum);
		List<ChatContVO> attach = ccDao.selectAttach(chatNum);
		for(ChatContVO ccVO : attach) {
			cont.add(ccVO);
		}
		int[] num = new int[cont.size()];
		for(int i = 0; i < num.length; i++) {
			num[i] = cont.get(i).getNo();
		}
		Arrays.sort(num);
		List<ChatContVO> arrayCont = new ArrayList<>();
		for(int i = 0; i < num.length; i++) {
			for(int j = 0; j < cont.size(); j++) {
				if(num[i] == cont.get(j).getNo()) {
					arrayCont.add(cont.get(j));
					break;
				}
			}
		}
		return arrayCont;
	}

	//chatcont table에 insert
	@Override
	public ChatContVO insert(ChatContVO ccVO) throws Exception {
		ccDao.insert(ccVO);
		ChatContVO cc = ccDao.selectContOne(ccVO);
		cc.setChatTime(cc.getChatTime().substring(0, 16));
		return cc;
	}

	//chatAttach table에 insert
	@Override
	public void insertAttach(ChatContVO ccVO) throws Exception {
		Map<String, Object> attach = new HashMap<>();
		attach.put("vo", ccVO);
		for(int i = 0; i < ccVO.getAttachList().length; i++) {
			if(i > 0) {
				attach.put("check", "chk");
			}
			attach.put("file", ccVO.getAttachList()[i]);
			ccDao.insertAttach(attach);
		}
	}

	
	//이미지 가져오기
	@Override
	public List<ChatContVO> selectAttach(String chatNum) throws Exception {
		List<ChatContVO> ccVO = ccDao.selectAttach(chatNum);
		if(ccVO != null && ccVO.size() != 0) {
			List<String> file = new ArrayList<>();
			file.add(ccVO.get(0).getChatAttach());
			for(int i = 0; i < ccVO.size(); i++) {
				String[] date = ccVO.get(i).getChatTime().split(" ");
				ccVO.get(i).setChatTime(date[0]);
			}
			List<ChatContVO> array = new ArrayList<>();
			for(int i = 1; i < ccVO.size(); i++) {
				if(!ccVO.get(i).getChatTime().equals(ccVO.get(i-1).getChatTime())) {
					ccVO.get(i-1).setAttachList(file.toArray(new String[file.size()]));
					array.add(ccVO.get(i-1));
					file.clear();
				}
				file.add(ccVO.get(i).getChatAttach());
			}
			if(file.size() != 0) {
				ccVO.get(ccVO.size()-1).setAttachList(file.toArray(new String[file.size()]));
				array.add(ccVO.get(ccVO.size()-1));
				return array;
			}
		}
		return null;
	}

	//채팅 사진을 가져오기 위한 메서드
	@Override
	public List<ChatContVO> selectAttachList(ChatContVO ccVO) throws Exception {
		List<ChatContVO> fileList = ccDao.selectAttachList(ccVO);
		for(ChatContVO file : fileList) {
			file.setChatTime(file.getChatTime().substring(0, 16));
		}
		return fileList;
	}
	
}
