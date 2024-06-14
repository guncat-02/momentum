package service;

import vo.ProfileVO;

public interface IF_ProfileService {
	public void insert(ProfileVO pVO) throws Exception;
	public int chk(String nickName) throws Exception;
	public ProfileVO select(String id) throws Exception;
	public void update(ProfileVO pVO) throws Exception;
	public String matchId(String id) throws Exception;
}
