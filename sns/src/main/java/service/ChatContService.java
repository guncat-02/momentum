package service;

import java.util.List;

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
		return ccDao.selectCont(chatNum);
	}

	//chatcont table에 insert
	@Override
	public void insert(ChatContVO ccVO) throws Exception {
		ccDao.insert(ccVO);
	}

}
