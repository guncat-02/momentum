package dao;

import java.util.HashMap;
import java.util.List;

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
		System.out.println("dao postInsert"+pvo.toString());
		sql.insert(mapperQuery+".insertPost", pvo);
	}

	@Override
	public void insertAttach(HashMap<String, Object> fileMap) throws Exception {
		sql.insert(mapperQuery+".insertAttach", fileMap);
	}

	@Override
	public PostVO selectOnePost(int no) throws Exception {
		return sql.selectOne(mapperQuery+".selectOnePost", no);
	}

	@Override
	public List<String> selectAttach(int no) throws Exception {
		return sql.selectList(mapperQuery+".selectAttach", no);
	}

	@Override
	public void insertRePost(PostVO pvo) throws Exception {
		sql.insert(mapperQuery+".insertRePost", pvo);
	}

	@Override
	public int updatePost(HashMap<String, Object> editMap) throws Exception {
		return sql.update(mapperQuery+".updatePost", editMap);
	}

	@Override
	public int deletePost(int no) throws Exception {
		return sql.delete(mapperQuery+".deletePost", no);
	}

}
