<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
    <link rel="stylesheet" href="./resources/css/chatStart.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/sns/resources/JS/setTheme.js"></script>
<body class="theme">
    <div id="chatStartTitle">
        <span>기존 M 이 존재하지 않습니다.</span>
    </div>
    <div id="chatStartMain">
        <a id="goProfile" href="selProfile"><input type="button" value="CREATE M" id="chatstartBtn"></a>
        <a href="main"><input type="button" value="CANCLE" id="chatStartCancle"></a>
    </div>
</body>
<script>
	$('#chatstartBtn').click(function() {
		let cnt;
		$.ajax({
			url: "followSelect",
			type: "post",
			async: false,
			success: function(result) {
				cnt = result;
			}
		})
		if(cnt == 0) {
			alert('팔로우가 존재하지 않습니다.');
			$('#goProfile').attr("href", "main")
		}
	})
</script>
</html>