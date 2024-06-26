package service;

import java.util.List;

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
	
	//프로필 정보 불러오기
	@Override
	public ProfileVO select(String id) throws Exception {
		return pDao.select(id);
	}

	//프로필 수정
	@Override
	public void update(ProfileVO pVO) throws Exception {
		pDao.update(pVO);
	}

	@Override
	public String matchId(String id) throws Exception {
		return pDao.matchId(id);
	}

	//아이디와 일치한 모든 프로필 불러오기
	@Override
	public List<ProfileVO> selectProfile(String id) throws Exception {
		return pDao.selectProfile(id);
	}

	//채팅 시 프로필 불러오기
	@Override
	public List<ProfileVO> profileList(List<String> nick) throws Exception {
		return pDao.profileList(nick);
	}
}
