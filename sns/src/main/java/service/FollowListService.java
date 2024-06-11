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
	public void unfollow(FollowVO fvo) throws Exception {
		fdao.unfollow(fvo);
	}

	@Override
	public void follow(FollowVO fvo) throws Exception {
		fdao.follow(fvo);
	}

}