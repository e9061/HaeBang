package net.haebang.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.admin.dao.AdminDao;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao dao;
	
	// 회원
	
	@Override
	public List<MemberVo> memberList() {
		List<MemberVo> mbList = dao.memberList();
		return mbList;
	}

	@Override
	public List<MemberVo> nMemberList() {
		List<MemberVo> nMbList = dao.nMemberList();
		return nMbList;
	}

	@Override
	public List<MemberVo> memberSelected(MemberVo memberVo) {
		List<MemberVo> memberSelected = dao.memberSelected(memberVo);
		return memberSelected;
	}
	
	
	
	// 업체
	
	@Override
	public List<HashMap<String, Object>> hbComList() {
		List<HashMap<String, Object>> hbComList = dao.hbComList();
		return hbComList;
	}

	@Override
	public List<HashMap<String, Object>> nComList() {
		List<HashMap<String, Object>> nComList = dao.nComList();
		return nComList;
	}
	
	
	@Override
	public List<HashMap<String, Object>> searchHbComList(CompanyVo companyVo) {
		List<HashMap<String, Object>> searchComList = dao.searchHbComList(companyVo);
		return searchComList;
	}
	@Override
	public List<HashMap<String, Object>> searchNComList(CompanyVo companyVo) {
		List<HashMap<String, Object>> searchNComList = dao.searchNComList(companyVo);
		return searchNComList;
	}

	
	                                                                 

}
