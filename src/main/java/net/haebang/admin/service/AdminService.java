package net.haebang.admin.service;

import java.util.List;

import net.haebang.vo.MemberVo;

/**
 * 	관리자 서비스
 * @author LEEJUHO
 *
 */
public interface AdminService {

	List<MemberVo> memberList();
}
