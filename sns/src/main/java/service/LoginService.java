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

}
