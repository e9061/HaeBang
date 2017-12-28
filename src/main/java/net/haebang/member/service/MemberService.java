package net.haebang.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;
import net.haebang.vo.QnAVo;

public interface MemberService {

	List<MemberVo> selectAllMember();
	int insertMember(MemberVo QnA, HttpServletResponse response) throws Exception;
	MemberVo selectOneMember(String m_id);
	void logout(HttpSession session);
	MemberVo login(MemberVo member, HttpServletResponse response) throws Exception;
	MemberVo loginModal(MemberVo member);
	MemberVo blogin(MemberVo member);
	MemberVo mainLogin(MemberVo member, HttpServletResponse response) throws Exception;
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
	
	String create_key() throws Exception;
	void send_mail(MemberVo member) throws Exception;
	void approval_member(MemberVo member, HttpServletResponse response) throws Exception;
	
	
}