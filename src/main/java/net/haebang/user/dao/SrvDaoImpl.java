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

	public List<ServiceVo> selectList(String con1, String con2, int con3) {
		String con4 = String.valueOf(con3);
		ServiceVo srv = new ServiceVo();
		srv.setS_type(con1);
		srv.setS_place(con2);
		srv.setS_size(con4);
		List<ServiceVo> srvList = sqlSession.selectList("net.haebang.user.dao.SrvDao.selectServiceList", srv);
		return srvList;
	}

	@Transactional
	@Override
	public void insertScdToNewMemberOnetime(Map<String, Object> map) {
		// 새멤버 추가
		// t_member에 새멤버 추가
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdToNewMember", map);
		// M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
		map.put("m_no", registeredMember.getM_no());
		// 맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNoOnetime", map);

	}

	@Override
	public MemberVo selectUserByInfo(Map<String, Object> map) {
		return sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
	}

	@Override
	public void insertScdToRegisteredMemberOnetime(Map<String, Object> map) {
		// 기존멤버 추가
		// 맵의 m_no로 t_m_order에 insert
		sqlSession.update("net.haebang.user.dao.SrvDao.updateMemberInfo", map);
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNoOnetime", map);

	}

	@Transactional
	@Override
	public void insertScdToNewMember(Map<String, Object> map) {
		// 새멤버 추가
		// t_member에 새멤버 추가
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdToNewMember", map);
		// M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectUserByInfo", map);
		System.out.println(registeredMember.getM_no());
		map.put("m_no", registeredMember.getM_no());
		Set<String> keys = map.keySet();
		for (String key : keys) {
			System.out.println(key + " : " + map.get(key));
		}
		// 맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNo", map);

	}

	@Override
	public void insertScdToRegisteredMember(Map<String, Object> map) {
		// 기존멤버 추가
		// 맵의 m_no로 t_m_order에 insert
		sqlSession.update("net.haebang.user.dao.SrvDao.updateMemberInfo", map);
		sqlSession.insert("net.haebang.user.dao.SrvDao.insertScdByMNo", map);
	}

	@Override
	public ServiceVo getServiceInfo(int s_no) {
		ServiceVo selectedService = sqlSession.selectOne("net.haebang.user.dao.SrvDao.getServiceInfo", s_no);
		return selectedService;
	}

	@Override
	public int selectNoOneEmployee(Map<String, Object> map) {

		return sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectNoOneEmployee", map);
	}

	@Override
	public int selectPrevMonthOutCome() {
		// 전월 최소 매출 추출
		if (sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectPrevMonthOutCome") == null) {
			System.out.println("전월매출 없음");
			return 0;
		}

		int prevMonthOutCome = sqlSession.selectOne("net.haebang.user.dao.SrvDao.selectPrevMonthOutCome");
		System.out.println("전월매출 최소값 있음");
		return prevMonthOutCome;
	}

	@Override
	public void createEvent(Map<String, Object> map) {
		sqlSession.update("net.haebang.user.dao.SrvDao.createEvent", map);

	}

	@Override
	public List<Integer> selectMoNoByOrderNo(Map<String, Object> map) {

		List<Integer> list = sqlSession.selectList("net.haebang.user.dao.SrvDao.selectMoNoByOrderNo", map);

		return list;
	}

	@Override
	public void updateENoFirstbyMoNo(Map<String, Object> map) {
		sqlSession.update("net.haebang.user.dao.SrvDao.updateENoFirstbyMoNo", map);

	}

}
