package net.haebang.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

public interface MemberDao {

	List<MemberVo> selectAll();
	void insert(MemberVo Member);
	MemberVo selectOne(String m_id);
	void logout(HttpSession session);
	MemberVo login(MemberVo member);
	MemberVo selectById(String m_id);
	MemberVo blogin(MemberVo member);
	MemberVo mainLogin(MemberVo member);
	void updateMember(MemberVo member);
	
	
	/******************************** 공지사항 *************************************************/
    List<NoticeBoardVo> getNoticeList(Map<String, Object> map);
    double selectTotalCount(Map<String, Object> map);
    NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);
	/*************************************************************************************************/
}
