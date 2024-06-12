package dao;

import java.util.List;

import vo.MainVO;

public interface IF_MainDAO {
	public List<MainVO> mainAll(String id) throws Exception;
	
}
