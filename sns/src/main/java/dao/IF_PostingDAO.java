package dao;

import vo.PostVO;

public interface IF_PostingDAO {

	public void insertPost(PostVO pvo) throws Exception;
	
	public void insertAttach(String fileName) throws Exception;
	
}
