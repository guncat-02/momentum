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
    <div id = "loginbox">
        <label id ="wel">MOMENTUM</label> <label id="Loginnwel">로그인</label>
        <div id = "id"><span class = "loginlabel">아이디</span><span class="essential">*</span><br>
            <input type="text" name="id" placeholder="아이디를 입력하세요" class = "logintxt">
        </div>
        <div id = "pw"><span class = "loginlabel">비밀번호</span><span class="essential">*</span><br>
            <input type="text" name="pw" placeholder="비밀번호를 입력하세요"  class = "logintxt">
        </div>
        <div id = "logbut">
            <input type ="submit" value ="로그인" id = "loginbut">
        </div>
        <div id = "jointext">
            <span style="color: #00f7ff;">계정이 필요한가요? </span><a href = "join" class="alink"><span id = "joinlink">가입하기</span></a>
        </div>
    </div>
</body>
</html>