package service;

import java.util.List;

import vo.PostVO;

public interface IF_MainService {
	public List<PostVO> mainAll() throws Exception;
	public List<PostVO> attachAll() throws Exception;
	
}
