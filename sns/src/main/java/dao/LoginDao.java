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
	@Override
	public String chkiddao(String id) throws Exception {
		// TODO Auto-generated method stub
		if(sqlsession.selectOne(mapperQuery+".changechkid", id) == null) {
			return "empty";
		}else {
			return "chkid";
		}
		
	}
	@Override
	public void updatepw(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mvo.getId()+ "/" + mvo.getPass());
		sqlsession.update(mapperQuery+".updatepw", mvo);
	}
	@Override
	public String chkBan(String id) throws Exception {
		// TODO Auto-generated method stub
		if(sqlsession.selectOne(mapperQuery+".chkBan", id) != null) {
			return sqlsession.selectOne(mapperQuery+".chkBan", id);
		}else {
			return null;
		}
		
	}
	
}
