package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.FollowVO;

@Repository
public class FollowListDao implements IF_FollowListDao{

	private static String mapperQuery = "dao.IF_FollowListDao";
	
	@Inject
	SqlSession sql;
	
	@Override
	public FollowVO selectFollowers(FollowVO fvo) throws Exception {
		List<String> fList = sql.selectList(mapperQuery+".selectFollowers", fvo.getId().get(0));
		fvo.setFollowId(fList);
		return fvo;
	}

	@Override
	public FollowVO selectFollowings(FollowVO fvo) throws Exception {
		List<String> fList = sql.selectList(mapperQuery+".selectFollowings", fvo.getFollowId().get(0));
		fvo.setId(fList);
		return null;
	}

}
