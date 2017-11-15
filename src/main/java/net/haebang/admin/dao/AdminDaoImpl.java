package net.haebang.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원
	
	@Override
	public List<MemberVo> memberList() {
		List<MemberVo> mbList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectMemberList");
		return mbList;
	}
	
	@Override
	public List<MemberVo> nMemberList() {
		List<MemberVo> nMbList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectNoneMemberList");
		return nMbList;
	}

	@Override
	public List<MemberVo> memberSelected(MemberVo mvo) {
		List<MemberVo> memberSelected = sqlSession.selectList("net.haebang.admin.dao.AdminDao.memberSelected", mvo);
		return memberSelected;
	}
	
	
	// 업체
	
	@Override
	public List<CompanyVo> hbComList() {
		List<CompanyVo> hbComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectHbCompanyList");
		return hbComList;
	}

	@Override
	public List<CompanyVo> nComList() {
		List<CompanyVo> nComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectNCompanyList");
		return nComList;
	}

	@Override
	public List<CompanyVo> searchHbComList(CompanyVo companyVo) {
		List<CompanyVo> searchHbComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.searchHbCompanyList", companyVo);
		return searchHbComList;
	}
	
	@Override
	public List<CompanyVo> searchNComList(CompanyVo companyVo) {
		List<CompanyVo> searchNComList = sqlSession.selectList("net.haebang.admin.dao.AdminDao.searchNCompanyList", companyVo);
		return searchNComList;
	}

	
	

}
