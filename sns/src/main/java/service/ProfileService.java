package service;

import java.util.List;
import java.util.Map;

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
	// 모든 프로필리스트 가져오기
	@Override
	public List<ProfileVO> allprofileList() throws Exception {
		// TODO Auto-generated method stub
		return pDao.allprofileList();
	}

	//검색 결과 글 프로필
	@Override
	public List<ProfileVO> searchProfile(List<String> id) throws Exception {
		return pDao.searchProfile(id);
	}

	//사용자 검색 결과
	@Override
	public List<ProfileVO> searchUser(Map map) throws Exception {
		return pDao.searchUser(map);
	}

	//서브 프로필 추가
	@Override
	public void insertProfile(ProfileVO pVO) throws Exception {
		pDao.insertProfile(pVO);
	}

	//서브 프로필 가져오기
	@Override
	public List<ProfileVO> selectSub(String id) throws Exception {
		return pDao.selectSub(id);
	}

	//서브 프로필 수정
	@Override
	public void edit(Map map) throws Exception {
		pDao.edit(map);
	}
}
