package dao;

import java.util.List;

import vo.ChatContVO;

public interface IF_ChatContDao {
	public List<ChatContVO> selectCont(String chatNum) throws Exception;
	public void insert(ChatContVO ccVO) throws Exception;
}
