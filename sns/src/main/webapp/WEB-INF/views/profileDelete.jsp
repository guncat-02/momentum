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
    <link rel="stylesheet" href="./resources/css/profileDelete.css">
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
                        <li class="proSubMenu"><a href="profileUpdate">EDIT</a></li>
                        <li class="proSubMenu"><a href="profileDelete">DELETE</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="profileDeleteTitle">
            <span>PROFILE DELETE</span>
        </div>
        <div id="profileDeleteInfo">
            <span>삭제하실 프로필을 선택해주세요.</span>
        </div>
        <div id="profileDelSel">
        	<c:forEach var="p" items="${profile}">
            <div class="proDelSel">
                <div class="delSelPhoto">
                    <div class="delSelCircle">
                    	<c:choose>
                    		<c:when test="${p.photo == null}">
                    			<img class="delImg" src="./resources/img/프로필.png">
                    		</c:when>
                    		<c:otherwise>
                    			<img class="delImg" src="download?filename=${p.photo}">
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
                <div class="delSelInfo">
                    <span class="delNick">${p.nickName}</span>
                    <c:if test="${p.bio != null}">
                    	<span class="delBio">${p.bio}</span>
                    </c:if>
                </div>
                <div class="delChk">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-check-lg" viewBox="0 0 16 16">
                    <path
                        d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z" />
                    </svg>
                </div>
            </div>
            </c:forEach>
        </div>
        <div id="delComplete">
            <input type="button" value="DELETE" id="delBtn">
        </div>
    </div>
    <div id="delAll" class="theme">
        <div id="delChkDiv" class="theme">
            <span>프로필을 삭제하시겠습니까?</span>
            <p>해당 프로필의 M 도 사라지게 됩니다.</p>
            <p>삭제된 프로필은 다시 복구하실 수 없습니다.</p>
            <div id="delBtnAll">
                <input type="button" value="YES" id="delYes" class="delChkBtn">
                <input type="button" value="NO" id="delNo" class="delChkBtn">
            </div>
        </div>
    </div>
</body>
<script>
    window.onload = function() {
        $('#profileSub').css('color', '#ff00bf');
        $('.proSubMenu').eq(2).css('color', '#ff00bf');
    }

    $('.proDelSel').click(function() {
        const svgDis = $(this).find('svg').css('display')
        if(svgDis == "block") {
            $(this).find('svg').css('display', 'none')
        } else {
            $(this).find('svg').css('display', 'block')
        }
    })

    let nick = new Array();
    
    $('#delYes').click(function() {
    	$.ajax({
            url: "profileDel",
            type: "get",
            data: {nickName: nick},
            traditional: true,
            async: false
        })
        location.href="profileList";
    })
    
    $('#delNo').click(function() {
    	$('#delAll').css('display', 'none');
    })
    
    $('#delBtn').click(function() {
    	 const svg = $('svg')
         for(let i = 0; i < svg.length; i++) {
             if(svg.eq(i).css('display') == "block") {
                 nick.push($('.delNick').eq(i).text())
             }
         }
         if(nick.length == 0) {
             alert('삭제하실 프로필을 선택해주세요.')
         } else {
        	 $('#delAll').css('display', 'flex');
         }
    })
</script>
</html>