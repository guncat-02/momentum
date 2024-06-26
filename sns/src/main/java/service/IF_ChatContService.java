package service;

import java.util.List;

import vo.ChatContVO;

public interface IF_ChatContService {
	public List<ChatContVO> selectCont(String chatNum) throws Exception;
	public void insert(ChatContVO ccVO) throws Exception;
}
