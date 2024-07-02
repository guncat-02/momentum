package service;

import java.util.List;

import vo.ProfileVO;

public interface IF_ProfileService {
	public void insert(ProfileVO pVO) throws Exception;
	public int chk(String nickName) throws Exception;
	public ProfileVO select(String id) throws Exception;
	public void update(ProfileVO pVO) throws Exception;
	public String matchId(String id) throws Exception;
	public List<ProfileVO> selectProfile(String id) throws Exception;
	public List<ProfileVO> profileList(List<String> nick) throws Exception;
	// 모든 프로필 리스트 가져오기
	public List<ProfileVO> allprofileList() throws Exception;
}
