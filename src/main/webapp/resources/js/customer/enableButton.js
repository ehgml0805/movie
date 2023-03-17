// button: 조작할 버튼
// flag: true/false
// flag가 true이면 "회원가입" 버튼을 활성화한다.
function enableButton(button, flag) {
	if (flag) {
		button.prop("disabled", false);
	} else {
		button.prop("disabled", true);
	}
}