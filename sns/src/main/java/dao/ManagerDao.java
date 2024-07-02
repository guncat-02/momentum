package dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.CommVO;
import vo.ManagerVO;
import vo.MemberVO;
import vo.PageVO;
import vo.PostVO;
import vo.ProfileVO;

@Repository
public class ManagerDao implements IF_ManagerDao{

	private static String mapperQuery = "dao.IF_ManagerDao";
	
	@Inject
	SqlSession sql;
	
	@Override
	public List<MemberVO> getAllMembers(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectAllMembers", pvo);
	}

	@Override
	public List<ProfileVO> getAllProfiles(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectAllProfiles", pvo);
	}

	@Override
	public List<PostVO> getAllPosts(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectAllPosts", pvo);
	}

	@Override
	public List<CommVO> getAllComms(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectAllComms", pvo);
	}

	@Override
	public List<MemberVO> getAllAdmins(PageVO pvo) throws Exception {
		return sql.selectList(mapperQuery+".selectAllAdmins", pvo);
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

}
