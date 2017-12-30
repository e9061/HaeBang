package net.haebang.employee.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.employee.controller.CommonUtils;
import net.haebang.employee.dao.EmployeeDao;
import net.haebang.exception.AlreadyExistingMemberException;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.exception.NoSuchIdException;
import net.haebang.exception.NoSuchMemberException;
import net.haebang.user.dao.SrvDao;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final String filePath = "/home/ubuntu/HaeBangPicture/";

	@Autowired
	public EmployeeDao employeeDao;

	@Autowired
	public SrvDao srvdao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	// -------------------------------------------- 아래 노 창 대 ------------------------------------------------------

	@Transactional
	public void registerEmployeeAnd(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request) {

		EmployeeVo employeeVo = employeeDao.selectById(joinEmployeeVo.getE_id());
		if (employeeVo != null) {
			throw new AlreadyExistingMemberException("중복" + joinEmployeeVo.getE_id());
		}

		Iterator<String> iterator = request.getFileNames();
		// request가 가져온 파라미터 이름들을 iterator에 저장

		MultipartFile multipartFile = null;

		String oriName = null;
		String originalFileExtension = null;
		String saveName = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			if (iterator.next().equals("fileEmployee")) {
				multipartFile = request.getFile("fileEmployee");
				if (multipartFile.isEmpty() == false) {

					oriName = multipartFile.getOriginalFilename();
					originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
					saveName = CommonUtils.getRandomString() + originalFileExtension;

					file = new File(filePath + saveName);
					try {

						multipartFile.transferTo(file);

					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					joinEmployeeVo.setE_oriName(oriName);
					joinEmployeeVo.setE_saveName(saveName);

				}
			} else {
				multipartFile = request.getFile("fileCompany");

				if (multipartFile.isEmpty() == false) {

					oriName = multipartFile.getOriginalFilename();
					originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
					saveName = CommonUtils.getRandomString() + originalFileExtension;

					file = new File(filePath + saveName);
					try {

						multipartFile.transferTo(file);

					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					joinEmployeeVo.setC_oriName(oriName);
					joinEmployeeVo.setC_saveName(saveName);

				}

			}

			// System.out.println("-------------- file start --------------\n");
			// System.out.println("oriName : " + oriName);
			// System.out.println("saveName : " + saveName);
			// System.out.println("filename : " + multipartFile.getOriginalFilename());
			// System.out.println("size : " + multipartFile.getSize());
			// System.out.println("-------------- file end --------------\n");

		}

		employeeDao.insertCompany(joinEmployeeVo);
		employeeDao.insertEmployeeAnd(joinEmployeeVo);

	}

	@Transactional
	public void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request) {
		EmployeeVo employeeVo = employeeDao.selectById(joinEmployeeVo.getE_id());
		if (employeeVo != null) {
			throw new AlreadyExistingMemberException("중복" + joinEmployeeVo.getE_id());
		}

		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		String oriName = null;
		String originalFileExtension = null;
		String saveName = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {

				oriName = multipartFile.getOriginalFilename();
				originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
				saveName = CommonUtils.getRandomString() + originalFileExtension;

				file = new File(filePath + saveName);
				try {

					multipartFile.transferTo(file);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				joinEmployeeVo.setE_oriName(oriName);
				joinEmployeeVo.setE_saveName(saveName);

			}
		}

		employeeDao.insertEmployee(joinEmployeeVo);
		employeeDao.updateEmployeeCntP(joinEmployeeVo);

	}

	@Override
	public void updateEoC(HttpServletRequest request, EmployeeVo userVo) {
		HashMap<String, String> updateMap = new HashMap<String, String>();

		Enumeration<String> enumeration = request.getParameterNames();
		List<String> list = new ArrayList<String>();

		while (enumeration.hasMoreElements()) {
			String parameter = enumeration.nextElement();
			list.add(parameter);

		}
		updateMap.put("key", request.getParameter(list.get(0)));
		updateMap.put("value", request.getParameter(list.get(1)));

		if (request.getParameter(list.get(0)).contains("c_")) {
			updateMap.put("no", "c_no");
			updateMap.put("noVal", Integer.toString(userVo.getC_no()));
			updateMap.put("table", "t_company");

		} else {
			updateMap.put("no", "e_no");
			updateMap.put("noVal", Integer.toString(userVo.getE_no()));
			updateMap.put("table", "t_employee");
		}
		employeeDao.updateEoC(updateMap);
	}

	@Transactional
	public void updateBizNo(CompanyVo companyVo, MultipartHttpServletRequest request) {

		CompanyVo confirmVo = employeeDao.selectByBizNo2(companyVo);
		if (confirmVo != null) {
			throw new AlreadyExistingMemberException("중복" + confirmVo.getC_bizNo());
		}

		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		String oriName = null;
		String originalFileExtension = null;
		String saveName = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {

				oriName = multipartFile.getOriginalFilename();
				originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
				saveName = CommonUtils.getRandomString() + originalFileExtension;

				file = new File(filePath + saveName);
				try {

					multipartFile.transferTo(file);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				companyVo.setC_oriName(oriName);
				companyVo.setC_saveName(saveName);

			}
		}

		employeeDao.updateCompanyBizNo(companyVo);

	}

	@Override
	public void updateEmpPicture(EmployeeVo employeeVo, MultipartHttpServletRequest request) {

		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		String oriName = null;
		String originalFileExtension = null;
		String saveName = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {

				oriName = multipartFile.getOriginalFilename();
				originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
				saveName = CommonUtils.getRandomString() + originalFileExtension;

				file = new File(filePath + saveName);
				try {

					multipartFile.transferTo(file);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				employeeVo.setE_oriName(oriName);
				employeeVo.setE_saveName(saveName);

			}
		}
		
		employeeDao.updateEmpPicture(employeeVo);

		
	}


	//***************************12/15 노창대***********************************************************

		@Transactional
		@Override
		public List<HashMap<String, Object>> acceptMyCall(HashMap<String, Object> map) {

			
			//1단계 callFlag 종료 ed로 바꾸기
			employeeDao.updateCallFlag(map);
			
			//2단계 t_e_order에 mo_no 넣어주기 위해 mo_no 여러개 있는 거 받아오기 by orderNo
			List<HashMap<String,Object>> mo_noList = employeeDao.selectMoNoByOrderNo(map);
			map.put("mo_noList", mo_noList);
			System.out.println(mo_noList);
			System.out.println("accept 구현 2단계");
			//3단계 t_e_order mo_no여러값 넣어주자
			employeeDao.insertEOrder(map);
			

			//4단계 event drop
			employeeDao.dropEvent(map);

			//5단계 t_cancelCall에 남아있는 mo_no의 거절 e_no 지우기
			employeeDao.deleteCancelCallByMoNo(map);
			System.out.println(map.get("mo_no"));
			System.out.println(map.get("mo_no"));
			System.out.println(map.get("mo_no"));
			System.out.println(map.get("mo_no"));
			System.out.println(map.get("mo_no"));

			
			//6단계 남아있는 콜 보여주기
			EmployeeVo userVo = (EmployeeVo) map.get("userVo");
			System.out.println(userVo);
			List<HashMap<String,Object>> myCall = null;
			
			if(userVo.getE_type() =="O" || userVo.getE_type() =="사장") {
				myCall = employeeDao.selectMyCompanyCall(userVo);
				
				return myCall;
				
			}
			
			myCall = employeeDao.selectMyCall(userVo);
			
			return myCall;
		}
		
		@Transactional
		@Override
		public List<HashMap<String, Object>> refuseMyCall(HashMap<String, Object> map) {

			
			
			//0. lon,lat, datefornoOneEmployee
			
			
			EmployeeVo userVo = (EmployeeVo) map.get("userVo");
			System.out.println(userVo);
			List<HashMap<String,Object>> myCall = null;
			
			if(userVo.getE_type() =="O" || userVo.getE_type() =="사장") {
				myCall = employeeDao.selectMyCompanyCall(userVo);
			}
			else {
				
				myCall = employeeDao.selectMyCall(userVo);
			}
			
			System.out.println(myCall.size());
			
			for(int i=0;i<myCall.size();i++) {
			
				System.out.println(myCall.get(i).get("mo_no"));
				System.out.println(map.get("mo_no"));
				
				
				if((Integer)myCall.get(i).get("mo_no") == Integer.parseInt((String)map.get("mo_no")))
				{
					System.out.println("굿  1단계");
					System.out.println(myCall.get(i)+"굿굿");
					System.out.println(myCall.get(i).get("m_lon"));
					map.put("refuseMoNo", myCall.get(i));
				}
				
			}
			

			//1. Insert into t_cancelCall(mo_no, e_no) values(클릭한 mo_no, 3번째 해쉬맵.e_no_first);

			employeeDao.insertCancelCall(map);
			System.out.println("굿  2단계");
			
			//2. update t_m_order set e_no_first=슝슝
			//	refuseMoNo.Lon, refuseMoNo.lat, prevMonthOutCome, refuseMoNo.dateHourForNoOneEmployee
			
			int prevMonthOutCome = srvdao.selectPrevMonthOutCome();
			map.put("prevMonthOutCome", prevMonthOutCome);
			System.out.println(prevMonthOutCome);

			
			//3, 업데이트 전에 콘솔창에 순위표 받아보기
			List<HashMap<String,Object>> validation =  employeeDao.selectNoOneEmployeeValidation(map);
			System.out.println("순위표 확인할거에요");
			System.out.println(validation);
			
			//4. 구할 순위 데이터 null일 경우 cancelCall 삭제
			if(validation.size() ==0 || validation == null)
			{
				employeeDao.deleteCancelCallByMoNo(map);
			}
				
			
			employeeDao.updateMOrderENoFirst(map);
			System.out.println("굿  3단계");

			//3. Drop event ${mo_orderNo}
			employeeDao.dropEvent(map);
			System.out.println("굿  0단계");
			
			//4. Create reCreateEvent ${mo_orderNo}
			
			employeeDao.reCreateEvent(map);
			System.out.println("굿  4단계");
			
			
			//5단계 남아있는 콜 다시 돌려줘서 보여주기
			
			
			
			if(userVo.getE_type() =="O" || userVo.getE_type() =="사장") {
				myCall = employeeDao.selectMyCompanyCall(userVo);
				
				return myCall;
				
			}
			
			List<HashMap<String,Object>> leftMyCall = employeeDao.selectMyCall(userVo);
			
			System.out.println("굿 5단계");
			
			return leftMyCall;
			

		}
		
		
		
		
		//***************************12/15 노창대***********************************************************


	// --------------------------------------------- 아래 박 진 화 ------------------------------------------------------
	public void modifyEmployee(EmployeeVo employee) {

	}

	
	public EmployeeVo authenticate(EmployeeVo employeeVo) {
		System.out.println("authenticate");
		EmployeeVo employeevo = employeeDao.selectById(employeeVo);
		System.out.println(employeevo);
		
		
		if (employeevo == null ) {
			throw new IdPasswordNotMatchingException();
		}
		
		return employeevo;
	}
	

	
	
	@Override
	public List<NoticeBoardVo> getMainnoticelist() {
		List<NoticeBoardVo> mainNoticelist = employeeDao.getMainnoticelist();
		return mainNoticelist;
		
	}

	@Override
	public EmployeeVo getIdByPhone(String name, String phone) {
		
		 Map<String, Object> map = new HashMap<String, Object>(); 
		 
		 System.out.println(name);
		 System.out.println(phone);
	
	        map.put("name", name);
	        map.put("phone", phone);	        
		
		EmployeeVo getIdByPhone = employeeDao.getIdByPhone(map);
		
		if (getIdByPhone == null ) {
			throw new NoSuchMemberException();
		}
		
		
		return getIdByPhone;
	}

	@Override
	public EmployeeVo getIdByBizNo(String name, String companyName, String bizNo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		System.out.println(name);
		System.out.println(companyName);
		System.out.println(bizNo);
		
		map.put("name", name);
	    map.put("companyName", companyName);
	    map.put("bizNo", bizNo);
		
		EmployeeVo getIdByBizNo = employeeDao.getIdByBizNo(map);
		
		if (getIdByBizNo == null ) {
			throw new NoSuchMemberException();
		}
		
		return getIdByBizNo;
	}

	@Override
	public EmployeeVo getIdbyId(EmployeeVo employeeVo) {
		
		EmployeeVo checkIdbyId  = employeeDao.getIdbyId(employeeVo);
		
		if(checkIdbyId == null) {
			throw new NoSuchIdException();
		}
		
		return checkIdbyId;
	}

	@Override
	public void changePassword(EmployeeVo employeeVo) {
		employeeDao.changePassword(employeeVo);
		
	}

