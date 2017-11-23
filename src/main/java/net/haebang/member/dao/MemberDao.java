package net.haebang.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

public interface MemberDao {

	List<MemberVo> selectAll();
	void insert(MemberVo QnA);
	MemberVo selectOne(String m_id);
	/*boolean loginCheck(MemberVO Member);
	MemberVO viewMember(MemberVO Member);*/
	void logout(HttpSession session);
	MemberVo login(MemberVo member);
	
	
	/******************************** 공지사항 *************************************************/
    List<NoticeBoardVo> getNoticeList(Map<String, Object> map);
    double selectTotalCount(Map<String, Object> map);
    NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);
	/*************************************************************************************************/
}
