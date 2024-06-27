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
	
	

}
