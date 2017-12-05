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
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final String filePath = "/home/ubuntu/HaeBangPicture/";

	@Autowired
	public EmployeeDao employeeDao;

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
			System.out.println("12341234");
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

}
