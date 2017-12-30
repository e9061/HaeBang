/**
 * 
 * 
 * Form에 관련된 함수모음
 */

function isNull(obj, msg) {
	if (obj.value == "") {
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}