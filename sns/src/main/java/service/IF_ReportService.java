package service;

import java.util.HashMap;

import vo.BanVO;
import vo.ReportVO;

public interface IF_ReportService {
	// 신고 넣기
	public void Report(ReportVO rvo) throws Exception;
	// 정지 테이블 넣기
	public void banmember(BanVO bvo) throws Exception;
	// 신고 글 삭제
	public void innocence(HashMap<String, Object> params) throws Exception;

}
