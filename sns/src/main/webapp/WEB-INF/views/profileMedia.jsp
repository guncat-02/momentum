<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/profileShow.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
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
		<input type="button" class="myMenuItem theme" value="POST" onclick="postbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="REPOST" onclick="repostbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="COMMENT" onclick="commentbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="MEDIA" onclick="mediabut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="LOVE" onclick="lovebut('${profile.id}')">
	</div>
	<div class="media">
		<div class="m_intro">
			<span class="nick">${profile.nickName}</span>’s<span class="memories"> Memories</span>
		</div>

		<c:forEach items="${myfiles}" var="mf" varStatus="loop">
			<c:set var="filenameLength" value="${fn:length(mf.filename)}" />
			
			<c:choose>
				<c:when test="${loop.index == 0 or mf.p_date ne myfiles[loop.index - 1].p_date}">
					<c:choose>
						<c:when test="${filenameLength ne 0 }">
							<div class="m_date">
							<span class="m_datespan">${mf.p_date}</span>
							</div>
							<div class="files">
						</c:when>
					</c:choose>
				</c:when>
			</c:choose>
			<c:forEach items="${mf.filename}" var="file" varStatus="status">
				<div class="p_item">
					<a onclick="openModal('${status.current}')"><img src="download?filename=${status.current}"></a>
				</div>
			</c:forEach>
			
			<c:choose>
				<c:when test="${loop.index == myfiles.size() - 1 or mf.p_date ne myfiles[loop.index + 1].p_date}">
				</div>
				</c:when>
			</c:choose>
		
	</c:forEach>




	</div>
	<div class="modal">
		<div class="modal_body">
			<img src="" class="modalImg">
			<svg class="closeModal" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="black" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
</svg>
		</div>

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
    
    //프로필 불러오기
    window.onload = function() {
        const img = document.querySelector('.proImg');
        const photo = document.querySelector('#photo');
  
        if(photo.value != "" && photo.value != null) {
            img.src = "download?filename="+photo.value;
        } else {
            img.src = "./resources/img/프로필.png";
        }
    }

    function postbut(id) {
   	 location.href = "profileShow?id="+id;
   }
    function commentbut(id) {
    	location.href = "profileComment?id="+id;
    }
   
   function mediabut(id) {
  	 	location.href = "profileMedia?id="+id;
  }
   function lovebut(id) {
  	 	location.href = "profileLove?id="+id;
  }
    
    
	// 모달    
    const modal = document.querySelector('.modal');

    function openModal(filename) {
    	modal.style.display="flex";
    	console.log(filename);
    	$(".modalImg").attr("src", "download?filename="+filename);
    	console.log("download?filename="+filename);
    }
    
	$(".closeModal").click(function() {
		$(".modal").css("display","none");
	});
     
    
</script>
</html>