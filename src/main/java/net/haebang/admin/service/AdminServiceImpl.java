package net.haebang.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.admin.dao.AdminDao;
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
	public List<HashMap<String, Object>> hbComList() {
		
		CompanyVo companyVo = new CompanyVo();
		EmployeeVo employeeVo = new EmployeeVo();
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("companyVo", companyVo);
		map.put("employeeVo", employeeVo);
		
		List<HashMap<String, Object>> hbComList = new ArrayList<HashMap<String, Object>>();
		hbComList.add(map);
		
		hbComList = dao.hbComList();
		return hbComList;
	}

	@Override
	public List<HashMap<String, Object>> nComList() {
		
		CompanyVo companyVo = new CompanyVo();
		EmployeeVo employeeVo = new EmployeeVo();
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("companyVo", companyVo);
		map.put("employeeVo", employeeVo);
		List<HashMap<String, Object>> nComList = new ArrayList<HashMap<String, Object>>();
		nComList.add(map);
		
		nComList = dao.nComList();
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
	         
	
	

}
