package net.haebang.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.member.dao.MemberDao;
import net.haebang.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberDao dao;
	
	@Override
	public List<MemberVo> selectAllMember() {
		List<MemberVo> list = dao.selectAll();
		return list;
	}

	@Override
	public void insertMember(MemberVo Member) {
		dao.insert(Member);
		
	}

	@Override
	public MemberVo selectOneMember(String m_id) {
		System.out.println(m_id + "서비스");
		return dao.selectOne(m_id);
	}

	/*@Override
	public boolean loginCheck(MemberVO Member, HttpSession session) {
		boolean result = dao.loginCheck(Member);
		
		if (result) {
			MemberVO userVO = viewMember(Member);
			
			session.setAttribute("m_id", userVO.getM_id());
			session.setAttribute("m_name", userVO.getM_name());
			
		}
		System.out.println(Member+"서비스");
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO Member) {
		
		return dao.viewMember(Member);
	}*/

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	@Override
	public MemberVo login(MemberVo member) {
		return dao.login(member);
	}

	/*@Override
	public MemberVO login(MemberVO Member) {
		
		return dao.login(Member);
	}*/

	
}
