package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.PostVO;

@Repository
public class PostingDAOImpl implements IF_PostingDAO{

	private static String mapperQuery = "dao.IF_PostingDAO";
	
	@Inject
	SqlSession sql;
	
	@Override
	public void insertPost(PostVO pvo) throws Exception {
		sql.insert(mapperQuery+".insertPost", pvo);
	}

	@Override
	public void insertAttach(String fileName) throws Exception {
		sql.insert(mapperQuery+".insertAttach", fileName);
	}

}
