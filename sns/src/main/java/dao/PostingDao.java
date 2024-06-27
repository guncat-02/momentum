package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.PostVO;

@Repository
public class PostingDao implements IF_PostingDao{

	private static String mapperQuery = "dao.IF_PostingDao";
	
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
