package net.haebang.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.MemberVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVo> list() {
		System.out.println("AdminDao list - 해방회원 정보 조회");
		System.out.println(sqlSession);
		List<MemberVo> list = sqlSession.selectList("net.haebang.admin.dao.AdminDao.selectAllMember");
		System.out.println("리스트!!");
		System.out.println(list);
		return list;
	}
	

}
