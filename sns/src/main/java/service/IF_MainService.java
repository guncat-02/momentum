package service;

import java.util.HashMap;
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
	// 게시물 조회수
	public void p_show(int no) throws Exception;
	// 글의 댓글 개수
	public int takeCommCnt(int no) throws Exception;
	// 글의 좋아요 개수
	public int takeP_loveCnt(int no) throws Exception;
	// 글의 리포스트 개수
	public int takeReCnt(int no) throws Exception;
	// 좋아요 증가 ajax
	public void p_love(HashMap<String, Object> params) throws Exception;
	// 좋아요 취소 ajax
	public void p_loveCancel(HashMap<String, Object> params) throws Exception;
	// 좋아요 누른 리스트
	public List<Integer> chklove(String id) throws Exception;
	
	
	public String[] getAttach(int no) throws Exception;
	
	public Integer getLoveCnt(int no) throws Exception;
	
	public Integer getRePostedCnt(int no) throws Exception;
	
}
