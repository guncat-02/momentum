package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ReportDAO;
import vo.ReportVO;

@Service
public class ReportService implements IF_ReportService {
	@Inject
	IF_ReportDAO rdao;
	@Override
	public void Report(ReportVO rvo) throws Exception {
		// TODO Auto-generated method stub
		rdao.report(rvo);
	}

}
