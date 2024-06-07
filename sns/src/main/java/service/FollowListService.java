package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_FollowListDao;
import vo.FollowVO;

@Service
public class FollowListService implements IF_FollowListService{

	@Inject
	IF_FollowListDao fdao;
	
	@Override
	public FollowVO selectFollowers(FollowVO fvo) throws Exception {
		return fdao.selectFollowers(fvo);
	}

	@Override
	public FollowVO selectFollowings(FollowVO fvo) throws Exception {
		return null;
	}

}
