package dao;

import java.util.List;
import java.util.Map;

import vo.ChatContVO;

public interface IF_ChatContDao {
	public List<ChatContVO> selectCont(String chatNum) throws Exception;
	public void insert(ChatContVO ccVO) throws Exception;
	public void insertAttach(Map<String, Object> attach) throws Exception;
	public List<ChatContVO> selectAttach(String chatNum) throws Exception;
}
