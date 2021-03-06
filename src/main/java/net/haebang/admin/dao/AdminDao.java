package net.haebang.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

public interface AdminDao {
	
	// 회원 조회 dao
	List<MemberVo> memberList();
	List<MemberVo> nMemberList();

	List<MemberVo> memberSelected(MemberVo memberVo);
	
	// 업체 조회 dao
		List<HashMap<String, Object>> hbComList(Map<String, Object> map);
		List<HashMap<String, Object>> nComList(Map<String, Object> map);
		
		List<HashMap<String, Object>> searchHbComList(CompanyVo companyVo);
		List<HashMap<String, Object>> searchNComList(CompanyVo companyVo);

		double selectTotal(Map<String, Object> map);
	
	// 공지사항 dao
	List<NoticeBoardVo> getOwnerNoticeList(Map<String, Object> map);
	int selectTotalCount(Map<String, Object> map);
	
	NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);
	NoticeBoardVo getNoticeBoardByNo(int no);
	void insertNotice(NoticeBoardVo noticeBoardVo);
	void updateNotice(NoticeBoardVo noticeBoardVo);
	void noticeDelete(int no);
	
	// 창대 지도관련 모든 주문 정보 가져오기
	List<HashMap<String, Object>> selectAllmap();
	
	//스케쥴 관리 서비스
	List<HashMap<String, Object>> getScheduleList(Map<String, Object> map);
	int selectTotalCountSchedule(Map<String, Object> map);	
	HashMap<String, Object> getScheduleByMONo(int mo_no);	
	String getMtypebyMONo(int mo_no);
	HashMap<String, Object> getScheduleByMONoByHB(int mo_no);
	
	// 관리자 로그인
	MemberVo loginAdmin(Map<String, Object> map);
	
	// 메인 전체 정보
	List<Map<String, Object>> getMainInfo();
	
	// 조건검색 - 오늘기준 서비스 진행 될 구별 정보 가져오기
	List<Map<String, Object>> searchGuInfo(Map<String, Object> map);
	
		
}

