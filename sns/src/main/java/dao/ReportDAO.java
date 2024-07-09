package dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.BanVO;
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
	@Override
	public void banmember(BanVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery+".banmember",bvo);
	}
	@Override
	public void innocence(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery+".innocence",params);
	}

}
