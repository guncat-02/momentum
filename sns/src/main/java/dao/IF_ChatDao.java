package dao;

import java.util.List;

import vo.ChatRoomVO;

public interface IF_ChatDao {
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception;
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception;
	public int chatMemberSelect(String id) throws Exception;
	public List<String> select(String id) throws Exception;
	public List<ChatRoomVO> chatList(String nickName) throws Exception;
	public List<ChatRoomVO> chatMemberList(String chatNum) throws Exception;
}
