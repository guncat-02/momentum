package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import vo.PostVO;

@Repository
public class MainDAOImpl implements IF_MainDAO{
	public static String mapperQuery = "dao.IF_MainDAO";
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<PostVO> mainAll() {
		
		return sqlsession.selectList(mapperQuery+".mainList");
	}

	@Override
	public List<PostVO> attachAll() throws Exception {
		
		return sqlsession.selectList(mapperQuery+".attachList");
	}

	@Override
	public List<String> postAttach(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".postAttach",no);
	}

	

}
