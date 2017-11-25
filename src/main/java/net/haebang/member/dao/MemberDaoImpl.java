package net.haebang.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVo> selectAll() {
		
		List<MemberVo> list = sqlSession.selectList("net.haebang.member.dao.MemberDao.selectAllMember");
		
		return list;
	}

	@Override
	public void insert(MemberVo Member) {
		
		sqlSession.insert("net.haebang.member.dao.MemberDao.insertMember",Member);
		
	}

	@Override
	public MemberVo selectOne(String m_id) {
		System.out.println(m_id + "dao");
		return sqlSession.selectOne("net.haebang.member.dao.MemberDao.selectInfo",m_id);
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
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDao.login", member);
		return resultVO;
	}


	/*@Override
	public MemberVO login(MemberVO Member) {

		
		
		MemberVO resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDAO.login", Member);
		
		return resultVO;
	}*/
	
	
	
	/****************************************** 공지사항 *****************************************************/
	
	@Override
	public List<NoticeBoardVo> getNoticeList(Map<String, Object> map) {
		System.out.println("impl map : " + map);
		List<NoticeBoardVo> getNoticeList = sqlSession.selectList("net.haebang.member.dao.MemberDao.getNoticeList", map);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!"+getNoticeList+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return getNoticeList;
	}
	@Override
	public double selectTotalCount(Map<String, Object> map) {
		int totalPage = sqlSession.selectOne("net.haebang.member.dao.MemberDao.selectTotalCount",map); 
		return totalPage;
	}
	@Override
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		sqlSession.update("net.haebang.member.dao.MemberDao.updateViewCnt",noticeBoardVo);
		NoticeBoardVo getNoticeBoardByNo = sqlSession.selectOne("net.haebang.member.dao.MemberDao.selectOneNDetailByNo",noticeBoardVo);
		return getNoticeBoardByNo;
	}

	/*******************************************************************************************************/
	
	
	
	
}
