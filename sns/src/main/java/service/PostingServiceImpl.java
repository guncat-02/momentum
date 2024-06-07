package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_PostingDAO;
import vo.PostVO;

@Service
public class PostingServiceImpl implements IF_PostingService{

	@Inject
	IF_PostingDAO pdao;
	
	@Override
	public void insertPost(PostVO pvo) throws Exception {
		pdao.insertPost(pvo);
		for (String fileName : pvo.getFilename()) {
			pdao.insertAttach(fileName);
		}
	}

}
