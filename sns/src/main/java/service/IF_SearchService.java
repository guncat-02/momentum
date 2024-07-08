package service;

import java.util.List;
import java.util.Map;

import vo.PostVO;

public interface IF_SearchService {
	public void insertKeyWord(String keyWord) throws Exception;
	public List<String> selectKeyWord() throws Exception;
	public List<PostVO> selectSearchList(Map map) throws Exception;
}
