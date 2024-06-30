<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/profileShow.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</head>
<body class="theme">
	<input type="hidden" value="${profile.photo}" id="photo">
	<div id="back" class="theme">
		<span id="backBtn"><a href="main">&lang;</a></span>
		<div id="myProInfo">
			<span id="myNick">${profile.nickName}</span> <span class="myDetail">( </span> <span id="myId" class="myDetail">${profile.id}</span> <span class="myDetail"> )</span>
		</div>
		<div id="myProfileSetting">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
            </svg>
		</div>
		<div id="settingMenu">
			<table>
				<tr>
					<td><a href="profileEdit">프로필 수정</a></td>
				</tr>
				<tr>
					<td><a href="#">기타 프로필</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="myProfile">
		<div id="myImg">
			<div id="myImgCircle">
				<img class="proImg">
			</div>
		</div>
		<div id="myInfo">
			<div id="myFollow">
				<table>
					<tr>
						<th style="width: calc(100%/ 3);">게시물</th>
						<th style="width: calc(100%/ 3);"><a href="#">FOLLOWING</a></th>
						<th style="width: calc(100%/ 3);"><a href="#">FOLLOWER</a></th>
					</tr>
					<tr>
						<td>${postlength}</td>
						<td>${following}</td>
						<td>${follower}</td>
					</tr>
				</table>
			</div>
			<div id="myBio">
				<table>
					<tr>
						<td><span>${profile.tel}</span></td>
					</tr>
					<tr>
						<td><span>${profile.bio}</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="myMenu" class="theme">
		<input type="button" class="myMenuItem theme" value="POST" onclick="postbut()"> <input type="button" class="myMenuItem theme" value="REPOST" onclick="repostbut()"> <input type="button" class="myMenuItem theme" value="COMMENT" onclick="commentbut()"> <input type="button" class="myMenuItem theme" value="MEDIA" onclick="mediabut()"> <input type="button" class="myMenuItem theme" value="LOVE">
	</div>
	<div class="myPost">
	<c:choose>
		<c:when test="${not empty lovepostList}">
		<c:forEach items="${lovepostList}" var="mp">
		<c:set var="filenameLength" value="${fn:length(mp.filename)}" />
		
			<a href="myPost?no=${mp.no}" style="cursor:pointer;" class = "p_alink" onclick="p_show(${mp.no})">
			<div class="p_inf">
				<div class="proimg">
				<c:choose>
					<c:when test ="${ !empty profile.photo }">
						<img class="profileImg" src="download?filename=${profile.photo }">
					</c:when>
					<c:otherwise>
						<img class="profileImg" src="./resources/img/프로필.png">
					</c:otherwise>
					
				</c:choose>
					
				</div>
				<span class="p_id">${mp.id }</span> <span class="p_date">${mp.p_date} </span>
			</div>
			<!-- 프로필 아이디 -->
			<div class="p_cont">${mp.cont }</div>
			 <c:choose>
				<c:when test ="${filenameLength eq 0}">
					<div class="p_files" style="display:none">
					<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 			<div class="item">
							<img src="download?filename=${status.current}">
						</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test ="${filenameLength eq 1}">
					<div class="p_files">
			 			<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 			<div class="item">
							<img src="download?filename=${status.current}">
						</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test ="${filenameLength eq 2}">
					<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr">
			 			<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 			<div class="item" style="">
							<img src="download?filename=${status.current}">
						</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test ="${filenameLength eq 3}">
					<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr">
			 			<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 				<c:choose>
			 					<c:when test = "${status.index eq 0}">
			 						<div class="item" style="grid-row : 1 / 3">
									<img src="download?filename=${status.current}">
									</div>
			 					</c:when>
			 					<c:otherwise>
				 					<div class="item">
									<img src="download?filename=${status.current}">
									</div>
			 					</c:otherwise>	
			 				</c:choose>
			 			
					</c:forEach>
					</div>
				</c:when>
				<c:when test ="${filenameLength eq 4}">
					<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr; auto-fit">
			 			<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 			<div class="item">
							<img src="download?filename=${status.current}">
						</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test ="${filenameLength eq 5}">
					<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr">
			 			<c:forEach items="${mp.filename }" var="file" varStatus="status">
			 			<c:choose>
			 					<c:when test = "${status.index eq 3}">
			 						<div class="item">
									<img src="download?filename=${status.current}">
									<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#ff00bf" class="bi bi-plus-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
</svg>
									</div>
			 					</c:when>
			 					<c:when test = "${status.index eq 4}">
			 					</c:when>
			 					<c:otherwise>
				 					<div class="item">
									<img src="download?filename=${status.current}">
									</div>
			 					</c:otherwise>	
			 				</c:choose>
					</c:forEach>
					</div>
				</c:when>
			</c:choose> 
			</a>
			
	
			
			<div class="mpfooter">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
</svg>
					<span class="footspan">${mp.show}</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-right-dots-fill" viewBox="0 0 16 16">
  <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353zM5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2" />
</svg>
					<span class="footspan">${mp.show}</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
  <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" />
</svg>
					<span class="footspan">${mp.show}</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
</svg>
					<span class="footspan">${mp.show}</span>
				</div>
				<div>
				</div>
			</div>

		</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="nothing">좋아요한 글이 존재하지 않습니다.</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>

<script>
    //설정 버튼 클릭 시 메뉴 띄우는 메서드
    document.querySelector('#myProfileSetting').addEventListener('click', () => {
        const menu = document.querySelector('#settingMenu');
        if (menu.style.display == "block") {
            menu.style.display = "none";
        } else {
            menu.style.display = "block";
        }
    })
    console.log("${lovelength}");
    window.onload = function() {
        const img = document.querySelector('.proImg');
        const photo = document.querySelector('#photo');
         
        if(photo.value != "null") {
            img.src = "download?filename="+photo.value;
        } else if(photo.value == "null") {
            img.src = "./resources/img/프로필.png";
        }
    }

    function postbut() {
    	 location.href = "profileShow";
    }
    function commentbut() {
    	location.href = "profileComment";
    }
    
    function mediabut() {
   	 	location.href = "profileMedia";
   }
    function lovebut() {
   	 	location.href = "profileLove";
   }
     
    function p_show(no) {
		$.ajax({
			type:"GET",
			url:"p_show",
			data: {"no" : no},
			cache : false,
			success:function() {
				}
		 })  
	}
     
</script>
</html>