package service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_MainDAO;

import vo.PostVO;
@Service
public class MainServiceImpl implements IF_MainService{
	@Inject
	IF_MainDAO maindao;
	@Override
	public List<PostVO> mainAll() throws Exception {
		return maindao.mainAll();
	}
	
	@Override
	public List<PostVO> attachAll() throws Exception {
		List<PostVO> attach = maindao.mainAll();
		for(PostVO pvo : attach) {
			List<String> fileList = maindao.postAttach(pvo.getNo());
			if(fileList != null) {
				String list[] = fileList.toArray(new String[fileList.size()]);
				pvo.setFileName(list);
			}
		}
		return attach;
	}

	@Override
	public List<PostVO> myPostList(String id) throws Exception {
		// TODO Auto-generated method stub
		List<PostVO> mypostList = maindao.myPostList(id);
		for (PostVO pvo : mypostList) {
			List<String> myfileList = maindao.postAttach(pvo.getNo());
			if (myfileList != null) {
				String list[] = myfileList.toArray(new String[myfileList.size()]);
				pvo.setFileName(list);
			}
		}
		return mypostList;
	}

	@Override
	public int postLength(String id) throws Exception {
		// TODO Auto-generated method stub
		return maindao.postLength(id);
	}
	
	@Override
	public List<PostVO> myfiles(String id) throws Exception {
		// TODO Auto-generated method stub
		List<PostVO> mypostList = maindao.myPostList(id);
		for (PostVO pvo : mypostList) {
			List<String> myfileList = maindao.postAttach(pvo.getNo());
			if (myfileList != null) {
				String list[] = myfileList.toArray(new String[myfileList.size()]);
				pvo.setFileName(list);
			}
			pvo.setP_date(trunc(pvo.getP_date()));
		}
		return mypostList;
	}
	// sysdate 연월일만 자르기
	public String trunc(String p_date) {
		String ymd = p_date.substring(0, 10);
		return ymd;
	}

	@Override
	public PostVO takePostVO(int no) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takePostVO(no);
	}

	@Override
	public List<PostVO> lovePostList(String id) throws Exception {
		// TODO Auto-generated method stub
		List<PostVO> lovepostList = maindao.lovePostList(id);
		for (PostVO pvo : lovepostList) {
			List<String> myfileList = maindao.postAttach(pvo.getNo());
			if (myfileList != null) {
				String list[] = myfileList.toArray(new String[myfileList.size()]);
				pvo.setFileName(list);
			}
		}
		return lovepostList;
	}

	@Override
	public void p_show(int no) throws Exception {
		
		maindao.p_show(no);
		
	}
	// 글 번호의 댓글 개수
	@Override
	public int takeCommCnt(int no) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takeCommCnt(no);
	}

	@Override
	public int takeP_loveCnt(int no) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takeP_loveCnt(no);
	}

	@Override
	public int takeReCnt(int no) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takeReCnt(no);
	}

	@Override
	public void p_love(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		maindao.p_love(params);
	}

	@Override
	public void p_loveCancel(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		maindao.p_loveCancel(params);
	}

	@Override
	public List<Integer> chklove(String id) throws Exception {
		// TODO Auto-generated method stub
		return maindao.chklove(id);
	}
	
	public String[] getAttach(int no) throws Exception {
		List<String> fList = maindao.getAttach(no);
		return fList.toArray(new String[0]);
	}

	@Override
	public Integer getLoveCnt(int no) throws Exception {
		return maindao.getLoveCnt(no);
	}

	@Override
	public Integer getRePostedCnt(int no) throws Exception {
		return maindao.getRePostedCnt(no);
	}

	@Override
	public int getCurMaxNum(List<String> followIdList) throws Exception {
		return maindao.getCurMaxNum(followIdList);
	}

	@Override
	public List<PostVO> getFollowingPostList(HashMap<String, Object> fPostMap) throws Exception {
		return maindao.getFollowingPostList(fPostMap);
	}

	@Override
	public List<PostVO> getRecommendPostList(HashMap<String, Object> recomMap) throws Exception {
		return maindao.getRecommendPostList(recomMap);
	}

	@Override
	public String takePhoto(String id) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takePhoto(id);
	}

	@Override
	public String takeNick(String id) throws Exception {
		// TODO Auto-generated method stub
		return maindao.takeNick(id);
	}



}
