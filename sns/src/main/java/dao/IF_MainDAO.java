package dao;

import java.util.List;


import vo.PostVO;

public interface IF_MainDAO {
	public List<PostVO> mainAll() throws Exception;
	public List<PostVO> attachAll()throws Exception; 
	public List<String> postAttach(int no) throws Exception;
	
	
}
