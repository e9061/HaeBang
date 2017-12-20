package net.haebang.user.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.haebang.vo.MemberVo;
import net.haebang.vo.ServiceVo;

@Repository
public class SrvDaoImpl implements SrvDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public List<ServiceVo> selectList(String con1, String con2, String con3){
		ServiceVo srv = new ServiceVo();
		srv.setS_type(con1);
		srv.setS_place(con2);
		srv.setS_size(con3);
		List<ServiceVo> srvList = sqlSession.selectList("net.haebang.user.dao.SrvDao.selectServiceList", srv);
		return srvList;
	}
	
	

	@Transactional
	@Override
	public void insertScdToNewMemberOnetime(Map<String, Object> map) {
		//새멤버 추가
		//t_member에 새멤버 추가
		
			System.out.println("**********************dao 1회성 새멤버 잘들어옴********************************");
			
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdToNewMember", map);
		//M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
			System.out.println("**********************dao 1회성 새멤버 Mo_no찾기완료********************************");
		map.put("m_no", registeredMember.getM_no());
		//맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)		
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNoOnetime", map);
			System.out.println("***********************dao:1회성 맵의 m_no로 t_m_order에 insert 완료*******************************");
			
		
	}	
	
	
	@Override
	public MemberVo selectUserByInfo(Map<String, Object> map) {
		return sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
	}

	
	@Override
	public void insertScdToRegisteredMemberOnetime(Map<String, Object> map) {
		//기존멤버 추가
		//맵의 m_no로 t_m_order에 insert(우다다다)
			System.out.println("**********************dao 1회성 기존멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNoOnetime", map);
		System.out.println("***********************dao:1회성 맵의 m_no로 t_m_order에 insert 완료*******************************");
			
	}
	@Transactional
	@Override
	public void insertScdToNewMember(Map<String, Object> map) {
		//새멤버 추가
		//t_member에 새멤버 추가
			System.out.println("**********************dao 정기성 새멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdToNewMember", map);			
		//M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
			System.out.println("**********************dao 정기성 새멤버 Mo_no찾기완료********************************");
			System.out.println(registeredMember.getM_no());
			map.put("m_no", registeredMember.getM_no());
			Set<String> keys = map.keySet();
			for(String key : keys) {
				System.out.println(key + " : "+ map.get(key));				
			}
		//맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)		
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNo", map);
			System.out.println("***********************dao:정기성 맵의 m_no로 t_m_order에 insert 완료*******************************");
		
	}
	
	
	
	@Override
	public void insertScdToRegisteredMember(Map<String, Object> map) {
		//기존멤버 추가
		//맵의 m_no로 t_m_order에 insert(우다다다)
			System.out.println("**********************dao 정기성 기존멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNo", map);
			System.out.println("***********************dao:정기성 맵의 m_no로 t_m_order에 insert 완료*******************************");
	}


	
	
	
	
	
	
	
	
	
}
