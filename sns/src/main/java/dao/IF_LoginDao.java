package dao;

import vo.MemberVO;

public interface IF_LoginDao {
	
	public MemberVO logindao(String id) throws Exception;
}
