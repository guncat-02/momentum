<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="./resources/css/newChat.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body class="theme">
	<form encType="multipart/form-data" action="newChatSave" method="post"
		id="form">
		<input type="hidden" value="${nickName}" name="nickName" id="nickName">
		<div id="newChatTitle">
			<span>CREATE M</span>
		</div>
		<div id="chatAll">
			<div id="createChat">
				<div id="createChatTitle" class="createChatItem">
					<span>M</span>
				</div>
				<div id="createChatImg" class="createChatItem">
					<label for="chatPhoto">
						<div id="chatImgCircle">
							<img src="./resources/img/프로필.png" id="chatProfile">
						</div>
					</label> <input type="file" id="chatPhoto" name="chatPhoto"
						style="display: none;">
				</div>
				<div id="createChatNameTitle" class="createChatItem">
					<span>NAME</span>
				</div>
				<div id="createChatName" class="createChatItem">
					<input type="text" name="chatName" id="chatName"
						placeholder="사용하실 M 이름을 입력해주세요." maxlength="8">
				</div>
				<div id="createFriendTitle" class="createChatItem">
					<span>MEMBER</span>
				</div>
				<div id="createFriendMain" class="createChatItem">
					<table id="memberTable">

					</table>
				</div>
				<div id="create" class="createChatItem">
					<input type="button" id="createBtn" value="CREATE">
				</div>
			</div>
			<div id="createMember" class="theme">
				<div id="createMemberTitle">
					<span>FOLLOWS</span>
				</div>
				<div id="memberList">
					<div id="followingList">
						<table id="followingTable" class="folloList">
							<c:forEach var="follow" items="${following}">
								<tr class="followingTr">
									<td style="width: 45%;">${follow.nickName}</td>
									<td style="width: 45%;">${follow.id}</td>
									<td style="width: 10%;"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-check-lg"
											viewBox="0 0 16 16">
                                        <path
												d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z" />
                                    </svg></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="followerList">
						<table id="followerTable" class="folloList">
							<c:forEach var="follow" items="${follower}">
								<tr class="followerTr">
									<td style="width: 45%;">${follow.nickName}</td>
									<td style="width: 45%;">${follow.id}</td>
									<td style="width: 10%;"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-check-lg"
											viewBox="0 0 16 16">
                                        <path
												d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z" />
                                    </svg></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="memberMenu">
					<input type="button" value="FOLLOWING" class="memberBtn"
						id="followingBtn"> <input type="button" value="FOLLOWER"
						class="memberBtn" id="followerBtn">
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	const color = $('.theme').css("color");
	const backColor = $('.theme').css("background-color");
	
	window.onload = function() {
    	$('#followingBtn').css("background-color", "#ff00bf");
    	$('#followingBtn').css("color", backColor);
	}

    //following div block
    $('#followingBtn').click(function () {
        $('#followingList').css("display", "block")
        $('#followingBtn').css("background-color", "#ff00bf");
        $('#followingBtn').css("color", backColor);
        $('#followerList').css("display", "none")
        $('#followerBtn').css("background-color", "transparent");
        $('#followerBtn').css("color", "#ff00bf");
    })

    //follower div block
    $('#followerBtn').click(function () {
        $('#followingList').css("display", "none")
        $('#followerList').css("display", "block")
        $('#followerBtn').css("background-color", "#ff00bf");
        $('#followerBtn').css("color", backColor);
        $('#followingBtn').css("background-color", "transparent");
        $('#followingBtn').css("color", "#ff00bf");
    })

    const file = document.querySelector('#chatPhoto');
    const img = document.querySelector('#chatProfile')

    //이미지 미리보기
    file.addEventListener('change', ()=> {
        const reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function () {
            img.src = reader.result;
        }
    })

    //following 이동
    $('#followingTable').on('click', '.followingTr', function() {
        memberSel($(this));
    })

    //follower 이동
    $('#followerTable').on('click', '.followerTr', function() {
        memberSel($(this));
    })

    //follow 이동
    function memberSel(me) {
        if(me.find('svg').css("display") == "none") {
            me.css("color", "#00f7ff")
            me.find('svg').css("display", "block")
            const td = me.children('td');
            $('#memberTable').append("<tr class='memberTableTr'><td style='width: 45%;'>"+td[0].innerText+"</td><td style='width: 45%;'>"+td[1].innerText+"</td><td style='width: 10%;'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-dash-lg' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8'/></svg></td></tr>")
        } else {
            alert('이미 선택된 MEMBER입니다.')
        }
    }

    //member 삭제
    $('#memberTable').on('click', '.memberTableTr svg', function() {
        const tr = $(this).closest('tr')
        const td = $(this).closest('tr').children('td')[0].innerText;
        const followingTd = $('#followingTable').find('td')
        const followerTd = $('#followerTable').find('td')
        for(let i = 0; i < followingTd.length; i++) {
            if(i == 0 || i%3 == 0) {
                if(followingTd[i].innerText == td) {
                    followingTd[i].closest('tr').style.color = color;
                    followingTd[i+2].querySelector('svg').style.display = "none"
                }
            }
        }
        for(let i = 0; i < followerTd.length; i++) {
            if(i == 0 || i%3 == 0) {
                if(followerTd[i].innerText == td) {
                    followerTd[i].closest('tr').style.color = color;
                    followerTd[i+2].querySelector('svg').style.display = "none"
                }
            }
        }
        $(this).closest('tr').remove();
    })
    
    //submit
   $('#createBtn').click(function() {
	   $('#createBtn').disabled = false;
       	const memberArray = $('#memberTable').find('td');
       	const form = $('#form')[0];
       	const formData = new FormData(form);
        if (memberArray.length != 0) {
            const nick = new Array();
            const id = new Array();
            for (let i = 0; i < memberArray.length; i++) {
                if (i == 0 || i % 3 == 0) {
                    nick.push(memberArray[i].innerText);
                    id.push(memberArray[i + 1].innerText);
                }
            }
            $.ajax({
                url: "newChatSave",
                type: "post",
                enctype: "multipart/form_data",
                data: formData,
                async: false,
                success: function (result) {
                   	$.ajax({
                	   	url: "newChatMember",
                	   	type: "post",
                	   	traditional: true,
                	   	async: false,
                	  	data: {nicks: nick,
                		   	ids: id,
                		   	chat: result},
                		success: function() {
                			console.log('성공')
                		}
                   })
                },
                error: function() {
                	alert('잠시 후 다시 시도해주십시오.');
                },
                processData: false,
                contentType: false
            })
            location.href = "chat?nickName="+$('#nickName').val();
        } else {
            alert("MEMBER을 추가해주세요.")
        }
    })
</script>
</html>