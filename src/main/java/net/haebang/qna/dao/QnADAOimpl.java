package net.haebang.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.QnAVo;

@Repository
public class QnADAOimpl implements QnADAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnAVo> selectAll() {
		List<QnAVo> list = sqlSession.selectList("net.haebang.qna.dao.QnADAO.selectAllBoard");
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
		
		return sqlSession.selectOne("net.haebang.qna.dao.QnADAO.selectOneBoard",q_no);
	}

	@Override
	public void update(QnAVo QnA) {
		sqlSession.update("net.haebang.qna.dao.QnADAO.updateBoard",QnA);
		
	}
	

	
	
}
