package service;

import java.util.List;

import vo.CommVO;
import vo.MemberVO;
import vo.PostVO;
import vo.ProfileVO;

public interface IF_ManagerService {

	public List<MemberVO> getAllMembers() throws Exception;
	
	public List<ProfileVO> getAllProfiles() throws Exception;
	
	public List<PostVO> getAllPosts() throws Exception;
	
	public List<CommVO> getAllComms() throws Exception;
	
	public List<MemberVO> getAllAdmins() throws Exception;
	
	// public List<BanVO> getAllBanned() throws Exception;
	
}
