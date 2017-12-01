package net.haebang.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

public interface MemberService {

	List<MemberVo> selectAllMember();
	void insertMember(MemberVo QnA);
	MemberVo selectOneMember(String m_id);
	void logout(HttpSession session);
	MemberVo login(MemberVo member);
	MemberVo blogin(MemberVo member);
	MemberVo mainLogin(MemberVo member);
	void updateMember(MemberVo member);
	
	
	
	/**********************공지사항*********************************/
	List<NoticeBoardVo> getNoticeList(String n_type, int page, String word, String searchCondition);
	int getLastPage(String n_type, String word, String searchCondition);
	NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);		
	/**************************************************************/
}
