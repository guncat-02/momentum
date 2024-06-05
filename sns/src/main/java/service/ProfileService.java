package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ProfileDao;
import vo.ProfileVO;

@Service
public class ProfileService implements IF_ProfileService{
	@Inject
	IF_ProfileDao pDao;
	
	//profile table에 insert
	@Override
	public void insert(ProfileVO pVO) throws Exception {
		pDao.insert(pVO);
	}

	//닉네임 중복 체크
	@Override
	public int chk(String nickName) throws Exception {
		return pDao.chk(nickName);
	}

}
