package service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ManagerDao;
import vo.CommVO;
import vo.ManagerVO;
import vo.MemberVO;
import vo.PageVO;
import vo.PostVO;
import vo.ProfileVO;

@Service
public class ManagerService implements IF_ManagerService{

	@Inject
	IF_ManagerDao mdao;
	
	@Override
	public List<MemberVO> getAllMembers(PageVO pvo) throws Exception {
		return mdao.getAllMembers(pvo);
	}

	@Override
	public List<ProfileVO> getAllProfiles(PageVO pvo) throws Exception {
		return mdao.getAllProfiles(pvo);
	}

	@Override
	public List<PostVO> getAllPosts(PageVO pvo) throws Exception {
		return mdao.getAllPosts(pvo);
	}

	@Override
	public List<CommVO> getAllComms(PageVO pvo) throws Exception {
		return mdao.getAllComms(pvo);
	}

	@Override
	public List<MemberVO> getAllAdmins(PageVO pvo) throws Exception {
		return mdao.getAllAdmins(pvo);
	}

	@Override
	public List<MemberVO> searchMembers(PageVO pvo) throws Exception {
		return mdao.searchMembers(pvo);
	}

	@Override
	public List<ProfileVO> searchProfiles(PageVO pvo) throws Exception {
		return mdao.searchProfiles(pvo);
	}

	@Override
	public List<PostVO> searchPosts(PageVO pvo) throws Exception {
		return mdao.searchPosts(pvo);
	}

	@Override
	public List<CommVO> searchComms(PageVO pvo) throws Exception {
		return mdao.searchComms(pvo);
	}

	@Override
	public List<MemberVO> searchAdmins(PageVO pvo) throws Exception {
		return mdao.searchAdmins(pvo);
	}

	@Override
	public int getTotalCount(PageVO pvo) throws Exception {
		return mdao.getTotalCount(pvo);
	}

	@Override
	public int getMembersSearchCount(PageVO pvo) throws Exception {
		return mdao.getMembersSearchCount(pvo);
	}

	@Override
	public int getProfilesSearchCount(PageVO pvo) throws Exception {
		return mdao.getProfilesSearchCount(pvo);
	}

	@Override
	public int getPostsSearchCount(PageVO pvo) throws Exception {
		return mdao.getPostsSearchCount(pvo);
	}

	@Override
	public int getCommsSearchCount(PageVO pvo) throws Exception {
		return mdao.getCommsSearchCount(pvo);
	}

	@Override
	public int getAdminsSearchCount(PageVO pvo) throws Exception {
		return mdao.getAdminsSearchCount(pvo);
	}

}
