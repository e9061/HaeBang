package net.haebang.employee.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import net.haebang.vo.JoinEmployeeVo;

public class RegisterEmployeeValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return JoinEmployeeVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "e_phone", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_name", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_address", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_phone", "required");
		ValidationUtils.rejectIfEmpty(errors, "c_bizNo", "required");
	}
}

