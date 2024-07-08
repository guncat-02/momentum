package service;

import vo.BanVO;
import vo.ReportVO;

public interface IF_ReportService {
	// 신고 넣기
	public void Report(ReportVO rvo) throws Exception;
	// 정지 테이블 넣기
	public void banmember(BanVO bvo) throws Exception;

}
