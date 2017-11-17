package net.haebang.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.MemberVo;

@Repository
public class MemberDAOimpl implements MemberDAO{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVo> selectAll() {
		
		List<MemberVo> list = sqlSession.selectList("net.haebang.member.dao.MemberDAO.selectAllMember");
		
		return list;
	}

	@Override
	public void insert(MemberVo Member) {
		
		sqlSession.insert("net.haebang.member.dao.MemberDAO.insertMember",Member);
		
	}

	@Override
	public MemberVo selectOne(String m_id) {
		System.out.println(m_id + "dao");
		return sqlSession.selectOne("net.haebang.member.dao.MemberDAO.selectInfo",m_id);
	}

	/*@Override
	public boolean loginCheck(MemberVO Member) {
		
		String m_name = sqlSession.selectOne("net.haebang.member.dao.MemberDAO.loginCheck",Member);
		return (m_name == null) ? false : true;
	}

	@Override
	public MemberVO viewMember(MemberVO Member) {
		System.out.println(Member+"dao");
		return sqlSession.selectOne("net.haebang.member.dao.MemberDAO.viewMember", Member);
	}*/

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVo login(MemberVo member) {
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDAO.login", member);
		return resultVO;
	}

	/*@Override
	public MemberVO login(MemberVO Member) {

		
		
		MemberVO resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDAO.login", Member);
		
		return resultVO;
	}*/
	
}
