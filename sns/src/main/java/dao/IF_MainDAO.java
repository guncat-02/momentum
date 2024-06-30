package dao;

import java.util.HashMap;
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

	public int takeCommCnt(int no) throws Exception;
	
	public int takeP_loveCnt(int no) throws Exception;

	public int takeReCnt(int no) throws Exception;

	public void p_love(HashMap<String, Object> params) throws Exception;

	public void p_loveCancel(HashMap<String, Object> params) throws Exception;

	public List<Integer> chklove(String id) throws Exception;
	
	
	
	public List<String> getAttach(int no) throws Exception;
	
	public Integer getLoveCnt(int no) throws Exception;
	
	public Integer getRePostedCnt(int no) throws Exception;
	
}
