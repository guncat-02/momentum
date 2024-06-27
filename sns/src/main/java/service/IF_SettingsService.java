package service;

import vo.MemberVO;

public interface IF_SettingsService {

	public int certifyPass(MemberVO mvo) throws Exception;
	
	public int changeName(MemberVO mvo) throws Exception;
	
	public int deleteAccount(String id) throws Exception;
	
}
