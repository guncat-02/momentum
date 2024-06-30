package service;

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
				pvo.setFilename(list);
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
				pvo.setFilename(list);
			}
		}
		return mypostList;
	}

	@Override
	public int postLength(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(maindao.postLength(id));
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
				pvo.setFilename(list);
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
				pvo.setFilename(list);
			}
		}
		return lovepostList;
	}

	@Override
	public void p_show(int no) throws Exception {
		
		maindao.p_show(no);
		
	}
	

}
