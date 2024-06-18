<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet"
	href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/profileShow.css">
</head>
<body class="theme">
	<input type="hidden" value="${profile.photo}" id="photo">
	<div id="back" class="theme">
		<span id="backBtn"><a href="main">&lang;</a></span>
		<div id="myProInfo">
			<span id="myNick">${profile.nickName}</span> <span class="myDetail">(
			</span> <span id="myId" class="myDetail">${profile.id}</span> <span
				class="myDetail"> )</span>
		</div>
		<div id="myProfileSetting">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path
					d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
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
				<img id="proImg">
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
						<td>0</td>
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
	<div id="myMenu">
		<input type="button" class="myMenuItem theme" value="POST"> <input
			type="button" class="myMenuItem theme" value="REPOST"> <input
			type="button" class="myMenuItem theme" value="COMMENT"> <input
			type="button" class="myMenuItem theme" value="MEDIA"> <input
			type="button" class="myMenuItem theme" value="LOVE">
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
        const img = document.querySelector('#proImg');
        const photo = document.querySelector('#photo');
        if(photo.value != "null") {
            img.src = "download?filename="+photo.value;
        } else if(photo.value == "null") {
            img.src = "./resources/img/프로필.png"
        }
    }
</script>
</html>