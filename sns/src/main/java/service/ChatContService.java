package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
	public void insert(ChatContVO ccVO) throws Exception {
		ccDao.insert(ccVO);
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

	
}
