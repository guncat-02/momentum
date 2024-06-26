package dao;

import vo.MemberVO;

public interface IF_JoinDao {
	
	public void inputMember(MemberVO mvo) throws Exception;
	
	public String chkid(String id) throws Exception;

	public String chkemail(String id) throws Exception;

	public String chkdupemaip(String email);
}
