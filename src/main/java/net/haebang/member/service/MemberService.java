package net.haebang.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.haebang.vo.MemberVo;

public interface MemberService {

	List<MemberVo> selectAllMember();
	void insertMember(MemberVo QnA);
	MemberVo selectOneMember(String m_id);
	/*boolean loginCheck(MemberVO Member, HttpSession session);
	MemberVO viewMember(MemberVO Member);*/
	void logout(HttpSession session);
	MemberVo login(MemberVo member);
	
}
