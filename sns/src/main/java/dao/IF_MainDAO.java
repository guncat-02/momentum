package dao;

import java.util.List;

import vo.PostVO;

public interface IF_MainDAO {
	public List<PostVO> mainAll() throws Exception;
	
	public List<PostVO> attachAll()throws Exception; 
	
	public List<String> postAttach(int no) throws Exception;
	
	public List<PostVO> myPostList(String id) throws Exception;
	
	public int postLength(String id) throws Exception;

	public PostVO takePostVO(int no) throws Exception;

	public List<PostVO> lovePostList(String id) throws Exception;

	public void p_show(int no) throws Exception;
	
	
	
}
