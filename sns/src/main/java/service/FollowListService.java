package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_FollowListDao;
import vo.FollowVO;
import vo.ProfileVO;

@Service
public class FollowListService implements IF_FollowListService{

	@Inject
	IF_FollowListDao fdao;

	@Override
	public List<ProfileVO> getInterFollowersProfile(String followId) throws Exception {
		return fdao.getInterFollowersProfile(followId);
	}
	
	@Override
	public List<ProfileVO> getFollowersProfile(String followId) throws Exception {
		return fdao.getFollowersProfile(followId);
	}

	@Override
	public List<ProfileVO> getFollowingsProfile(String id) throws Exception {
		return fdao.getFollowingsProfile(id);
	}
	
	@Override
	public List<String> getFollowingsId(String id) throws Exception {
		return fdao.getFollowingsId(id);
	}

	@Override
	public int unfollow(FollowVO fvo) throws Exception {
		return fdao.unfollow(fvo);
	}

	@Override
	public int follow(FollowVO fvo) throws Exception {
		return fdao.follow(fvo);
	}

	//팔로잉 수를 세는 메서드
	@Override
	public int followingSelect(String id) throws Exception {
		return fdao.followingSelect(id);
	}

	//팔로워 수를 세는 메서드
	@Override
	public int followerSelect(String id) throws Exception {
		return fdao.followerSelect(id);
	}

	@Override
	public List<ProfileVO> followingList(String id) throws Exception {
		return fdao.followingList(id);
	}

	@Override
	public List<ProfileVO> followerList(String id) throws Exception {
		return fdao.followerList(id);
	}

}
