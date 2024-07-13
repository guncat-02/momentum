package service;

import java.util.List;

import vo.ChatContVO;

public interface IF_ChatContService {
	public List<ChatContVO> selectCont(String chatNum) throws Exception;
	public ChatContVO insert(ChatContVO ccVO) throws Exception;
	public void insertAttach(ChatContVO ccVO) throws Exception;
	public List<ChatContVO> selectAttach(String chatNum) throws Exception;
	public List<ChatContVO> selectAttachList(ChatContVO ccVO) throws Exception;
}
