package service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_CommDao;
import dao.IF_MainDAO;
import vo.CommVO;
import vo.PostVO;

@Service
public class CommService implements IF_CommService{
	@Inject
	IF_CommDao cdao;
	@Inject
	IF_MainDAO mdao;
	// 댓글 인서트
	@Override
	public void inputComm(CommVO cvo) throws Exception {
	cdao.inputComm(cvo);	
	}
	// 해당 글의 댓글 리스트 가져오기
	@Override
	public List<CommVO> CommList(int no) throws Exception {
		// TODO Auto-generated method stub
		
		return cdao.CommList(no);
	}
	// 해당 글의 댓글 갯수 카운트 
	@Override
	public int cntComm(int no) throws Exception {
		// TODO Auto-generated method stub
		return cdao.cntComm(no);
	}
	// 좋아요 테이블에 추가
	@Override
	public void incommlike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		cdao.incommlike(cvo);
	}
	@Override
	public void incommdislike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		cdao.incommdislike(cvo);
	}
	@Override
	public void cancelcommlike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		cdao.cancelcommlike(cvo);
	}
	@Override
	public int takelikecnt(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return cdao.takelikecnt(c_no); // 해당 댓글의 좋아요 수
	}
	@Override
	public int takedislikecnt(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return cdao.takedislikecnt(c_no);
	}
	@Override
	public void setlike(HashMap<String,Integer> params) throws Exception {
		// TODO Auto-generated method stub
		cdao.setlike(params);
	}
	// 변경된 싫어요 값 업데이트 함수
	@Override
	public void setdislike(HashMap<String, Integer> params) throws Exception {
		// TODO Auto-generated method stub
		cdao.setdislike(params);
	}

	// 좋아요 순 리스트 받아오기
	@Override
	public List<CommVO> orderlikecomm(int no) throws Exception {
		// TODO Auto-generated method stub
		return cdao.orderlikecomm(no);
	}
	@Override
	public List<Integer> chklike(HashMap<String, Object> params) throws Exception{
		// TODO Auto-generated method stub
		return cdao.chklike(params);
	}
	@Override
	public List<Integer> chkdislike(HashMap<String, Object> params) throws Exception{
		// TODO Auto-generated method stub
		return cdao.chkdislike(params);
	}
	@Override
	public List<Integer> mycomm(HashMap<String, Object> params) throws Exception{
		// TODO Auto-generated method stub
		return cdao.mycomm(params);
	}
	@Override
	public void delcomm(int c_no) throws Exception{
		// TODO Auto-generated method stub
		cdao.delcomm(c_no);
	}
	// 싫어요 순 댓글 가져오기
	@Override
	public List<CommVO> orderdislikecomm(int no) throws Exception {
		// TODO Auto-generated method stub
		return cdao.orderdislikecomm(no);
	}
	@Override
	public List<CommVO> myCommList(String id) throws Exception {
		// TODO Auto-generated method stub
		return cdao.myCommList(id);
	}
	@Override
	public List<PostVO> mycpList(String id) throws Exception {
		// TODO Auto-generated method stub
		List<PostVO> mycpList = cdao.mycpList(id);
		for (PostVO pvo : mycpList) {
			List<String> myfileList = mdao.postAttach(pvo.getNo());
			if (myfileList != null) {
				String list[] = myfileList.toArray(new String[myfileList.size()]);
				pvo.setFilename(list);
			}
		}
		return mycpList;
	}
	@Override
	public int mycommcnt(String id) throws Exception {
		// TODO Auto-generated method stub
		return cdao.mycommcnt(id);
	}

	

}
