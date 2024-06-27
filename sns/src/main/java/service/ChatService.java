package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ChatDao;
import vo.ChatRoomVO;

@Service
public class ChatService implements IF_ChatService{
	@Inject
	IF_ChatDao cDao;

	//chatRoom table에 insert
	@Override
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception {
		cDao.chatRoomInsert(cVO);
	}

	//chatMember table에 insert
	@Override
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception {
		cDao.chatMemberInsert(cVO);
	}

	//chatmember table count select 
	@Override
	public int chatMemberSelect(String id) throws Exception {
		return cDao.chatMemberSelect(id);
	}

	//chatmember table의 nickanme select
	@Override
	public List<String> select(String id) throws Exception {
		return cDao.select(id);
	}

	//chatlist select
	@Override
	public List<ChatRoomVO> chatList(String nickName) throws Exception {
		return cDao.chatList(nickName);
	}

	//chatMember list
	@Override
	public List<ChatRoomVO> chatMemberList(String chatNum) throws Exception {
		return cDao.chatMemberList(chatNum);
	}

}
