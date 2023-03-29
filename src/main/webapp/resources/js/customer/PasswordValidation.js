class PasswordValidation {
	// inputElement: 유효성 검사를 실시할 input
	// englishReg: 알파벳 대문자/소문자 정규표현식
	// numberReg: 숫자 정규표현식
	// specialReg: 특수문자 정규표현식
	constructor(inputElement, englishReg, numberReg, specialReg) {
		this._inputElement = inputElement;
		this._englishReg = englishReg;
		this._numberReg = numberReg;
		this._specialReg = specialReg;
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
		
		// 값의 길이는 10 이상 16 이하만 가능하다.
		if (!(value.length >= 10 && value.length <= 16)) {
			this._flag = false;
			return;
		}
		
		// 조합의 가지 수
		let totalCombination = 0;
		
		if (this._englishReg.test(value)) {
			totalCombination++;
		}
		if (this._numberReg.test(value)) {
			totalCombination++;
		}
		if (this._specialReg.test(value)) {
			totalCombination++;
		}
		
		console.log("totalCombination: " + totalCombination);
		// 조합이 2가지 이상이어야 한다.
		if (totalCombination < 2) {
			this._flag = false;
		} else {
			this._flag = true;
		}
	}
}