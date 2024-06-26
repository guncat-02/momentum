package service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_BlockDao;
import vo.BlockVO;
import vo.ProfileVO;

@Service
public class BlockService implements IF_BlockService{

	@Inject
	IF_BlockDao bdao;
	

	@Override
	public List<ProfileVO> getBlocked(String id) throws Exception {
		return bdao.getBlocked(id);
	}


	@Override
	public void block(HashMap<String, Object> map) throws Exception {
		bdao.block(map);
	}


	@Override
	public void unblock(HashMap<String, String> map) throws Exception {
		bdao.unblock(map);
	}


	@Override
	public int chkBlocked(BlockVO bvo) throws Exception {
		return bdao.chkBlocked(bvo);
	}

	
}
