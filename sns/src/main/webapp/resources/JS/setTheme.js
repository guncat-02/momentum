
// $(document).ready(function(){}); 의 바닐라 JS 구현.
document.addEventListener("DOMContentLoaded", function() {
	let curVal = getCurTheme();
	if (curVal == 0) {
		document.querySelector('#theme-setting').href = '/sns/resources/css/dark_theme.css';
	} else if (curVal == 1) {
		document.querySelector('#theme-setting').href = '/sns/resources/css/light_theme.css';
	} else {
		alert('curTheme cookie가 없습니다.');
	}
});

// 테마 세팅. 원하는 값으로 바로 지정.
function setTheme(value) {
	let newC = 'curTheme='+encodeURIComponent(value)+';';
	document.cookie = newC;
	if (value == 0) {
		document.querySelector('#theme-setting').href = '/sns/resources/css/dark_theme.css';
	} else {
		document.querySelector('#theme-setting').href = '/sns/resources/css/light_theme.css';
	}
}

// 테마 변경. 라이트 -> 다크 또는 다크 -> 라이트의 변경 가능.
function switchTheme() {
	let curVal = getCurTheme();
	if (curVal == 0) {
		setTheme(1);
	} else if (curVal == 1) {
		setTheme(0);
	} else {
		alert('curTheme cookie가 없습니다.');
	}
}

// 현재 테마에 대한 cookie 값 반환. 0: 다크, 1: 라이트, null: cookie 없음.
function getCurTheme() {
	let cookies = document.cookie;
	for (let cookie of cookies.split(';')) {
		let one = cookie.split('=');
		if (one[0] == 'curTheme') {
			return one[1];
		}
	}
	return null;
}

