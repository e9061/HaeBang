package net.haebang.qna.dao;

import java.util.List;
import java.util.Map;

import net.haebang.vo.QnAVo;


public interface QnADAO {

	List<QnAVo> selectAll(Map<String, Object> map);
	void insert(QnAVo QnA);
	void delete(int q_no);
	QnAVo selectOne(int q_no);
	void update(QnAVo QnA);
	void updateviewCnt(int q_no);
	double selectTotal(Map<String, Object> map);
	
}
