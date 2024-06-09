package dao;

import vo.FollowVO;

public interface IF_FollowListDao {

	public FollowVO selectFollowers(FollowVO fvo) throws Exception;
	
	public FollowVO selectFollowings(FollowVO fvo) throws Exception;

}