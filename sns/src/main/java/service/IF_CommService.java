package service;

import java.util.HashMap;
import java.util.List;

import vo.CommVO;
import vo.PostVO;

public interface IF_CommService {

	
	public void inputComm(CommVO cvo) throws Exception;
	// 최신순 
	public List<CommVO> CommList(int no) throws Exception;
	// 좋아요 순
	public List<CommVO> orderlikecomm(int no) throws Exception;
	// 싫어요 순
	public List<CommVO> orderdislikecomm(int no) throws Exception;
	
	public int cntComm(int no) throws Exception;

	public void incommlike(CommVO cvo) throws Exception;
	
	public void cancelcommlike(CommVO cvo) throws Exception;
	
	public void incommdislike(CommVO cvo) throws Exception;
	//해당 댓글의 좋아요 수 가져오는 함수
	public int takelikecnt(int c_no) throws Exception;
	//해당 댓글의 싫어요 수 가져오는 함수	
	public int takedislikecnt(int c_no) throws Exception;

	public void setlike(HashMap<String,Integer> params) throws Exception;

	public void setdislike(HashMap<String, Integer> params) throws Exception;

	public List<Integer> chklike(HashMap<String, Object> params) throws Exception;

	public List<Integer> chkdislike(HashMap<String, Object> params) throws Exception;
	// 해당 글에서 내가 쓴 댓글 리스트 
	public List<Integer> mycomm(HashMap<String, Object> params) throws Exception;
	// 해당 댓글 삭제
	public void delcomm(int c_no) throws Exception;
	// 내가 쓴 댓글 리스트
	public List<CommVO> myCommList(String id) throws Exception;
	// 내가 쓴 댓글의 글 정보 리스트
	public List<PostVO> mycpList(String id) throws Exception;
	// 내가 쓴 댓글 개수
	public int mycommcnt(String id) throws Exception;
	
	
}
