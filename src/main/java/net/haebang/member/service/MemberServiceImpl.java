package net.haebang.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.exception.NoMemberException;
import net.haebang.member.dao.MemberDao;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberDao dao;

	@Override
	public List<MemberVo> selectAllMember() {
		List<MemberVo> list = dao.selectAll();
		return list;
	}

	@Override
	public void insertMember(MemberVo Member) {
		dao.insert(Member);

	}

	@Override
	public MemberVo selectOneMember(String m_id) {
		System.out.println(m_id + "서비스");
		return dao.selectOne(m_id);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();

	}

	@Override
	public MemberVo login(MemberVo member) {
		MemberVo mem = dao.login(member);

		if (mem == null) {
			throw new NoMemberException();
		}

		return mem;
	}

	@Override
	public MemberVo blogin(MemberVo member) {
		MemberVo mem = dao.blogin(member);

		if (mem == null) {
			throw new NoMemberException();
		}

		return mem;
	}

	@Override
	public MemberVo mainLogin(MemberVo member) {
		MemberVo mem = dao.mainLogin(member);

		if (mem == null) {
			throw new NoMemberException();
		}

		return mem;
	}

	@Override
	public void updateMember(MemberVo member) {
		System.out.println(member+"서비스");
		dao.updateMember(member);
		
	}

	
	
	/******************************************** 공지사항 ***************************************************************/
private final int LINE_PER_PAGE = 10;
	
	@Override
	public List<NoticeBoardVo> getNoticeList(String n_type, int page, String word, String searchCondition) {
	int startPoint = page * LINE_PER_PAGE;		
		
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("n_type", n_type);
        map.put("startPoint", startPoint);
        map.put("row", LINE_PER_PAGE);
        map.put(searchCondition, word);
        
        List<NoticeBoardVo> noticeList = dao.getNoticeList(map);
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
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		NoticeBoardVo getNoticeBoardByNo = dao.getNoticeBoardByNo(noticeBoardVo);
		return getNoticeBoardByNo;
	}
	/***********************************************************************************************************************/
	// 소비자 myPage 정보 가져오기
	@Override
	public MemberVo getMyPageInfo(String m_id) {
		MemberVo getMyPageInfo = dao.getMyPageInfo(m_id);
		return getMyPageInfo;
	}
	// mypage 정보 수정
	@Override
	public void changeMyInfo(Map<String,Object> map) {
		dao.changeMyInfo(map);
		
	}
	
	
	// 소비자 예약 정보 받아오기
	@Override
	public List<HashMap<String, Object>> getReservListByMId(String m_id) {
		List<HashMap<String, Object>> getReservListByMId = dao.getReservListByMId(m_id);
		return getReservListByMId;
	}
	// 예약 정보 디테일 
	@Override
	public Map<String, Object> myReservDetail(Map<String, Object> map) {
		Map<String, Object> myReservDetail = dao.myReservDetail(map);
		return myReservDetail;
	}
	// 예약 취소
	@Override
	public void cancleServiceByOdNo(String mo_orderNo) {

		dao.cancleServiceByOdNo(mo_orderNo);
	}
	//일정 변경
	@Override
	public void changeDate(Map<String, Object> map) {
		dao.changeDate(map);
		
	}

	@Override
	public String getMoCallFlag(int mo_no) {
		String getMoCallFlag = dao.getMoCallFlag(mo_no);
		return getMoCallFlag;
	}


	
}