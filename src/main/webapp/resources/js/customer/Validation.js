class Validation {
	// inputElement: 유효성 검사를 실시할 input
	// regExp: 해당 정규표현식으로 유효성 검사를 실시한다.
	constructor(inputElement, regExp) {
		this._inputElement = inputElement;
		this._regExp = regExp;
		// 유효성 검사 통과 여부를 저장하는 변수로 true이면 통과한 것이다.
		this._flag = false;
	}
	
	// flag에 대한 getter
	get flag() {
		console.log("flag: " + this._flag);
		return this._flag;
	}
	
	// 유효성 검사를 실시하고 그 결과를 flag에 저장한다.
	test() {
		const value = this._inputElement.val();
		
		if (this._regExp.test(value)) {
			this._flag = true;
		} else {
			this._flag = false;
		}
		console.log("test 결과: " + this._flag);
	}
}