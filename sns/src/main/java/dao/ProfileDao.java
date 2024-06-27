package dao;

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
}
