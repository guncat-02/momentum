package service;

import vo.FollowVO;

public interface IF_FollowListService {

	public FollowVO selectFollowers(FollowVO fvo) throws Exception;
	
	public FollowVO selectFollowings(FollowVO fvo) throws Exception;
}
