package dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.CommVO;
import vo.PostVO;

@Repository
public class CommDao implements IF_CommDao {

	private static String mapperQuery = "dao.IF_CommDao";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void inputComm(CommVO cvo) throws Exception {
		sqlSession.insert(mapperQuery + ".inputComm", cvo);
	}

	@Override
	public List<CommVO> takeComm(CommVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".takeComm", cvo);
	}

	@Override
	public List<CommVO> CommList(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".CommList", no);
	}

	@Override
	public int cntComm(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".cntComm", no);
	}

	@Override
	public int takelikecnt(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".takelikecnt", c_no);

	}

	@Override
	public int takedislikecnt(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".takedislikecnt", c_no);
	}

	// 좋아요 테이블에 추가
	@Override
	public void incommlike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectOne(mapperQuery + ".incommlike", cvo);
	}

	// 싫어요 테이블에 추가
	@Override
	public void incommdislike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectOne(mapperQuery + ".incommdislike", cvo);
	}

	@Override
	public void cancelcommlike(CommVO cvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(cvo.getC_no());
		System.out.println(cvo.getId());
		sqlSession.delete(mapperQuery + ".cancelcommlike", cvo);
	}

	@Override
	public void setlike(HashMap<String, Integer> params) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(params);
		sqlSession.update(mapperQuery + ".updatelike", params);
	}

	@Override
	public void setdislike(HashMap<String, Integer> params) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery + ".updatedislike", params);
	}

	// 좋아요 순
	@Override
	public List<CommVO> orderlikecomm(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".likeCommList", no);
	}

	// 싫어요 순
	@Override
	public List<CommVO> orderdislikecomm(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".dislikeCommList", no);
	}

	@Override
	public List<Integer> chklike(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".chklike", params);
	}

	@Override
	public List<Integer> chkdislike(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".chkdislike", params);
	}

	// 해당 글의 내가 쓴 댓글 번호 리스트
	@Override
	public List<Integer> mycomm(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".mycomm", params);
	}

	// 댓글 삭제
	@Override
	public void delcomm(int c_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery + ".delcomm", c_no);
	}
	// 내 댓글 리스트
	@Override
	public List<CommVO> myCommList(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".myCommList", id);
	}
	// 내가 쓴 댓글의 글 정보 리스트
	@Override
	public List<PostVO> mycpList(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".mycpList", id);
	}

	@Override
	public int mycommcnt(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".mycommcnt", id);
	}


}