/*******************************************공지사항***********************************************************/
	private final int LINE_PER_PAGE = 10;
	
	@Override
	public List<NoticeBoardVo> getNoticeList(String n_type, int page, String word, String searchCondition) {
	int startPoint = page * LINE_PER_PAGE;		
		
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("n_type", n_type);
        map.put("startPoint", startPoint);
        map.put("row", LINE_PER_PAGE);
        map.put(searchCondition, word);
        
        List<NoticeBoardVo> noticeList = employeeDao.getNoticeList(map);
        System.out.println("서비스");
        System.out.println(noticeList);
        
		return noticeList;
	}

	@Override
	public int getLastPage(String n_type, String word, String searchCondition) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("n_type", n_type);
		map.put(searchCondition, word);
		
		int lastPage =(int)((double)employeeDao.selectTotalCount(map)/LINE_PER_PAGE);
		System.out.println(lastPage);
		
		System.out.println("Service lastPage : " +lastPage);
		System.out.println("ServiceImpl - lastPage : "+lastPage);
		return lastPage;
	}

	@Override
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		NoticeBoardVo getNoticeBoardByNo = employeeDao.getNoticeBoardByNo(noticeBoardVo);
		return getNoticeBoardByNo;
	}
	
	@Override
	public void insertScheduleByOnetime(Map<String, Object> map) {
		
		MemberVo registeredMember = employeeDao.selectUserByInfo(map);
		System.out.println("***********************서비스:1회성 고객정보select 완료*******************************");
		
		System.out.println(registeredMember);
		
		if(registeredMember == null) {
			System.out.println("***********************서비스:뉴멤버 1회성 insert메서드 실행전*******************************");
			employeeDao.insertScdToNewMemberOnetime(map);
		
		
		}else {
		
		map.put("m_no", registeredMember.getM_no());
		System.out.println("***********************서비스:기존멤버 1회성 insert메서드 실행전*******************************");
		
		employeeDao.insertScdToRegisteredMemberOnetime(map);
			
		}	
		
	}

	@Override
	public void insertSchedule(Map<String, Object> map) {
		
		MemberVo registeredMember = employeeDao.selectUserByInfo(map);
		System.out.println("***********************서비스:정기성 고객정보select 완료*******************************");
		
		if(registeredMember == null) {
				
			System.out.println("***********************서비스:뉴멤버 정기성 insert메서드실행전*******************************");
			employeeDao.insertScdToNewMember(map);	
			
		}else {
			
			map.put("m_no", registeredMember.getM_no());
			System.out.println("***********************서비스:기존멤버 정기성 insert메서드실행전 *******************************");		
			employeeDao.insertScdToRegisteredMember(map);
			
		}	
		
		
	}
	
