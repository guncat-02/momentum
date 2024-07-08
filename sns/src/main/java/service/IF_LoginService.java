package service;

import vo.MemberVO;

public interface IF_LoginService {

	public MemberVO loginser(String id) throws Exception;
	
	public String chkidser(String id) throws Exception;
	
	public void updatepw(MemberVO mvo) throws Exception;

	public String chkBan(String id) throws Exception;
}
