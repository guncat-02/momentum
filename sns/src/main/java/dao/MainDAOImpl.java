package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MainVO;

@Repository
public class MainDAOImpl implements IF_MainDAO{
	public static String mapperQuery = "dao.IF_MainDAO";
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<MainVO> mainAll(String id) {
		
		return sqlsession.selectList(mapperQuery+".mainList",id);
	}

}
