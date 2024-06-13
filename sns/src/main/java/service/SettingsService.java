package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_SettingsDao;
import vo.MemberVO;

@Service
public class SettingsService implements IF_SettingsService{

	@Inject
	IF_SettingsDao sdao;
	
	@Override
	public int certifyPass(MemberVO mvo) throws Exception {
		return sdao.certifyPass(mvo);
	}

	@Override
	public int changeName(MemberVO mvo) throws Exception {
		return sdao.changeName(mvo);
	}

	@Override
	public int deleteAccount(String id) throws Exception {
		return sdao.deleteAccount(id);
	}

}
