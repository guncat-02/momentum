<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>momentum</title>
	<!-- 다크 테마를 기본 값으로-->
	<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
	<link rel="stylesheet" href="./resources/css/chat.css">
	<link rel="stylesheet" href="./resources/css/profileMenu.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/sns/resources/JS/setTheme.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>

<body class="theme">
	<form id="form">
		<input type="hidden" value="${nickName}" id="user" name="nickName">
		<div id="chatAll">
			<div id="chatMenu" class="chatItem">
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
			<div id="chatUserTitle" class="chatItem">
				<div id="chatUserHeader">
					<span>MESSAGE</span>
				</div>
				<div id="chatUserSearch">
					<input type="search" placeholder="SEARCH M" id="chatSearch">
				</div>
			</div>
			<div id="chatUser" class="chatItem">
				<table id="chatUserTable">
					<c:forEach var="chat" items="${chatList}">
						<tr style="cursor: pointer;" class="chatInfo">
							<td style="width: 80%;">
								<span style="font-size: 16px;" class="infoName">${chat.chatName}</span>
								<input type="hidden" value="${chat.chatNum}" class="infoNum" name="chatNum">
								<input type="hidden" value="${chat.chatImg}" class="infoImg" name="chatImg">
							</td>
							<td style="width: 20%; font-size: 20px; text-align: center; color: #ff00bf;">
								<span style="display: none; color: #ff00bf;" class="userSel">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
										<path
											d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
									</svg>
								</span>
							</td>
						</tr>
						<tr class="userInfo" style="display: none;">
							<td class="userList" colspan="2">
								<div class="userListDiv">
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="newChat" class="chatItem">
				<a href="newChat?nickName=${nickName}"><input type="button" value="NEW CHAT +" id="newChatBtn"></a>
			</div>
			<div id="nowUserProfile" class="chatItem">
				<div id="nowUserCircle">
					<img id="nowUserImg">
				</div>
			</div>
			<div id="nowUserInfo" class="chatItem">
				<span id="nowUserName"></span>
				<input type="hidden" id="nowUserChat">
			</div>
			<div id="chatSetting" class="chatItem">
				<div id="chatSet">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16" id="popOpen">
  						<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
  						<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5"/>
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"  id="goEdit">
  						<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  						<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16" id="chatOut">
  						<path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
  						<path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
					</svg>
				</div>
			</div>
			<div id="nowChat" class="chatItem">
				<table id="nowChatting">
				</table>
			</div>
			<div id="chatInput" class="chatItem">
				<div id="chatFlex">
					<div id="chattingInput">
						<input type="text" id="chattingText" name="cont">
					</div>
					<div id="chatAttach">
						<label id="chatFileLabel" for="chatFile"> <svg xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-floppy" viewBox="0 0 16 16"
								id="chatAttachBtn">
								<path d="M11 2H9v3h2z" />
								<path
									d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v4.5A1.5 1.5 0 0 1 11.5 7h-7A1.5 1.5 0 0 1 3 5.5V1H1.5a.5.5 0 0 0-.5.5m3 4a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V1H4zM3 15h10v-4.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5z" />
							</svg>
						</label> <input type="file" id="chatFile" name="chatFile" multiple style="display: none;">
					</div>
					<div id="chatEmojiIcon">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
							class="bi bi-emoji-smile" viewBox="0 0 16 16" id="emojiList">
							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
							<path
								d="M4.285 9.567a.5.5 0 0 1 .683.183A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5m4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5" />
						</svg>
					</div>
					<div id="chatStorageBox">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
						class="bi bi-archive" viewBox="0 0 16 16" id="storageIcon">
						<path
							d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5zm13-3H1v2h14zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
					</svg>
					</div>
				</div>
			</div>
			<div id="imgDiv">
				<img id="bigImg">
			</div>
			<div id="chatCover" class="theme">
				<div id="chatCoverDiv"><span>M</span></div>
			</div>
		</div>
		<div id="emojiAll" class="theme">
			<table id="emojiAllTable">
			</table>
		</div>
		<div id="chatAttachBox" class="theme">
			<div id="chatAttachBoxBar">
				<input type="button" value="X" id="attachBoxBtn">
			</div>
			<div id="chatImgList"></div>
		</div>
	</form>
	<div id="chatFollowDiv" class="theme">
		<div id="followPop">
			<div id="followPopTitle">
				<span>
					PLUS M FRIENDS
				</span>
				<input type="button" value="X" id="popCancle">
			</div>
			<div id="followPopMenu">
				<input type="button" value="FOLLWER" id="followerBtn" class="folloBtn">
				<input type="button" value="FOLLOWING" id="followingBtn" class="folloBtn">
			</div>
			<div id="followList">
				<div id="followerList" class="follList">
					
				</div>
				<div id="followingList" class="follList">
					
				</div>
			</div>
			<div id="plusList">
			</div>
			<div id="plusBtnDiv">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16" id="plusBtn">
  					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
				</svg>
			</div>
		</div>
	</div>
