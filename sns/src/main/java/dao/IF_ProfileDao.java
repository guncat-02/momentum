package dao;

import java.util.List;

import vo.ProfileVO;

public interface IF_ProfileDao {
	public void insert(ProfileVO pVO) throws Exception;
	public int chk(String nickName) throws Exception;
	public ProfileVO select(String id) throws Exception;
	public void update(ProfileVO pVO) throws Exception;
	public String matchId(String id) throws Exception;
	public List<ProfileVO> selectProfile(String id) throws Exception;
	public List<ProfileVO> profileList(List<String> nick) throws Exception;
}
