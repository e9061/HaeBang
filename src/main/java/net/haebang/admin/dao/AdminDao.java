package net.haebang.admin.dao;

import java.util.HashMap;
import java.util.List;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;

public interface AdminDao {
	
	// 회원 조회 dao
	List<MemberVo> memberList();
	List<MemberVo> nMemberList();

	List<MemberVo> memberSelected(MemberVo memberVo);
	
	// 업체 조회 dao
	List<HashMap<String, Object>> hbComList();
	List<HashMap<String, Object>> nComList();
	
	List<HashMap<String, Object>> searchHbComList(CompanyVo companyVo);
	List<HashMap<String, Object>> searchNComList(CompanyVo companyVo);
	
}
