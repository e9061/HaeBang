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


	
}
