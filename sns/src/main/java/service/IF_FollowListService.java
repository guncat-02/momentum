package service;

import java.util.List;

import vo.FollowVO;
import vo.ProfileVO;

public interface IF_FollowListService {
	
	public List<ProfileVO> getInterFollowersProfile(String followId) throws Exception;
	
	public List<ProfileVO> getFollowersProfile(String followId) throws Exception;
	
	public List<ProfileVO> getFollowingsProfile(String id) throws Exception;
	
	public List<String> getFollowingsId(String id) throws Exception;
	
	public int unfollow(FollowVO fvo) throws Exception;
	
	public int follow(FollowVO fvo) throws Exception;
	
	public int followingSelect(String id) throws Exception;
	
	public int followerSelect(String id) throws Exception;

	public List<ProfileVO> followingList(String id) throws Exception;
	
	public List<ProfileVO> followerList(String id) throws Exception;
}
