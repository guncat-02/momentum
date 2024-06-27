package service;

import java.util.HashMap;
import java.util.List;

import vo.BlockVO;
import vo.ProfileVO;

public interface IF_BlockService {

	public void block(HashMap<String, Object> map) throws Exception;
	
	public void unblock(HashMap<String, String> map) throws Exception;
	
	public List<ProfileVO> getBlocked(String id) throws Exception;
	
	public int chkBlocked(BlockVO bvo) throws Exception;
}
