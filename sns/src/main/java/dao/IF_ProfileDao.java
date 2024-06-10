package dao;

import vo.ProfileVO;

public interface IF_ProfileDao {
	public void insert(ProfileVO pVO) throws Exception;
	public int chk(String nickName) throws Exception;
}
