package dao;

import vo.MemberVO;

public interface IF_SettingsDao {

	public int certifyPass(MemberVO mvo) throws Exception;
	
	public int changeName(MemberVO mvo) throws Exception;
	
	public int deleteAccount(String id) throws Exception;
	
}
