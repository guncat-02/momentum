package dao;

import java.util.HashMap;

import vo.BanVO;
import vo.ReportVO;

public interface IF_ReportDAO {

	public void report(ReportVO rvo) throws Exception;
	// 정지 테이블 넣기
	public void banmember(BanVO bvo) throws Exception;
	// 무죄 튜플 삭제
	public void innocence(HashMap<String, Object> params) throws Exception;
}
