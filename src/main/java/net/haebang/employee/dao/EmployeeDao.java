package net.haebang.employee.dao;

import java.util.List;
import java.util.Map;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.noticeBoardVo;

public interface EmployeeDao {

	//진화
        EmployeeVo selectById(EmployeeVo employeeVo);
        List<MapVo> selectAllmap(EmployeeVo employeeVo);
/***********************************************************************
        List<noticeBoardVo> getnoticelist(Map<String, Object> map);
        public int selectTotalCount(Map<String, Object> map);
        noticeBoardVo getnoticeBoardByNo(int no);
************************************************************************/        
        List<noticeBoardVo> getMainnoticelist();
        EmployeeVo getIdByPhone(Map<String, Object> map);
        EmployeeVo getIdByBizNo(Map<String, Object> map);
        EmployeeVo getIdbyId(EmployeeVo employeeVo);
        void changePassword(EmployeeVo employeeVo);
        
	 // 창대
	 EmployeeVo selectById(String e_id);
	 CompanyVo selectBybizNo(String c_bizNo);
	 
	 void insertEmployee(JoinEmployeeVo joinEmployeeVo);
	 void insertCompany(JoinEmployeeVo joinEmployeeVo);

}
