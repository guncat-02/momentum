package service;

import java.util.HashMap;

import vo.PostVO;

public interface IF_PostingService {

	public void insertPost(PostVO pvo) throws Exception;

	public int c_like(String no);
	
	public int c_dislike(String no);
	
	public void insertRePost(PostVO pvo) throws Exception;
	
	public PostVO selectOnePost(int no) throws Exception;
	
	public int updatePost(HashMap<String, Object> editMap) throws Exception;
	
	public int deletePost(int no) throws Exception;
}
