package net.haebang.employee.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final String filePath = "/Users/apple/Documents/workspace/HaeBangPicture/";

	@Autowired
	public EmployeeDao employeeDao;

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
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

				joinEmployeeVo.setC_oriName(oriName);
				joinEmployeeVo.setC_saveName(saveName);
				System.out.println("-------------- file start --------------\n");
				System.out.println("oriName : " + oriName);
				System.out.println("saveName : " + saveName);
				System.out.println("filename : " + multipartFile.getOriginalFilename());
				System.out.println("size : " + multipartFile.getSize());
				System.out.println("-------------- file end --------------\n");

			}
		}


		employeeDao.insertCompany(joinEmployeeVo);
		employeeDao.insertEmployee(joinEmployeeVo);

	}

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
	

	public List<MapVo> selectAllmap(EmployeeVo employeeVo) {
		List<MapVo> maplist = employeeDao.selectAllmap(employeeVo);
		return maplist;
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
	
/***************************************************************************************************************/

}

