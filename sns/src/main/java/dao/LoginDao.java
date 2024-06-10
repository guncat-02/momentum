package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class LoginDao implements IF_LoginDao{
	public static String mapperQuery = "dao.IF_LoginDao";
	@Inject
	SqlSession sqlsession;
	@Override
	public MemberVO logindao(String id) throws Exception {
		
		
		return sqlsession.selectOne(mapperQuery+".loginchk", id);
	}
	
}
