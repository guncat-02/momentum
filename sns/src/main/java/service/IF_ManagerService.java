package service;

import java.util.List;

import vo.BanVO;
import vo.CommVO;
import vo.MemberVO;
import vo.PageVO;
import vo.PostVO;
import vo.ProfileVO;
import vo.ReportVO;

public interface IF_ManagerService {

	public List<MemberVO> getAllMembers() throws Exception;
	
	public List<ProfileVO> getAllProfiles() throws Exception;
	
	public List<PostVO> getAllPosts() throws Exception;
	
	public List<CommVO> getAllComms() throws Exception;
	
	public List<MemberVO> getAllAdmins() throws Exception;
	
	public List<BanVO> getAllBanned() throws Exception;
	
	public List<MemberVO> searchMembers(PageVO pvo) throws Exception;
	
	public List<ProfileVO> searchProfiles(PageVO pvo) throws Exception;
	
	public List<PostVO> searchPosts(PageVO pvo) throws Exception;

	public List<CommVO> searchComms(PageVO pvo) throws Exception;
	
	public List<MemberVO> searchAdmins(PageVO pvo) throws Exception;
	
	public List<BanVO> searchBanned(PageVO pvo) throws Exception;
	
	public int getTotalCount(PageVO pvo) throws Exception;
	
	public int getMembersSearchCount(PageVO pvo) throws Exception;

	public int getProfilesSearchCount(PageVO pvo) throws Exception;
	
	public int getPostsSearchCount(PageVO pvo) throws Exception;

	public int getCommsSearchCount(PageVO pvo) throws Exception;
	
	public int getAdminsSearchCount(PageVO pvo) throws Exception;
	
	public int getBannedSearchCount(PageVO pvo) throws Exception;
	// 신고 가져오기
	public List<ReportVO> getAllreport_post() throws Exception;

	public List<ReportVO> getAllreport_comm() throws Exception;

	public List<ReportVO> getAllreport_chat() throws Exception;
	
//	public int getMemberSearchCount(PageVO pvo) throws Exception;

	public int getAllMemberCount() throws Exception;
	
	public int getTodayReportCount() throws Exception;
	
	public int getCurBannedCount() throws Exception;
	
	public int removePastSearchWord() throws Exception;
	
}
