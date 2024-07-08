package dao;

import java.util.List;
import java.util.Map;

import vo.PostVO;

public interface IF_SearchDao {
	public void insertKeyWord(String keyWord) throws Exception;
	public List<String> selectKeyWord() throws Exception;
	public List<PostVO> selectSearchList(Map map) throws Exception;
}
