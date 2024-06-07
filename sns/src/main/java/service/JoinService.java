package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_JoinDao;
import vo.MemberVO;

@Service
public class JoinService implements IF_JoinService{
	@Inject
	IF_JoinDao jdao;
	@Override
	public void inputMember(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mvo.toString());
		jdao.inputMember(mvo);
	}
	@Override
	public String chkid(String id) throws Exception {
		// TODO Auto-generated method stub
		return jdao.chkid(id);
	}

}
