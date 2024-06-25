package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ManagerDao;
import vo.CommVO;
import vo.MemberVO;
import vo.PostVO;
import vo.ProfileVO;

@Service
public class ManagerService implements IF_ManagerService{

	@Inject
	IF_ManagerDao mdao;
	
	@Override
	public List<MemberVO> getAllMembers() throws Exception {
		return mdao.getAllMembers();
	}

	@Override
	public List<ProfileVO> getAllProfiles() throws Exception {
		return mdao.getAllProfiles();
	}

	@Override
	public List<PostVO> getAllPosts() throws Exception {
		return mdao.getAllPosts();
	}

	@Override
	public List<CommVO> getAllComms() throws Exception {
		return mdao.getAllComms();
	}

	@Override
	public List<MemberVO> getAllAdmins() throws Exception {
		return mdao.getAllAdmins();
	}

}
