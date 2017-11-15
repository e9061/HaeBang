package net.haebang.admin.dao;

import java.util.List;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;

public interface AdminDao {
	
	// 회원 조회 dao
	List<MemberVo> memberList();
	List<MemberVo> nMemberList();

	List<MemberVo> memberSelected(MemberVo memberVo);
	
	// 업체 조회 dao
	List<CompanyVo> hbComList();
	List<CompanyVo> nComList();
	
	List<CompanyVo> searchHbComList(CompanyVo companyVo);
	List<CompanyVo> searchNComList(CompanyVo companyVo);
	
}
