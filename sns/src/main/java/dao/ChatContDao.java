package dao;

import java.util.List;

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
}
