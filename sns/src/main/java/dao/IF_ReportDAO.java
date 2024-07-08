package dao;

import vo.BanVO;
import vo.ReportVO;

public interface IF_ReportDAO {

	public void report(ReportVO rvo) throws Exception;
	// 정지 테이블 넣기
	public void banmember(BanVO bvo) throws Exception;
}
