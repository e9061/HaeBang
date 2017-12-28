package net.haebang.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public MemberVo loginModal(MemberVo member) {
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDao.login", member);
		return resultVO;
	}
	
	
	

	@Transactional
	@Override
	public int insert(MemberVo Member) throws Exception{
		
		return sqlSession.insert("net.haebang.member.dao.MemberDao.insertMember",Member);
		
	}

	@Override
	public MemberVo selectOne(String m_id) {
		System.out.println(m_id + "dao");
		return sqlSession.selectOne("net.haebang.member.dao.MemberDao.selectInfo",m_id);
	}


	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVo login(MemberVo member) {
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDao.login", member);
		return resultVO;
	}

	@Override
	public MemberVo selectById(String m_id) {
		MemberVo memberVo = sqlSession.selectOne("net.haebang.member.dao.MemberDao.selectById", m_id);
		return memberVo;
	}

	@Override
	public MemberVo blogin(MemberVo member) {
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDao.blogin", member);
		return resultVO;
	}

	@Override
	public MemberVo mainLogin(MemberVo member) {
		MemberVo resultVO = sqlSession.selectOne("net.haebang.member.dao.MemberDao.login", member);
		return resultVO;
	}

	@Override
	public void updateMember(MemberVo member) {
		System.out.println(member+"dao");
		sqlSession.update("net.haebang.member.dao.MemberDao.updateMember", member);
		
	}


	
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
	
	
	/*********************************** 소비자 예약정보 가져오기 **********************************************************/
	@Override
	public MemberVo getMyPageInfo(String m_id) {
		MemberVo getMyPageInfo  = sqlSession.selectOne("net.haebang.member.dao.MemberDao.getMyPageInfo",m_id);
		return getMyPageInfo;
	}
	@Override
	public void changeMyInfo(Map<String,Object> map) {
		sqlSession.update("net.haebang.member.dao.MemberDao.changeMyInfo",map);
		
	}
	
	
	/*********************************** 소비자 예약정보 가져오기 **********************************************************/
	@Override
	public List<HashMap<String, Object>> getReservListByMId(String m_id) {
		List<HashMap<String, Object>> getReservListByMId = sqlSession.selectList("net.haebang.member.dao.MemberDao.getReservListByMId", m_id);
		return getReservListByMId;
	}

	@Override
	public Map<String, Object> myReservDetail(Map<String, Object> map) {
		Map<String, Object> myReservDetail = sqlSession.selectOne("net.haebang.member.dao.MemberDao.myReservDetail",map);
		return myReservDetail;
	}

	// orderNo에 해당하는 서비스들 삭제(취소)
	@Override
	public void cancleServiceByOdNo(String mo_orderNo) {
		sqlSession.delete("net.haebang.member.dao.MemberDao.cancleServiceByOdNo", mo_orderNo);
	}

	// 일정 변경
	@Override
	public void changeDate(Map<String, Object> map) {
		sqlSession.update("net.haebang.member.dao.MemberDao.changeDate", map);
	}

	@Override
	public String getMoCallFlag(int mo_no) {
		String getMoCallFlag = sqlSession.selectOne("net.haebang.member.dao.MemberDao.getMoCallFlag", mo_no);
		return getMoCallFlag;
	}


	
	
	
	/*********************************** 소비자 예약정보 가져오기 **********************************************************/

	
	@Transactional
	@Override
	public int approval_member(MemberVo member) throws Exception {
		int a = sqlSession.update("net.haebang.member.dao.MemberDao.approval_member", member);
		System.out.println(a);
		return a;
	}
	
	
}