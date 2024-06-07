package service;

import vo.ProfileVO;

public interface IF_ProfileService {
	public void insert(ProfileVO pVO) throws Exception;
	public int chk(String nickName) throws Exception;
}
