package service;

import vo.MemberVO;

public interface IF_JoinService {

	
	public void inputMember(MemberVO mvo) throws Exception;
	
	public String chkid(String id) throws Exception;

	public String chkemail(String id) throws Exception;
}
