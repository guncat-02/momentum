package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_LoginDao;
import vo.MemberVO;

@Service
public class LoginService implements IF_LoginService{
	
	@Inject
	IF_LoginDao ldao;
	
	@Override
	public MemberVO loginser(String id) throws Exception {
		// TODO Auto-generated method stub
		return ldao.logindao(id);
	}

	@Override
	public String chkidser(String id) throws Exception {
		// TODO Auto-generated method stub
		return ldao.chkiddao(id);
	}
	
	@Override
	public void updatepw(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mvo.getId()+ "/" + mvo.getPass());
		ldao.updatepw(mvo);
	}
}
