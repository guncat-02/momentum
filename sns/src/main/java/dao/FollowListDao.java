package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.FollowVO;
import vo.ProfileVO;

@Repository
public class FollowListDao implements IF_FollowListDao{

	private static String mapperQuery = "dao.IF_FollowListDao";
	
	@Inject
	SqlSession sql;

	@Override
	public List<ProfileVO> getInterFollowersProfile(String followId) throws Exception {
		return sql.selectList(mapperQuery+".selectInterFollowersProfile", followId);
	}
	
	@Override
	public List<ProfileVO> getFollowersProfile(String followId) throws Exception {
		return sql.selectList(mapperQuery+".selectFollowersProfile", followId);
	}

	@Override
	public List<ProfileVO> getFollowingsProfile(String id) throws Exception {
		return sql.selectList(mapperQuery+".selectFollowingsProfile", id);
	}

	@Override
	public void unfollow(FollowVO fvo) throws Exception {
		sql.delete(mapperQuery+".deleteFollowId", fvo);
	}

	@Override
	public void follow(FollowVO fvo) throws Exception {
		sql.insert(mapperQuery+".insertFollowId", fvo);
	}

	//팔로잉 수를 세는 메서드
	@Override
	public int followingSelect(String id) throws Exception {
		return sql.selectOne(mapperQuery+".followingSelect", id);
	}

	//팔로우 수를 세는 메서드
	@Override
	public int followerSelect(String id) throws Exception {
		return sql.selectOne(mapperQuery+".followerSelect", id);
	}

	@Override
	public List<ProfileVO> followingList(String id) throws Exception {
		return sql.selectList(mapperQuery+".followingList", id);
	}

	@Override
	public List<ProfileVO> followerList(String id) throws Exception {
		return sql.selectList(mapperQuery+".followerList", id);
	}

}
