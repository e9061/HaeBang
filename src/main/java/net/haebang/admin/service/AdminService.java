package net.haebang.admin.service;

import java.util.List;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;

/**
 * 	관리자 서비스
 * @author LEEJUHO
 *
 */
public interface AdminService {
	
	// 회원조회 서비스
	List<MemberVo> memberList();
	List<MemberVo> nMemberList();
	
	List<MemberVo> memberSelected(MemberVo memberVo);
	
	// 업체 조회 서비스
	List<CompanyVo> hbComList();
	List<CompanyVo> nComList();

	List<CompanyVo> searchHbComList(CompanyVo companyVo);
	List<CompanyVo> searchNComList(CompanyVo companyVo);
	
	
}
