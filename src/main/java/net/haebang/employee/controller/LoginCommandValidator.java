package net.haebang.employee.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import net.haebang.vo.EmployeeVo;


public class LoginCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return EmployeeVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_id", "required");
		ValidationUtils.rejectIfEmpty(errors, "e_password", "required");
	}

}