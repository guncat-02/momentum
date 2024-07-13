package dao;

import java.util.List;
import java.util.Map;

import vo.PostVO;
import vo.SearchVO;

public interface IF_SearchDao {
	public void insertKeyWord(String keyWord) throws Exception;
	public List<SearchVO> selectKeyWord() throws Exception;
	public List<PostVO> selectSearchList(Map map) throws Exception;
}
