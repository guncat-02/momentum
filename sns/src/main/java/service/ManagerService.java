package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ManagerDao;
import vo.BanVO;
import vo.CommVO;
import vo.MemberVO;
import vo.PageVO;
import vo.PostVO;
import vo.ProfileVO;
import vo.ReportVO;

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

	@Override
	public List<BanVO> getAllBanned() throws Exception {
		return mdao.getAllBanned();
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
	// 신고 글 가져오기
	@Override
	public List<ReportVO> getAllreport_post() throws Exception {
		// TODO Auto-generated method stub
		return mdao.getAllreport_post();
	}

	@Override
	public List<ReportVO> getAllreport_comm() throws Exception {
		// TODO Auto-generated method stub
		return mdao.getAllreport_comm();
	}

	@Override
	public List<ReportVO> getAllreport_chat() throws Exception {
		// TODO Auto-generated method stub
		return mdao.getAllreport_chat();
	}

	@Override
	public int getAllMemberCount() throws Exception {
		return mdao.getAllMemberCount();
	}

	@Override
	public int getTodayReportCount() throws Exception {
		return mdao.getTodayReportCount();
	}

	@Override
	public int getCurBannedCount() throws Exception {
		return mdao.getCurBannedCount();
	}

	@Override
	public int removePastSearchWord() throws Exception {
		return mdao.removePastSearchWord();
	}

	@Override
	public List<BanVO> searchBanned(PageVO pvo) throws Exception {
		return mdao.searchBanned(pvo);
	}

	@Override
	public int getBannedSearchCount(PageVO pvo) throws Exception {
		return mdao.getBannedSearchCount(pvo);
	}






}
