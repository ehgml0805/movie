class IdValidation {
	// inputElement: 유효성 검사를 실시할 input
	// englishReg: 알파벳 대문자/소문자 정규표현식
	// numberReg: 숫자 정규표현식
	// specialReg: 특수문자 정규표현식
	constructor(inputElement, englishReg, numberReg) {
		this._inputElement = inputElement;
		this._englishReg = englishReg;
		this._numberReg = numberReg;
		// 유효성 검사 통과 여부를 저장하는 변수로 true이면 통과한 것이다.
		this._flag = false;
	}
	
	// flag에 대한 getter
	get flag() {
		return this._flag;
	}
	
	// 유효성 검사를 실시하고 그 결과를 flag에 저장한다.
	test() {
		const value = this._inputElement.val();
		
		// 값의 길이는 8 이상 12 이하만 가능하다.
		if (!(value.length >= 8 && value.length <= 12)) {
			this._flag = false;
			console.log("idValidation: " + this._flag);
			return;
		}
		
		// 알파벳, 숫자 모두 포함되어야 한다.
		if (this._englishReg.test(value) && this._numberReg.test(value)) {
			this._flag = true;
		} else {
			this._flag = false;
		}
		console.log("idValidation: " + this._flag);
	}
}