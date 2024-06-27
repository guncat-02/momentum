package dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.BlockVO;
import vo.ProfileVO;

@Repository
public class BlockDao implements IF_BlockDao{

	private static String mapperQuery = "dao.IF_BlockDao";
	
	@Inject
	SqlSession sql;
	


	@Override
	public List<ProfileVO> getBlocked(String id) throws Exception {
		return sql.selectList(mapperQuery+".selectBlocked", id);
	}


	@Override
	public void block(HashMap<String, Object> map) throws Exception {
		sql.insert(mapperQuery+".insertBlock", map);
	}



	@Override
	public void unblock(HashMap<String, String> map) throws Exception {
		sql.delete(mapperQuery+".deleteBlock", map);
	}


	@Override
	public int chkBlocked(BlockVO bvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectBlockedCnt", bvo);
	}

}
