package dao;

import java.util.List;

import vo.FollowVO;
import vo.ProfileVO;

public interface IF_FollowListDao {

	public List<ProfileVO> getInterFollowersProfile(String followId) throws Exception;

	public List<ProfileVO> getFollowersProfile(String followId) throws Exception;

	public List<ProfileVO> getFollowingsProfile(String id) throws Exception;

	public void unfollow(FollowVO fvo) throws Exception;

	public void follow(FollowVO fvo) throws Exception;

	public int followingSelect(String id) throws Exception;
	
	public int followerSelect(String id) throws Exception;

}