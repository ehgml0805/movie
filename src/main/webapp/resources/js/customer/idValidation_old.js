// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
let idLengthAndCombinationValidationFlag = false;

// 아이디 input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
let savedIdValue;

/*
 * inputElement: 유효성 검사를 실시할 input
 * 반환값은 유효성 검사 통과 여부이다.
 * 아이디에는 영문, 숫자 입력만 허용된다.
 * 아이디 input이 비어있거나 허용된 값만 있으면 savedIdValue에 그 값을 저장한다.
 * 아이디 input에 허용되지 않는 값이 포함되어 있으면 이전으로 되돌리고 툴팁을 표시한다.
 * 마지막에는 비밀번호와 비밀번호 확인의 값이 동일한지 체크한다.
 */
function idKeyboardInputValidation(inputElement) {
	const value = inputElement.val();
	
	console.log("idReg.test: " + idReg.test(value));
	if (idReg.test(value) || value === "") {
		savedIdValue = value;
		return true;
	} else {
		inputElement.val(savedIdValue);
		console.log("savedIdValue: " + savedIdValue);
		return false;
	}
}

/*
 * 아이디에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * 아이디의 길이와 조합이 적절한지 확인한다.
 * 아이디는 8자리 이상, 12자리 이하만 가능하다.
 * 아이디는 영문, 숫자가 반드시 조합되어야 한다.
 */
function idLengthAndCombinationValidation(inputElement) {
	const value = inputElement.val();
	
	if (!(value.length >= 8 && value.length <= 12)) {
		idLengthAndCombinationValidationFlag = false;
		return false;
	}

	if (!(engReg.test(value) && numReg.test(value))) {
		idLengthAndCombinationValidationFlag = false;
		return false;
	} else {
		idLengthAndCombinationValidationFlag = true;
		return true;
	}
}

// 모든 아이디 유효성 검사를 통과했으면 true를 반환한다.
function isAllIdFlagTrue() {
	console.log("idLengthAndCombinationValidationFlag: " + idLengthAndCombinationValidationFlag);
	return idLengthAndCombinationValidationFlag;
}