/***************************************************************************************************************/
	
	
	
	
	/********************************* 스케쥴 서비스 임플 ****************************************************************/
	// 스케쥴 전체
	@Override
	public List<HashMap<String, Object>> getScheduleList(int c_no) {
		List<HashMap<String, Object>> getScheduleList = employeeDao.getScheduleList(c_no);
		return getScheduleList;
	}
	// 스케쥴 디테일
	@Override
	public HashMap<String, Object> getScheduleByMONo(int mo_no) {
		HashMap<String, Object> getScheduleByMONo = employeeDao.getScheduleByMONo(mo_no);
		return getScheduleByMONo;
	}
	
	// 스케쥴 삭제
		@Override
		public void deleteSchedule(int mo_no) {
			employeeDao.deleteSchedule(mo_no);
			
		}
		
		@Override
		public String getMtypebyMONo(int mo_no) {
			String m_type = employeeDao.getMtypebyMONo(mo_no);
			return m_type;
		}

	@Override
	public HashMap<String, Object> getScheduleByMONoByHB(int mo_no) {
		HashMap<String, Object> getScheduleByMONoByHB = employeeDao.getScheduleByMONoByHB(mo_no);
		return getScheduleByMONoByHB;
	}

	@Override
	public List<HashMap<String, Object>> getmyScheduleList(Map<String, Object> map) {
		List<HashMap<String, Object>> getmyScheduleList = employeeDao.getmyScheduleList(map);
		return getmyScheduleList;
	}

		
		// 스케쥴 수정 - 수정 리스트 받아오기 - 해방
		@Override
		public HashMap<String, Object> getScheduleByOdNo(int mo_no) {
			HashMap<String, Object> getScheduleByOdNo = employeeDao.getScheduleByOdNo(mo_no);
			return getScheduleByOdNo;
		}
		// 스케쥴 수정 - 수정 리스트 받아오기 - 비해방
		@Override
		public HashMap<String, Object> getScheduleByOdNoTypeN(int mo_no) {
			HashMap<String, Object> getScheduleByOdNo = employeeDao.getScheduleByOdNoTypeN(mo_no);
			return getScheduleByOdNo;
		}
		// 스케쥴 수정 - 해당업체 전체 직원 검색
		@Override
		public List<HashMap<String, Object>> getEmployeeList(int e_no) {
			List<HashMap<String, Object>> getEmployeeList = employeeDao.getEmployeeList(e_no);
			return getEmployeeList;
		}
		
		// 스케쥴 수정 - 업뎃 - 비해방
		@Override
		public void updateNoHaebangSch(HashMap<String, Object> map) {
			employeeDao.updateNoHaebangSch(map);
		}
		// 스케쥴 수정 - 업뎃 - 해방
		@Override
		public void updateHaebangSch(HashMap<String, Object> map) {
			employeeDao.updateHaebangSch(map);
		}
		 
		/********************************* 스케쥴 서비스 임플 ****************************************************************/
		
		// 주호 mono 로 회원정보 가져오기(t_member, t_m_order, t_e_order, t_employee, t_service)
		@Override
		public Map<String, Object> getMemberInfoByMono(int mo_no) {
			Map<String, Object> getMemberInfoByMono = employeeDao.getMemberInfoByMono(mo_no);
			return getMemberInfoByMono;
		}

		@Override
		public void statusUpdate(Map<String, Object> map) {
			employeeDao.statusUpdate(map);
		}
		@Override
		public Map<String, Object> statusUpdateResult(Map<String, Object> map) {
			Map<String, Object> result = employeeDao.statusUpdateResult(map);
			return result;
		}
	
	
}