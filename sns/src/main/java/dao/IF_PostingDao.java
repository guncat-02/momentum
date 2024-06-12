package dao;

import vo.PostVO;

public interface IF_PostingDao {

	public void insertPost(PostVO pvo) throws Exception;
	
	public void insertAttach(String fileName) throws Exception;
	
}
