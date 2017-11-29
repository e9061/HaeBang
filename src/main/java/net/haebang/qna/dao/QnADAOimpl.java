package net.haebang.qna.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.QnAVo;

@Repository
public class QnADAOimpl implements QnADAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnAVo> selectAll(Map<String, Object> map) {
		System.out.println(map);
		List<QnAVo> list = sqlSession.selectList("net.haebang.qna.dao.QnADAO.selectAllBoard", map);
		return list;
	}

	@Override
	public void insert(QnAVo QnA) {
		sqlSession.insert("net.haebang.qna.dao.QnADAO.insertBoard",QnA);
		
	}

	@Override
	public void delete(int q_no) {
		sqlSession.delete("net.haebang.qna.dao.QnADAO.deleteBoard",q_no);
		
	}

	@Override
	public QnAVo selectOne(int q_no) {
		System.out.println(q_no+"dao");
		return sqlSession.selectOne("net.haebang.qna.dao.QnADAO.selectOneBoard",q_no);
	}

	@Override
	public void update(QnAVo QnA) {
		sqlSession.update("net.haebang.qna.dao.QnADAO.updateBoard",QnA);
		
	}

	@Override
	public void updateviewCnt(int q_no) {
		sqlSession.update("net.haebang.qna.dao.QnADAO.updateReadCnt",q_no);
		
	}

	@Override
	public double selectTotal(Map<String, Object> map) {
		int totalPage = sqlSession.selectOne("net.haebang.qna.dao.QnADAO.selectTotal", map);
		return totalPage;
	}

	
	

	
	
}
