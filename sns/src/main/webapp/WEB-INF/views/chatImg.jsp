<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
    <link rel="stylesheet" href="./resources/css/profileMenu.css">
    <link rel="stylesheet" href="./resources/css/chatImg.css">
    </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="theme">
    <div id="chatAll">
        <div id="chatMenu">
            <ul>
                <li class="proMainMenu"><a href="main">SNS</a></li>
                <li class="proMainMenu"><a href="selProfile">CHAT</a></li>
                <li id="profileSub" class="proMainMenu">
                    <a href="profileList">PROFILE</a>
                    <ul id="profileSubDiv">
                        <li class="proSubMenu"><a href="profileList">SHOW</a></li>
                        <li class="proSubMenu">EDIT</li>
                        <li class="proSubMenu">DELETE</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="imgListTitle">
            <span>
                ${chatName}
            </span>
        </div>
        <div id="chatImgList">
            <div id="imgList">
                <div id="imgAll">
                	<c:choose>
                		<c:when test="${chatAttach != null}">
                			<c:forEach var="att" items="${chatAttach}">
                    			<div class="imgDate">
                        			<hr>
                        			<span>
                           			 ${att.chatTime}
                        			</span>
                        			<hr>
                    			</div>
                    			<div class="imgListAll">
                    				<c:forEach var="attach" items="${att.attachList}">
                        				<div class="imgOne">
                            				<img class="chatImgOne" src="download?filename=${attach}">
                        				</div>
                        			</c:forEach>
                    			</div>
                    		</c:forEach>
                		</c:when>
                		<c:otherwise>
                			<div id="none">
                				<span>해당 M 의 사진이 존재하지 않습니다.</span>
           					</div>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
        <div id="bigImg">
            <img id="bigImgOne">
        </div>
    </div>
</body>
<script>
    //이미지 자세히 보기 띄우기
    $('.chatImgOne').click(function() {
        $('#bigImgOne').attr('src', $(this).attr('src'));
        $('#bigImg').css('display', 'flex')
    })

    //이미지 자세히 보기 없애기
    $('#bigImg').click(function() {
        $('#bigImg').css('display', 'none')
    })
</script>
</html>