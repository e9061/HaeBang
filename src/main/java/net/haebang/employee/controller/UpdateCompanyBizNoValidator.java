package net.haebang.employee.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import net.haebang.vo.CompanyVo;

public class UpdateCompanyBizNoValidator implements Validator {

	private static final String bizNoRegExp =
		"^[0-9]{10}$";
	private Pattern pattern;
	
	public UpdateCompanyBizNoValidator() {
		pattern = Pattern.compile(bizNoRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return CompanyVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		CompanyVo regReq = (CompanyVo) target;
		if (regReq.getC_bizNo()== null || regReq.getC_bizNo().trim().isEmpty()) {
			errors.rejectValue("c_bizNo", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getC_bizNo());
			if (!matcher.matches()) {
				errors.rejectValue("c_bizNo", "bad");
			}
		}
		
		
	}
	



	
	
	
	
	
	
	
	
	
}