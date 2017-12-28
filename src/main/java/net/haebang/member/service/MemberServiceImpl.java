package net.haebang.member.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
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
	public int insertMember(MemberVo Member, HttpServletResponse response) throws Exception{
		Member.setM_approval_key(create_key());
		dao.insert(Member);
		send_mail(Member);
		
		return 1;
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
	public MemberVo login(MemberVo member, HttpServletResponse response) throws Exception {
		MemberVo mem = dao.login(member);
		PrintWriter out = response.getWriter();

		if (mem == null) {
			throw new NoMemberException();
		}
		System.out.println(mem.getM_approval_status());
		if(!mem.getM_approval_status().equals("true")) {
			out.println("<script>");
			out.println("alert('이메일 인증 후 로그인 하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
		return mem;
		}
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
	public MemberVo mainLogin(MemberVo member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVo mem = dao.mainLogin(member);
		PrintWriter out = response.getWriter();
		
		if (mem == null) {
			throw new NoMemberException();
		}else if(!mem.getM_approval_status().equals("true")) {
			out.println("<script>");
			out.println("alert('이메일 인증 후 로그인 하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return mem;
		}else {
			return mem;
		}
		

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
	
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for (int i =0; i<8; i++) {
			key += rd.nextInt(10);
		}
		
		return key;
	}
	
	@Override
	public void send_mail(MemberVo member) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "chaho91@naver.com";
		String hostSMTPpwd = "p91944~";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "chaho91@naver.com";
		String fromName = "HaeBang";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "HaeBang 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getM_name() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='POST' action='http://13.125.88.226/member/approval_member'>";
		msg += "<input type='hidden' name='m_id' value='" + member.getM_id() + "'>";
		msg += "<input type='hidden' name='m_approval_key' value='" + member.getM_approval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = member.getM_id();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
	
	@Override
	public void approval_member(MemberVo member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(dao.approval_member(member));
		if(dao.approval_member(member) == 0) {// 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}  else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='http://13.125.88.226/'");
			out.println("</script>");
			out.close();
		}
	}

	
}