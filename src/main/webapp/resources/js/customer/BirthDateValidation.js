class BirthDateValidation {
	// inputElement: 유효성 검사를 실시할 input
	constructor(inputElement) {
		this._inputElement = inputElement;
		// 유효성 검사 통과 여부를 저장하는 변수로 true이면 통과한 것이다.
		this._flag = false;
	}
	
	// flag에 대한 getter
	get flag() {
		return this._flag;
	}
	
	// year의 윤년 여부에 따라 true/false를 반환한다.
	isLeapYear(year) {
		return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
	}
	
	// 유효성 검사를 실시하고 그 결과를 flag에 저장한다.
	test() {
		const value = this._inputElement.val();
		// 값을 date 형식으로 변환한 상수이다.
		const birthDate = new Date(value.substr(0, 4) + "-" + value.substr(4, 2) + "-" + value.substr(6, 2));
		// 생년월일의 년 값을 저장한 상수이다.
		const birthYear = Number(value.substr(0, 4));
		// 생년월일의 월 값을 저장한 상수이다.
	    const birthMonth = Number(value.substr(4, 2));
		// 생년월일의 일 값을 저장한 상수이다.
	    const birthDay = Number(value.substr(6, 2));
		
		// 오늘 날짜를 저장한 상수이다.
		const todayDate = new Date();
		// 월별 일 수를 저장한 객체 상수이다.
		// 1월은 31일, 3월은 31일, 4월은 30일, ...
		const daysPerMonth = {1: 31, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31}
		
		// 테스트를 하나라도 통과하지 못하면 flag는 그대로 false이다.
		this._flag = false;
		
		if (value.length !== 8) {
			console.log("false1");
			return;
		}
		if (birthDate > todayDate) {
			console.log("false2");
			return;
		}
		if (birthYear < 1900) {
			console.log("false3");
			return;
		}
		if (!(birthMonth >= 1 && birthMonth <= 12)) {
			console.log("false4");
			return;
		}
		if (birthDay < 1) {
			console.log("false5");
			return;
		}
		if (birthMonth !== 2) {
			this._flag = birthDay <= daysPerMonth[birthMonth];
			return;
		}
		if (birthDay > 29) {
			console.log("false7");
			return;
		}
		if (!this.isLeapYear(birthYear) && birthDay === 29) {
			console.log("false8");
			return;
		}
		// 모든 검사를 통과했으므로 flag에 true를 저장한다.
		this._flag = true;
	}
}