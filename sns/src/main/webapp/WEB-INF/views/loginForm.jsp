<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/css/Login.css">
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<input type = hidden value="" id = "loginfail">
<form action="loginchk" method="post">
	
    <div id = "loginbox">
        <label id ="wel">MOMENTUM</label> <label id="Loginnwel">로그인</label>
        <div id = "id"><span class = "loginlabel">아이디</span><span class="essential">*</span><br>
            <input type="text" name="id" placeholder="아이디를 입력하세요" class = "logintxt" id="inid">
        </div>
        <div id = "pw"><span class = "loginlabel">비밀번호</span><span class="essential">*</span><br>
            <input type="password" name="pass" placeholder="비밀번호를 입력하세요"  class = "logintxt" id="inpass">
        </div>
        <div id = "logbut">
            <input type ="submit" value ="로그인" id = "loginbut">
        </div>
        <div id = "jointext">
            <span style="color: #00f7ff;">계정이 필요한가요? </span>&nbsp<a href = "join" class="alink"><span id = "spanlink">가입하기</span></a>
            &nbsp<a href = "loginFindId" class="alink"><span id = "spanlink">비밀번호 찾기</span></a>
        </div>
    </div>
	 </form>
	 
	 <div id = "selbox">
	 <label id = "sellabel">ADMIN MENU</label>
	 <div id = "butbox">
	 	<a href="manager"><input type="button" value= "ADMIN" class = "custombut"></a><a href="main"><input type="button" value= "USER" class = "custombut2"></a>
	 </div>
	 </div>
</body>

<script>
$(document).ready(function() {
	let message = "${ msg }"; // msg
	
	if(message == "manager") {
		$("#loginbox").css("opacity","0.3");
		$("#selbox").css("display", "block");
	}else if(message != "") {
		alert("${ msg }");
	}
})



</script>
</html>