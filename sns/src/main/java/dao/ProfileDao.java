package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ProfileVO;

@Repository
public class ProfileDao implements IF_ProfileDao{
	@Inject
	SqlSession sql;
	
	private static String mapperQuery = "dao.IF_ProfileDao";
	
	//profile table에 insert
	@Override
	public void insert(ProfileVO pVO) throws Exception {
		sql.insert(mapperQuery+".insert", pVO);
	}

	//닉네임 중복 체크
	@Override
	public int chk(String nickName) throws Exception {
		return sql.selectOne(mapperQuery+".chk", nickName);
	}
	
	//프로필 정보 불러오기
	@Override
	public ProfileVO select(String id) throws Exception {
		return sql.selectOne(mapperQuery+".select", id);
	}
	
	//프로필 수정
	@Override
	public void update(ProfileVO pVO) throws Exception {
		sql.update(mapperQuery+".update", pVO);
	}

	@Override
	public String matchId(String id) throws Exception {
		return sql.selectOne(mapperQuery+".matchId", id);
	}

	//아이디와 일치한 모든 프로필 불러오기
	@Override
	public List<ProfileVO> selectProfile(String id) throws Exception {
		return sql.selectList(mapperQuery+".selectProfile", id);
	}

	//채팅 시 프로필 불러오기
	@Override
	public List<ProfileVO> profileList(List<String> nick) throws Exception {
		return sql.selectList(mapperQuery+".profileList", nick);
	}
	// 모든 프로필 리스트 가져오기
	@Override
	public List<ProfileVO> allprofileList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(mapperQuery+".allprofileList");
	}
}
