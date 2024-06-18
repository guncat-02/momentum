package dao;

import vo.MemberVO;

public interface IF_JoinDao {
	
	public void inputMember(MemberVO mvo) throws Exception;
	
	public String chkid(String id) throws Exception;
}
