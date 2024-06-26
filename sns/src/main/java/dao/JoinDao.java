package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class JoinDao implements IF_JoinDao{
	private static String mapperQuery="dao.IF_JoinDao";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public void inputMember(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mvo.getEmail());
		sqlSession.insert(mapperQuery+".inputMember", mvo);
	}
	@Override
	public String chkid(String id) throws Exception {
		// TODO Auto-generated method stub
		if(sqlSession.selectOne(mapperQuery+".chkid", id) == null) {
			
			return "true";
		}else {
			return "false";
		}
		 
	}
	@Override
	public String chkemail(String id) {
		// TODO Auto-generated method stub
		String dd = sqlSession.selectOne(mapperQuery+".chkemail", id);
		return sqlSession.selectOne(mapperQuery+".chkemail", id);
		
	}
	@Override
	public String chkdupemaip(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".chkdupemail", email);
	}

}
