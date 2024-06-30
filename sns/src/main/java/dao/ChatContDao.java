package dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ChatContVO;

@Repository
public class ChatContDao implements IF_ChatContDao {
	@Inject
	SqlSession sql;
	
	private static String mapperQuery = "dao.IF_ChatContDao";

	//chatcont 를 불러오기 위한 메서드
	@Override
	public List<ChatContVO> selectCont(String chatNum) throws Exception {
		return sql.selectList(mapperQuery+".selectCont", chatNum);
	}

	//chatcont table에 insert
	@Override
	public void insert(ChatContVO ccVO) throws Exception {
		sql.insert(mapperQuery+".insert", ccVO);
	}

	//chatAttach table에 insert
	@Override
	public void insertAttach(Map<String, Object> attach) throws Exception {
		sql.insert(mapperQuery+".insertAttach", attach);
	}

	//chatAttach 를 불러오기 위한 메서드
	@Override
	public List<ChatContVO> selectAttach(String chatNum) throws Exception {
		return sql.selectList(mapperQuery+".selectAttach", chatNum);
	}
}
