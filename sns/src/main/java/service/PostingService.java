package service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_PostingDao;
import vo.PostVO;

@Service
public class PostingService implements IF_PostingService{

	@Inject
	IF_PostingDao pdao;
	
	@Override
	public void insertPost(PostVO pvo) throws Exception {
		pdao.insertPost(pvo);
		HashMap<String, Object> fileMap = new HashMap<>();
		fileMap.put("id", pvo.getId());
		for (String fileName : pvo.getFilename()) {
			fileMap.put("filename", fileName);
			pdao.insertAttach(fileMap);
		}
	}

	@Override
	public int c_like(String no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int c_dislike(String no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PostVO selectOnePost(int no) throws Exception {
		PostVO rePVO = pdao.selectOnePost(no);
		List<String> files = pdao.selectAttach(no);
		if (files != null && files.size() != 0) { // 사진 있는 경우
			rePVO.setFilename(files.toArray(new String[files.size()]));
		}
		return rePVO;
	}

	@Override
	public void insertRePost(PostVO pvo) throws Exception {
		pdao.insertRePost(pvo);
		HashMap<String, Object> fileMap = new HashMap<>();
		fileMap.put("id", pvo.getId());
		for (String fileName : pvo.getFilename()) {
			fileMap.put("filename", fileName);
			pdao.insertAttach(fileMap);
		}
	}

	@Override
	public int updatePost(HashMap<String, Object> editMap) throws Exception {
		return pdao.updatePost(editMap);
	}

	@Override
	public int deletePost(int no) throws Exception {
		return pdao.deletePost(no);
	}
	
	

}
