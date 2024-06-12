package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_MainDAO;
import vo.MainVO;
@Service
public class MainServiceImpl implements IF_MainService{
	@Inject
	IF_MainDAO maindao;
	@Override
	public List<MainVO> mainAll(String id) throws Exception {
		
		return maindao.mainAll(id);
	}
	

}