</body>
<script>
	let chatNum;
	let lastNum;
	let sock;
	let lastDay;
	let num = 0;

	function connect() {
		sock = new SockJS("chat");

		//메세지를 받았을 떄
		sock.onmessage = function (e) {
			const data = JSON.parse(e.data);
			if(chatNum == data.chatNum) {
				let allDate = data.chatTime.split(' ');
				let day = allDate[0];
				let time = allDate[1];
				let usersProfile = proAjax(data.chatNum)
				if(day != lastDay) {
					$('#nowChatting').append("<thead><tr><td colspan='2' class='allDate'><div><hr>" + day + "<hr></div></td></tr></thead>")
				}
				lastDay = day;
				if(data.nickName == $('#user').val()) {
					if (data.cont != null && data.cont.trim() != "") {
						$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatNum'><span>"+num+"</span></div><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'>" + data.cont + "</div></div></td></tr>");
					} else {
						$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatNum'><span>"+num+"</span></div><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'><img src=download?filename=" + data.chatAttach + " class='chattingImg'></div></div></td></tr>");
					}
					$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight);
				} else {
					for (let i = 0; i < usersProfile.length; i++) {
						if (data.nickName == usersProfile.nickName) {
							if (usersProfile.photo != null) {
								if (data.cont != null && data.cont.trim() != "") {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[i].nickName + "</span></div><div class='chatProfileYou'><img src='download?filename=" + usersProfile[i].photo + "'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'>" + data.cont + "</div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
								} else {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[i].nickName + "</span></div><div class='chatProfileYou'><img src='download?filename=" + usersProfile[i].photo + "'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'><img src=download?filename=" + data.chatAttach + " class='chattingImg'></div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
								}
							} else {
								if (data.cont != null && data.cont.trim() != "") {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[i].nickName + "</span></div><div class='chatProfileYou'><img src='./resources/img/프로필.png'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'>" + data.cont + "</div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
								} else {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[i].nickName + "</span></div><div class='chatProfileYou'><img src='./resources/img/프로필.png'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'><img src=download?filename=" + data.chatAttach + " class='chattingImg'></div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>");
								}
							}
						}
					}
				}
			}
		}
		
		//소켓 연결이 종료 되었을 때
		sock.onclose = function() {
			sock = new SockJS("chat");
		}
	}

	//window 시작 시 기본 설정
	window.onload = function () {
		const color = $('body').css("background-color")
		$('#chatFollow').css("background-color", color)
		$('#chatFollowerBtn').css("background-color", color)
		$('#chatFollowingBtn').css("background-color", color)
		$('.proMainMenu').eq(1).css('color', '#ff00bf');
	};

	//follow div 띄우기
	$('#chatFriends').click(function () {
		$('#chatFollow').css("display", "block");
	})

	//다른 곳 클릭 시 follow div 숨기기
	$('body').click(function (e) {
		const id = e.target.getAttribute('id');
		const className = e.target.getAttribute('class')
		if (id != 'chatFriends' && className != 'chatFollowPopup') {
			$('#chatFollow').css("display", "none");
		}
	})

	//이모티콘 리스트를 보여주기 위한 메서드
	$('#emojiList').click(function () {
		const divChk = $("#emojiAll").css("display")
		if (divChk == "block") {
			$('#emojiAll').css("display", "none")
		} else {
			$('#emojiAll').css("display", "block")
		}
	})

	//이모티콘 추가
	let number = 8591;
	let index = 1;
	for (let i = 1; i < 846; i++) {
		if (index == i) {
			$('#emojiAllTable').append("<tr>")
		}
		$('#emojiAllTable').append("<td><span class='emoji'>&#12" + number + "</span></td>")
		if (i % 5 == 0) {
			$('#emojiAllTable').append("</tr>")
			index += 5;
		}
		number--;
	}

	const dataSave = new DataTransfer();
	const file = document.querySelector('#chatFile');
	//img 미리보기
	$('#chatFile').change(function (e) {
		if (fileCntChk()) {
			if (file.files != null) {
				if (fileChk(e)) {
					for (let i = 0; i < file.files.length; i++) {
						let reader = new FileReader();
						reader.readAsDataURL(file.files[i])
						reader.onload = function () {
							$('#chatImgList').append("<div class='imgListAll'><img class='chatImg' src=" + reader.result + "><input type='button' value='X' class='imgDel'></div>");
						}
						dataSave.items.add(file.files[i])
					}
				}
			}
		}
		file.files = dataSave.files;
	})

	//file 중복 제거
	function fileChk(e) {
		let fileArray = Array.from(e.target.files);
		let saveFileArray = Array.from(dataSave.files);
		for (let i = 0; i < fileArray.length; i++) {
			for (let j = 0; j < saveFileArray.length; j++) {
				if (fileArray[i].name == saveFileArray[j].name) {
					alert("중복된 파일은 업로드하실 수 없습니다.")
					return false;
				}
			}
		}
		return true;
	}

	//파일 수 제한
	function fileCntChk() {
		let fileLength = Array.from(dataSave.files).length;
		let upFileLength = file.files.length
		if (fileLength + upFileLength > 20) {
			alert("파일은 20개까지 업로드 하실 수 있습니다.")
			return false;
		}
		return true;
	}

	//이미지 삭제
	$('#chatImgList').on('click', '.imgDel', function () {
		const index = $('imgDel').index(this);
		const fileArray = Array.from(file.files);
		this.closest('div').remove();
		fileArray.splice(index, 1);
		dataSave.items.clear();
		fileArray.forEach(e => {
			dataSave.items.add(e);
		});
		file.files = dataSave.files;
	})

	//file 창 관리
	$('#chatAttachBtn').click(function () {
		$('#chatAttachBox').css("display", "block")
	})
	$('#attachBoxBtn').click(function () {
		$('#chatAttachBox').css("display", "none")
	})

	//이모티콘 선택
	$('#emojiAllTable').on('click', '.emoji', function () {
		const index = $('.emoji').index(this);
		const textIn = $('#chattingText').val();
		$('#chattingText').val(textIn + $('.emoji')[index].innerText)
	})

	//채팅 추가
	$('#chattingText').keydown(function (e) {
		if (e.keyCode == 13) {
			text = $('#chattingText').val();
            if ((text != null && text.trim() != "")|| file.files.length != 0) {
            	const fileArray = Array.from(file.files);
    			let fileName = "";
    			if(fileArray.length != 0) {
    				fileName = "YES"
    			} else {
    				fileName = "NO"
    			}
    			const form = $('#form')[0];
               	const formData = new FormData(form);
    			text = $('#chattingText').val();
    			let data = {
    				chatNum: chatNum,
    				nickName: $('#user').val(),
    				cont: text,
    				chatAttach: fileName
    			}
    			if(fileName == "YES") {
    				$.ajax({
                		url: "/sns/chat/chatting",
                		type: "post",
                		enctype: "multipart/form_data",
                		traditional: true,
                		data: formData,
                		async: false,
                		processData: false,
                    	contentType: false
                	})
    			}
    			sock.send(JSON.stringify(data));
    			resetChat();
            }
		}
	})

	let chatIndex;

	//그룹방 선택 시
	$('.chatInfo').click(function () {
		$('#chatCover').css("display", "none");
		$('#nowChatting').empty();
		$('#chatImgList').empty();
		resetChat();
		chatIndex = $('.chatInfo').index($(this));
		chatNum = $('.infoNum').eq(chatIndex).val();
		switchInput(chatIndex);
		const img = $('.infoImg').eq(chatIndex).val();
		$('.userSel').css("display", "none")
		$('.userSel').eq(chatIndex).css("display", "block");
		$('#nowUserName').text($('.infoName').eq(chatIndex).text())
		$('#nowUserChat').val($('.infoNum').eq(chatIndex).val())
		if (img != null && img.trim() != "") {
			$('#nowUserImg').attr('src', "download?filename=" + img)
		} else {
			$('#nowUserImg').attr('src', "./resources/img/프로필.png")
		}
		contAjax(chatNum);
	});

	//채팅 초기화
	function resetChat() {
		$('#chatImgList').empty();
		$('#chattingText').val("");
		$('#chatAttachBox').css("display", "none");
		dataSave.items.clear();
		file.files = dataSave.files;
		$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight);
	}

	//true false 변환
	function switchInput(index) {
		const chatNumInput = $('.infoNum')
		for (let i = 0; i < chatNumInput.length; i++) {
			if (index != i) {
				chatNumInput[i].disabled = true;
			}
		}
		chatNumInput[index].disabled = false;
	}


	//cont내용을 들고 오기 위한 ajax
	function contAjax(chat) {
		$.ajax({
			url: "/sns/chat/conts",
			type: "post",
			data: { chatNum: chat },
			success: function (result) {
				const user = $('#user').val();
				const chatCont = result;
				let usersProfile = proAjax(chat);
				chatInsert(chatCont, usersProfile, user);
				connect();
			}
		})
	}

	//profile을 들고 오기 위한 ajax
	function proAjax(chat) {
		let usersProfile;
		$.ajax({
			url: "/sns/chat/users",
			type: "post",
			data: { chatNum: chat },
			traditional: true,
			async: false,
			success: function (result) {
				usersProfile = result;
				num = usersProfile.length-1;
			}
		})
		return usersProfile;
	}

	//userList 추가
	function userList(index, users) {
		$('.userListDiv').empty();
		$('.userInfo').css('display', 'none')
		$('.userInfo').eq(index).css('display', 'table');
		for (let i = 0; i < users.length; i++) {
			if (users[i].nickName == $('#user').val()) {
				$('.userListDiv').eq(index).append("<span style='font-size: 15px; margin-left: 5%;'>" + users[i].nickName + "</span>");
			} else {
				$('.userListDiv').eq(index).append("<span style='font-size: 15px; margin-left: 5%;'>" + users[i].nickName + "</span>");
			}
		}
	}

	//cont 내용 추가
	function chatInsert(chatCont, usersProfile, user) {
		userList(chatIndex, usersProfile);
		if (chatCont != null && chatCont.length != 0) {
			const l_date = chatCont[chatCont.length-1].chatTime.split(' ')
			lastDay = l_date[0];
			let spDate = chatCont[0].chatTime.split(' ');
			let firstDate = spDate[0];
			$('#nowChatting').append("<thead><tr><td colspan='2' class='allDate'><div><hr>" + firstDate + "<hr></div></td></tr></thead>")
			for (let i = 0; i < chatCont.length; i++) {
				let allDate = chatCont[i].chatTime.split(' ');
				let day = allDate[0];
				let time = allDate[1];
				if (firstDate != day) {
					firstDate = day;
					$('#nowChatting').append("<thead><tr><td colspan='2' class='allDate'><div><hr>" + firstDate + "<hr></div></td></tr></thead>")
				}
				if (chatCont[i].nickName == user) {
					if (chatCont[i].cont != null && chatCont[i].cont.trim() != "") {
						$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatNum'><span>"+num+"</span></div><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'>" + chatCont[i].cont + "</div></div></td></tr>");
					} else {
						$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatNum'><span>"+num+"</span></div><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'><img src=download?filename=" + chatCont[i].chatAttach + " class='chattingImg'></div></div></td></tr>");
					}
					$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight)
				} else if (chatCont[i].nickName != user) {
					for (let j = 0; j < usersProfile.length; j++) {
						if (chatCont[i].nickName == usersProfile[j].nickName) {
							if (usersProfile[j].photo != null) {
								if (chatCont[i].cont != null && chatCont[i].cont.trim() != "") {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[j].nickName + "</span></div><div class='chatProfileYou'><img src='download?filename=" + usersProfile[j].photo + "'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'>" + chatCont[i].cont + "</div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
									break;
								} else {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[j].nickName + "</span></div><div class='chatProfileYou'><img src='download?filename=" + usersProfile[j].photo + "'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'><img src=download?filename=" + chatCont[i].chatAttach + " class='chattingImg'></div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
									break;
								}
							} else {
								if (chatCont[i].cont != null && chatCont[i].cont.trim() != "") {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[j].nickName + "</span></div><div class='chatProfileYou'><img src='./resources/img/프로필.png'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'>" + chatCont[i].cont + "</div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
									break;
								} else {
									$('#nowChatting').append("<tr><td class='chatProfile'><div class='userNick'><span>" + usersProfile[j].nickName + "</span></div><div class='chatProfileYou'><img src='./resources/img/프로필.png'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userChat'><img src=download?filename=" + chatCont[i].chatAttach + " class='chattingImg'></div><div class='chatUserDate'><span>" + time + "</span></div><div class='chatNum'><span>"+num+"</span></div></div></td></tr>")
									break;
								}
							}
						}
					}
				}
			}
		}
		$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight)
	}

	//이미지 크게보기
	$('#nowChatting').on('click', '.chattingImg', function () {
		$('#imgDiv').css('display', 'flex');
		$('#bigImg').attr('src', $(this).attr('src'));
	})

	//이미지 없애기
	$('#imgDiv').click(function () {
		$('#imgDiv').css('display', 'none');
	})

	//채팅방 검색
	$('#chatSearch').keydown(function (e) {
		if (e.keyCode == 13) {
			$('.userInfo').css('display', 'none')
			let searWord = $('.infoName')
			if ($('#chatSearch').val().trim != "") {
				$('.chatInfo').css('display', 'none')
				let word = $('#chatSearch').val()
				for (let i = 0; i < searWord.length; i++) {
					if (searWord[i].innerText.includes(word)) {
						$('.chatInfo').eq(i).css('display', 'table');
					}
				}
			} else {
				$('.chatInfo').css('display', 'table')
			}
		}
	})

	//보관함으로 이동
	$('#storageIcon').click(function () {
		location.href = "chatImg?chatName=" + $('#nowUserName').text() + "&chatNum=" + $('#nowUserChat').val();
	})
	
	$('#goEdit').click(function() {
		location.href="chatEdit?chatNum="+chatNum+"&nickName="+$('#user').val()
	})
	
	$('#chatOut').click(function() {
		if(confirm('정말 M을 나가시겠습니까? \n( M 기록은 복구 하실 수 없습니다 )')) {
			location.href="chatDel?nickName="+$('#user').val()+"&chatNum="+chatNum;
		}
	})
	
	$('#popOpen').click(function() {
		$('#followingList').empty();
		$('#followerList').empty();
		$.ajax({
			url: "chatFollowList",
			type: "post",
			success: function (result) {
				const profile = proAjax(chatNum);
				let following = result.following;
				let follower = result.follower;
				let followingFlag = false;
				let followerFlag = false;
				if(following.length != 0 && following != null) {
					for(let i = 0; i < following.length; i++) {
						for(let j = 0; j < profile.length; j++) {
							if(following[i].nickName == profile[j].nickName) {
								following.splice(i, 1);
								break;
							}
						}	
					}
					if(following.length != 0 && following != null) {
						followingFlag = true;
						for(let i = 0; i < following.length; i++) {
							$('#followingList').append("<div class='followings'><div class='followingsText'><span>"+following[i].nickName+"</span><span class='folloId'>"+following[i].id+"</span></div></div>")	
						}	
					}
				}
				if(follower.length != 0 && follower != null) {
					for(let i = 0; i < follower.length; i++) {
						for(let j = 0; j < profile.length; j++) {
							if(follower[i].nickName == profile[j].nickName) {
								follower.splice(i, 1);
								break;
							}
						}	
					}
					if(follower.length != 0 && follower != null) {
						followerFlag = true;
						for(let i = 0; i < follower.length; i++) {
							$('#followerList').append("<div class='followers'><div class='followersText'><span>"+follower[i].nickName+"</span><span class='folloId'>"+follower[i].id+"</span></div></div>")
						}
					}
				}
				if(followerFlag || followingFlag) {
					$('#chatFollowDiv').css('display', 'flex');
				} else {
					alert('추가할 following / follower 가 존재하지 않습니다.')
				}
			}
		})
	})
	
	$('#popCancle').click(function() {
		$('#chatFollowDiv').css('display', 'none');
		$('.selFollowsDiv').removeAttr('class');
		$('#plusList').empty();
	})
	
	$('#followerList').on('click', '.followers', function() {
		if($(this).children('div').attr('class') != "selFollowsDiv") {
			$(this).children('div').attr('class', 'selFollowsDiv')
			$('#plusList').append("<div class='plusFollos'><div class='selFollows'><span>"+$(this).find('span').eq(0).text()+"</span> <span class='plusId'>"+$(this).find('.folloId').text()+"</span></div>")
		}
	})
	
	$('#followingList').on('click', '.followings', function() {
		if($(this).children('div').attr('class') != "selFollowsDiv") {
			$(this).children('div').attr('class', 'selFollowsDiv')
			$('#plusList').append("<div class='plusFollos'><div class='selFollows'><span>"+$(this).find('span').eq(0).text()+"</span> <span class='plusId'>"+$(this).find('.folloId').text()+"</span></div></div>")	
		}
	})
	
	$('#plusList').on('click', '.plusFollos', function() {
		const selDiv = $('.selFollowsDiv');
		for(let i = 0; i < selDiv.length; i++) {
			if(selDiv.eq(i).children('span').eq(0).text().trim() == $(this).find('span').eq(0).text().trim()) {
				selDiv.eq(i).removeAttr('class');
				break;
			}
		}
		$(this).remove();
	})
	
	$('#followingBtn').click(function() {
		$('#followingBtn').css('color', '#ff00bf');
		$('#followerBtn').css('color', '#00f7ff');
		$('#followingList').css('display', 'block');
		$('#followerList').css('display', 'none');
	})
	
	$('#followerBtn').click(function() {
		$('#followerBtn').css('color', '#ff00bf');
		$('#followingBtn').css('color', '#00f7ff');
		$('#followerList').css('display', 'block');
		$('#followingList').css('display', 'none');
	})
	
	$('#plusBtn').click(function() {
		const list = $('.selFollows');
		if(list.length != 0 && list != null) {
			let id = new Array();
			let nick = new Array();
			for(let i = 0; i < list.length; i++) {
				id.push(list.eq(i).children('span').eq(1).text())
				nick.push(list.eq(i).children('span').eq(0).text())
			}
			$.ajax({
				url: "newChatMember",
				type: "post",
				data: {
					ids: id,
					nicks: nick,
					chat: chatNum
				},
				async: false,
				traditional: true,
			})
			location.href = "chat?nickName="+$('#user').val();
		} else {
			alert('친구를 추가해주세요.')
		}
	})
</script>

</html>