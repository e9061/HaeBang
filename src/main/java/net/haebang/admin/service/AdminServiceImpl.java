package net.haebang.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.admin.dao.AdminDao;
import net.haebang.vo.MemberVo;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao dao;
	
	@Override
	public List<MemberVo> memberList() {
		System.out.println("memberList() 해방회원 정보조회");
		
		List<MemberVo> list = dao.list();
		
		return list;
	}
	
	                                                                 

}
