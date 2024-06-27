package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class SettingsDao implements IF_SettingsDao{
	
	private static String mapperQuery = "dao.IF_SettingsDao";
	
	@Inject
	SqlSession sql;

	@Override
	public int certifyPass(MemberVO mvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectCountPass", mvo);
	}

	@Override
	public int changeName(MemberVO mvo) throws Exception {
		return sql.update(mapperQuery+".updateMemberName", mvo);
	}

	@Override
	public int deleteAccount(String id) throws Exception {
		return sql.delete(mapperQuery+".deleteMember", id);
	}

}
