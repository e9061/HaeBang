package net.haebang.employee.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import net.haebang.vo.JoinEmployeeVo;

public class RegisterEmployeeValidator implements Validator {

	private static final String emailRegExp =
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
					"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;
	
	public RegisterEmployeeValidator() {
		pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return JoinEmployeeVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		JoinEmployeeVo regReq = (JoinEmployeeVo) target;
		if (regReq.getE_id()== null || regReq.getE_id().trim().isEmpty()) {
			errors.rejectValue("e_id", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getE_id());
			if (!matcher.matches()) {
				errors.rejectValue("e_id", "bad");
			}
		}
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_phone1", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_phone2", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_phone3", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_name", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_address", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_phone", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_bizNo", "required");
	}
	



	
	
	
	
	
	
	
	
	
}


