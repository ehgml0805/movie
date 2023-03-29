/*
 * errorDiv: 에러 메세지를 표시할 엘리먼트, flag: true/false
 * flag가 true이면 divElement의 바로 이전에 있는 엘리먼트의 클래스에서 row-other를 제거하고
 *  divElement의 hidden 속성을 제거해서 보이게 한다.
 */
function showTopRowErrorDiv(errorDiv, flag) {
	if (flag) {
		errorDiv.prev().removeClass("row-top");
		errorDiv.prev().addClass("row-top-without-border-bottom");
		errorDiv.prop("hidden", false);
	} else {
		errorDiv.prev().removeClass("row-top-without-border-bottom");
		errorDiv.prev().addClass("row-top");
		errorDiv.prop("hidden", true);
	}
}