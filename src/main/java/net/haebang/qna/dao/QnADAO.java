package net.haebang.qna.dao;

import java.util.List;

import net.haebang.vo.QnAVo;


public interface QnADAO {

	List<QnAVo> selectAll();
	void insert(QnAVo QnA);
	void delete(int q_no);
	QnAVo selectOne(int q_no);
	void update(QnAVo QnA);
	
}
