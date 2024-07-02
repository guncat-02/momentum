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
	
	// 내가 팔로우한 사람의 게시물 중 가장 최신 게시물
	public int getCurMaxNum(List<String> followIdList) throws Exception;
	// 특정 범위의 rownum 가지는 tuple select.
	public List<PostVO> getFollowingPostList(HashMap<String, Object> fPostMap) throws Exception;
	// 내가 팔로우하지 않은 사람의 게시물 출력
	public List<PostVO> getRecommendPostList(HashMap<String, Object> recomMap) throws Exception;
	
}
