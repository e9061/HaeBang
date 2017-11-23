package net.haebang.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원
	@Override
	public List<MemberVo> memberList() {
		List<MemberVo> mbList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectMemberList");
		System.out.println(mbList);
		return mbList;
	}
	
	@Override
	public List<MemberVo> nMemberList() {
		List<MemberVo> nMbList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectNoneMemberList");
		System.out.println(nMbList);
		return nMbList;
	}

	@Override
	public List<MemberVo> memberSelected(MemberVo mvo) {
		List<MemberVo> memberSelected = sqlSession.selectList("net.haebang.admin.dao.AdminDao.memberSelected", mvo);
		return memberSelected;
	}
	
	
	// 업체
	@Override
	public List<HashMap<String, Object>> hbComList() {
		List<HashMap<String, Object>> hbComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectHbCompanyList");
		return hbComList;
	}

	@Override
	public List<HashMap<String, Object>> nComList() {
		List<HashMap<String, Object>> nComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectNCompanyList");
		return nComList;
	}

	@Override
	public List<HashMap<String, Object>> searchHbComList(CompanyVo companyVo) {
		List<HashMap<String, Object>> searchHbComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.searchHbCompanyList", companyVo);
		return searchHbComList;
	}
	
	@Override
	public List<HashMap<String, Object>> searchNComList(CompanyVo companyVo) {
		List<HashMap<String, Object>> searchNComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.searchNCompanyList", companyVo);
		return searchNComList;
	}

	
	// 공지사항
	@Override
	public List<NoticeBoardVo> getOwnerNoticeList(Map<String, Object> map) {
		System.out.println("daoImpl!! + getOwnerNoticeList");
		System.out.println(map);
		List<NoticeBoardVo> getOwnerNoticeList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.getOwnerNoticeList", map);
		System.out.println("dao" + getOwnerNoticeList);
		return getOwnerNoticeList;
	}

	@Override
	public int selectTotalCount(Map<String, Object> map) {
		int totalPage = sqlSession.selectOne("net.haebang.admin.dao.AdminDao.selectTotalCount",map); 
		return totalPage;
	}

	@Override
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		sqlSession.update("net.haebang.admin.dao.AdminDao.updateViewCnt",noticeBoardVo);
		NoticeBoardVo getNoticeBoardByNo = sqlSession.selectOne("net.haebang.admin.dao.AdminDao.selectOneNDetailByNo",noticeBoardVo);
		return getNoticeBoardByNo;
	}
	
	@Override
	public NoticeBoardVo getNoticeBoardByNo(int no) {
		NoticeBoardVo getNoticeBoardByNo = sqlSession.selectOne("net.haebang.admin.dao.AdminDao.selectOneNDetailByNo",no);
		return getNoticeBoardByNo;
	}

	@Override
	public void insertNotice(NoticeBoardVo noticeBoardVo) {
		sqlSession.insert("net.haebang.admin.dao.AdminDao.insertNotice", noticeBoardVo);
		System.out.println("공지사항 등록 완료");
	}

	@Override
	public void updateNotice(NoticeBoardVo noticeBoardVo) {
		sqlSession.update("net.haebang.admin.dao.AdminDao.updateNotice", noticeBoardVo);
		
	}

	@Override
	public void noticeDelete(int no) {
		sqlSession.delete("net.haebang.admin.dao.AdminDao.deleteNotice", no);
		
	}

	
	
	

}
