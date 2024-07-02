package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ReportVO;

@Repository
public class ReportDAO implements IF_ReportDAO{
	public static String mapperQuery = "dao.IF_ReportDAO";
	@Inject
	SqlSession sqlsession;
	@Override
	public void report(ReportVO rvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery+".report",rvo);
	}

}
