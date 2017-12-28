package net.haebang.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.admin.dao.AdminDao;
import net.haebang.exception.NoMemberException;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

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
		public List<HashMap<String, Object>> hbComList(int page) {
			
			int startPoint = page * LINE_PER_PAGE;

			HashMap<String, Object> map = new HashMap<String, Object>(); 

			map.put("startPoint", startPoint);
			map.put("row", LINE_PER_PAGE);

			System.out.println(map);
			//
			CompanyVo companyVo = new CompanyVo();
			EmployeeVo employeeVo = new EmployeeVo();
			map.put("companyVo", companyVo);
			map.put("employeeVo", employeeVo);
			
			List<HashMap<String, Object>> hbComList = new ArrayList<HashMap<String, Object>>();
			hbComList.add(map);
			
			hbComList = dao.hbComList(map);
			return hbComList;
		}

		@Override
		public List<HashMap<String, Object>> nComList(int page) {
			
			int startPoint = page * LINE_PER_PAGE;

			HashMap<String, Object> map = new HashMap<String, Object>(); 

			map.put("startPoint", startPoint);
			map.put("row", LINE_PER_PAGE);
			
			
			CompanyVo companyVo = new CompanyVo();
			EmployeeVo employeeVo = new EmployeeVo();
			map.put("companyVo", companyVo);
			map.put("employeeVo", employeeVo);
			List<HashMap<String, Object>> nComList = new ArrayList<HashMap<String, Object>>();
			nComList.add(map);
			
			nComList = dao.nComList(map);
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


	
	// 공지사항
	private final int LINE_PER_PAGE = 10;
	
	@Override
	public List<NoticeBoardVo> getOwnerNoticeList(String n_type, int page, String word, String searchCondition) {
		int startPoint = page * LINE_PER_PAGE;		
		
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("n_type", n_type);
        map.put("startPoint", startPoint);
        map.put("row", LINE_PER_PAGE);
        map.put(searchCondition, word);
        
        List<NoticeBoardVo> noticeList = dao.getOwnerNoticeList(map);
        System.out.println("서비스");
        System.out.println(noticeList);
        
		return noticeList;
	}
	
	@Override
	public int getLastPage(String n_type, String word, String searchCondition) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("n_type", n_type);
		map.put(searchCondition, word);
		
		int lastPage =(int)((double)dao.selectTotalCount(map)/LINE_PER_PAGE);
		System.out.println(lastPage);
		
		System.out.println("Service lastPage : " +lastPage);
		System.out.println("ServiceImpl - lastPage : "+lastPage);
		return lastPage;
	}

	@Override
	public NoticeBoardVo getNoticeBoardByNo(int no) {
		NoticeBoardVo getNoticeBoardByNo = dao.getNoticeBoardByNo(no);
		return getNoticeBoardByNo;
	}
	@Override
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		NoticeBoardVo getNoticeBoardByNo = dao.getNoticeBoardByNo(noticeBoardVo);
		return getNoticeBoardByNo;
	}
	// 공지 글 등록
	@Override
	public void insertNotice(NoticeBoardVo noticeBoardVo) {
		dao.insertNotice(noticeBoardVo);
	}
	// 공지글 업데이트
	@Override
	public void updateNotice(NoticeBoardVo noticeBoardVo) {
		dao.updateNotice(noticeBoardVo);
	}
	// 공지글 삭제
	@Override
	public void noticeDelete(int no) {
		dao.noticeDelete(no);
	}
	@Override
	public int getLastPage() {
		Map<String, Object> map = new HashMap<String, Object>();

		int lastPage = (int) ((double) dao.selectTotal(map) / LINE_PER_PAGE);

		return lastPage;
	}

	@Override
	public List<HashMap<String, Object>> getScheduleList(int page, String word, String searchSchedule, String startDate,
			String endDate) {
		int startPoint = page * LINE_PER_PAGE;		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("word", word);
		map.put("searchSchedule", searchSchedule);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startPoint", startPoint);
        map.put("row", LINE_PER_PAGE);
        
        System.out.println("service단의 스케쥴리스트 관련 맵: "+map);
		
		List<HashMap<String, Object>> getScheduleList=dao.getScheduleList(map);
		
		System.out.println("서비스단의 getScheduleList: "+getScheduleList);
		
		return getScheduleList;
	}

	@Override
	public int selectTotalCountSchedule(String word, String searchSchedule, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("word", word);
		map.put("searchSchedule", searchSchedule);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		System.out.println("service단의 설렉토탈카운트 관련 맵: "+map);
		System.out.println("dao select : "+dao.selectTotalCountSchedule(map));
		int lastPage =(int)(((double)dao.selectTotalCountSchedule(map)-1)/LINE_PER_PAGE);
		
		System.out.println("int last page: "+lastPage);
		
		return lastPage;
	}

	// 스케쥴 디테일
	@Override
	public HashMap<String, Object> getScheduleByMONo(int mo_no) {
	HashMap<String, Object> getScheduleByMONo = dao.getScheduleByMONo(mo_no);
	return getScheduleByMONo;
	}
		
			
	@Override
	public String getMtypebyMONo(int mo_no) {
	String m_type = dao.getMtypebyMONo(mo_no);
	return m_type;
	}

	@Override
	public HashMap<String, Object> getScheduleByMONoByHB(int mo_no) {
	HashMap<String, Object> getScheduleByMONoByHB = dao.getScheduleByMONoByHB(mo_no);
	return getScheduleByMONoByHB;
	}

	
	// 관리자 로그인
	@Override
	public MemberVo loginAdmin(Map<String, Object> map) {
		MemberVo loginAdmin = dao.loginAdmin(map);
		
		if (loginAdmin == null) {
			System.out.println("익셉션 탐");
			throw new NoMemberException();
		}
		
		return loginAdmin;
	}

	// 메인 전체 정보
	@Override
	public List<Map<String, Object>> getMainInfo() {
		List<Map<String, Object>> mainInfo = dao.getMainInfo();
		return mainInfo;
	}
	
	// 조건검색 - 오늘기준 서비스 진행 될 구별 정보 가져오기
	@Override
	public List<Map<String, Object>> searchGuInfo(Map<String, Object> map) {
		List<Map<String, Object>> guInfo = dao.searchGuInfo(map);
		return guInfo;
	}


}
