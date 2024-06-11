package dao;

import vo.MemberVO;

public interface IF_LoginDao {
	
	public MemberVO logindao(String id) throws Exception;
	
	public String chkiddao(String id) throws Exception;
	
	// 업데이트 비밀번호
	public void updatepw(MemberVO mvo) throws Exception;
}
