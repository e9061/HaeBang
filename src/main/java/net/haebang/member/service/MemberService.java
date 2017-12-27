package net.haebang.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/*************************  mypage 수정  ************************************/
	void changeMyInfo(Map<String,Object> map);
	
	/*************************  my reservation  ************************************/
	MemberVo getMyPageInfo(String m_id);
	List<HashMap<String, Object>> getReservListByMId(String m_id);
	Map<String, Object> myReservDetail(Map<String, Object> map);
	// mo_orderNo 일치하는 서비스 모두 취소
	void cancleServiceByOdNo(String mo_orderNo);
	// 일정 변경
	void changeDate(Map<String, Object> map);
	String getMoCallFlag(int mo_no);
	
	/*************************  my reservation  ************************************/
	
	
}