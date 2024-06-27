package service;

import java.util.List;

import vo.PostVO;

public interface IF_MainService {
	public List<PostVO> mainAll() throws Exception;
	
	public List<PostVO> attachAll() throws Exception;
	//해당 아이디의 글 리스트
	public List<PostVO> myPostList(String id) throws Exception;
	// 그 사람이 쓴 글 갯수 반환 
	public int postLength(String id) throws Exception;
	// 파일 vo
	public List<PostVO> myfiles(String id) throws Exception;
	// 글번호에 따른 postvo
	public PostVO takePostVO(int no) throws Exception;
	// 좋아요 한 글 번호 리스트
	public List<PostVO> lovePostList(String id) throws Exception;
	
}
