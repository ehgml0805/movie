// 매개변수로 받은 tooltip을 3초 동안 표시한다.
function showTooltip(tooltip) {
	tooltip.show();
	setTimeout(function() {
		tooltip.hide();
	}, 3000);
	clearTimeout();
}