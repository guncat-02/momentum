package dao;

import java.util.HashMap;
import java.util.List;

import vo.PostVO;

public interface IF_PostingDao {

	public void insertPost(PostVO pvo) throws Exception;
	
	public void insertRePost(PostVO pvo) throws Exception;
	
	public void insertAttach(HashMap<String, Object> fileMap) throws Exception;
	
	public PostVO selectOnePost(int no) throws Exception;
	
	public List<String> selectAttach(int no) throws Exception;
	
	public int updatePost(HashMap<String, Object> editMap) throws Exception;

	public int deletePost(int no) throws Exception;
	
	public int selectPosts(String keyWord) throws Exception;
}
