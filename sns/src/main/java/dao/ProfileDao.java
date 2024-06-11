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
		System.out.println(pVO.getId()+"dao");
		sql.insert(mapperQuery+".insert", pVO);
	}

	//닉네임 중복 체크
	@Override
	public int chk(String nickName) throws Exception {
		return sql.selectOne(mapperQuery+".chk", nickName);
	}

	@Override
	public String matchId(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(mapperQuery+".matchId", id);
	}
}
