package net.haebang.qna.service;

import java.util.List;

import net.haebang.vo.QnAVo;

public interface QnAService {

	List<QnAVo> selectAllBoard();
	void insertBoard(QnAVo QnA);
	void deleteBoard(int q_no);
	QnAVo selectOneBoard(int q_no);
	void updateBoard(QnAVo QnA);
	
}
