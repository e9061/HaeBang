package net.haebang.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.qna.dao.QnADAO;
import net.haebang.vo.QnAVo;

@Service
public class QnAServiceimpl implements QnAService{

	@Autowired
	QnADAO dao;
	
	@Override
	public List<QnAVo> selectAllBoard() {
		List<QnAVo> list = dao.selectAll();
		return list;
	}

	@Override
	public void insertBoard(QnAVo QnA) {
		dao.insert(QnA);
		
	}

	@Override
	public void deleteBoard(int q_no) {
		dao.delete(q_no);
		
	}

	@Override
	public QnAVo selectOneBoard(int q_no) {
		return dao.selectOne(q_no);
	}

	@Override
	public void updateBoard(QnAVo QnA) {
		dao.update(QnA);
		
	}

	
	
}
