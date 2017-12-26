package net.haebang.user.service;

import java.util.List;
import java.util.Map;

import net.haebang.vo.ServiceVo;

public interface SrvService {

	public List<ServiceVo> selectList(String con1, String con2, int con3);
	
	void insertScheduleByOnetime(Map<String, Object> map);

	void insertSchedule(Map<String, Object> map);
	
	ServiceVo getServiceInfo(int s_no);
	
}
