package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.BanVO;
import vo.CommVO;
import vo.MemberVO;
import vo.PageVO;
import vo.PostVO;
import vo.ProfileVO;
import vo.ReportVO;

@Repository
public class ManagerDao implements IF_ManagerDao{

	private static String mapperQuery = "dao.IF_ManagerDao";
	
	@Inject
	SqlSession sql;

	@Override
	public List<MemberVO> getAllMembers() throws Exception {
		return sql.selectList(mapperQuery+".selectAllMembers");
	}

	@Override
	public List<ProfileVO> getAllProfiles() throws Exception {
		return sql.selectList(mapperQuery+".selectAllProfiles");
	}

	@Override
	public List<PostVO> getAllPosts() throws Exception {
		return sql.selectList(mapperQuery+".selectAllPosts");
	}

	@Override
	public List<CommVO> getAllComms() throws Exception {
		return sql.selectList(mapperQuery+".selectAllComms");
	}

	@Override
	public List<MemberVO> getAllAdmins() throws Exception {
		return sql.selectList(mapperQuery+".selectAllAdmins");
	}

	@Override
	public List<BanVO> getAllBanned() throws Exception {
		return sql.selectList(mapperQuery+".selectAllBanned");
	}

	@Override
	public List<MemberVO> searchMembers(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectMembersWhere", pvo);
	}

	@Override
	public List<ProfileVO> searchProfiles(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectProfilesWhere", pvo);
	}

	@Override
	public List<PostVO> searchPosts(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectPostsWhere", pvo);
	}

	@Override
	public List<CommVO> searchComms(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectCommsWhere", pvo);
	}

	@Override
	public List<MemberVO> searchAdmins(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectMembersWhere", pvo);
	}
	
	// 검색 X 시 모든 튜플 카운트
	@Override
	public int getTotalCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectAllCounts", pvo);
	}

	// 검색 시 조건에 맞는 튜플 카운트
	@Override
	public int getMembersSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectMemberCountWhere", pvo);
	}

	@Override
	public int getProfilesSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectProfileCountWhere", pvo);
	}

	@Override
	public int getPostsSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectPostCountWhere", pvo);
	}

	@Override
	public int getCommsSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectCommCountWhere", pvo);
	}

	@Override
	public int getAdminsSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectMemberCountWhere", pvo);
	}

	@Override
	public List<ReportVO> getAllreport_post() {
		// TODO Auto-generated method stub
		return sql.selectList(mapperQuery+".getAllreport_post");
	}

	@Override
	public List<ReportVO> getAllreport_comm() {
		// TODO Auto-generated method stub
		return sql.selectList(mapperQuery+".getAllreport_comm");
	}

	@Override
	public List<ReportVO> getAllreport_chat() {
		// TODO Auto-generated method stub
		return sql.selectList(mapperQuery+".getAllreport_chat");
	}

	public int getAllMemberCount() throws Exception {
		return sql.selectOne(mapperQuery+".selectMemberCount");
	}

	@Override
	public int getTodayReportCount() throws Exception {
		return sql.selectOne(mapperQuery+".selectReportCountWhere");
	}

	@Override
	public int getCurBannedCount() throws Exception {
		return sql.selectOne(mapperQuery+".selectSysdateBannedCount");
	}

	@Override
	public int removePastSearchWord() throws Exception {
		return sql.delete(mapperQuery+".deleteKeyWordWhere");
	}

	@Override
	public List<BanVO> searchBanned(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectBannedWhere", pvo);
	}

	@Override
	public int getBannedSearchCount(PageVO pvo) throws Exception {
		return sql.selectOne(mapperQuery+".selectBannedCountWhere", pvo);
	}


}
