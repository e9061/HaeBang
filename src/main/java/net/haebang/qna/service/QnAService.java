package net.haebang.qna.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.QnAVo;

public interface QnAService {

	List<QnAVo> selectAllBoard(int page);
	void insertBoard(QnAVo QnA, MultipartHttpServletRequest request);
	void deleteBoard(int q_no);
	QnAVo selectOneBoard(int q_no);
	void updateBoard(QnAVo QnA);
	void updateViewCnt(int q_no);
	int getLastPage();
	
}
