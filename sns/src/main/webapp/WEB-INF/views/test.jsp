<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %> <!-- 서버의 세션 영역에 변수에 접근하게 한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:if test="${userid != null }">
			<span> 사용자 정보 : ${userid } / ${username } / ${grade }</span>
			<span><a href="/sns/logout">로그아웃</a></span>
		</c:if>
	</div>
	<h1>로그인 후 페이지</h1>
</body>
</html>