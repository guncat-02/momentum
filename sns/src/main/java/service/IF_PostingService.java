package service;

import vo.PostVO;

public interface IF_PostingService {

	public void insertPost(PostVO pvo) throws Exception;

	public int c_like(String no);
	
	public int c_dislike(String no);
	
}
