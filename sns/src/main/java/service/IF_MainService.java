package service;

import java.util.List;

import vo.MainVO;

public interface IF_MainService {
	public List<MainVO> mainAll(String id) throws Exception;
	
}
