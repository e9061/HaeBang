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
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.noticeBoardVo;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final String filePath = "/Users/apple/Documents/workspace/HaeBangPicture/";

	@Autowired
	public EmployeeDao employeeDao;

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Transactional
	public void registerEmployeeAnd(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request) {

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

	
	@Transactional
	public void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request) {
		EmployeeVo employeeVo = employeeDao.selectById(joinEmployeeVo.getE_id());
		if (employeeVo != null) {
			throw new AlreadyExistingMemberException("중복" + joinEmployeeVo.getE_id());
		}
		
		employeeDao.insertEmployee(joinEmployeeVo);
		
	}	



	

///////////////////////////////////진화////////////////////////////////////////////////

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

	private final int LINE_PER_PAGE = 10;
	
	@Override
	public List<noticeBoardVo> getnoticelist(int page, String word, String searchCondition) {

		int startpoint = page * LINE_PER_PAGE;		
				
		/*PageHelper pageHelper = new PageHelper(startpoint, LINE_PER_PAGE);*/
        Map<String, Object> map = new HashMap<String, Object>();
        /*map.put("pageHelper", pageHelper);*/
        
        System.out.println("에헤헤헤헤헤");
        System.out.println(startpoint);  
                
        map.put("startpoint", startpoint);
        map.put("row", LINE_PER_PAGE);
        map.put(searchCondition, word);
        
        List<noticeBoardVo> noticelist = employeeDao.getnoticelist(map);
        System.out.println("서비스");
        System.out.println(noticelist);
        return noticelist;

	}
	
	

	@Override
	public int getlastpage(String word, String searchCondition) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(searchCondition, word);
		
		int lastpage = (int)((double)employeeDao.selectTotalCount(map)/LINE_PER_PAGE);		
		System.out.println(lastpage);
		return lastpage;
	
	}

	@Override
	public noticeBoardVo getnoticeBoardByNo(int no) {
		noticeBoardVo getnoticeBoardByNo = employeeDao.getnoticeBoardByNo(no);
		return getnoticeBoardByNo;
	}

}

