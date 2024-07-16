<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <link rel="stylesheet" href="./resources/css/chatEdit.css">
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body class="theme">
    <form action="chatRoomEdit" method="post" onsubmit="return edit()" encType="multipart/form-data">
        <div id="chatAll">
            <div id="backSelProfile">
                <span id="backBtn">&lang;</span>
            </div>
            <div id="chatEditTitle">
                <span>EDIT M</span>
            </div>
            <div id="chatEditMain">
                <div id="chatRoomList">
                    <c:forEach var="chat" items="${chatRoom}">
                    	<div class="chatRoom">
                        	<div class="chatRoomName">
                            	<span>${chat.chatName}</span>
                            	<input type="hidden" class="chatNumList" value="${chat.chatNum}">
                            	<input type="hidden" class="chatImgList" value="${chat.chatImg}">
                        	</div>
                        	<div class="chatRoomSel">
                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                                	<path
                                    d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                            	</svg>
                        	</div>
                    	</div>
                    </c:forEach>
                </div>
                <div id="chatPhotoDiv">
                    <div id="chatPhotoCircle">
                        <label for="editFile" id="editLabel"><img id="editImg"></label>
                        <input type="file" name="editFile" id="editFile">
                    </div>
                </div>
                <div id="chatNameDiv">
                    <div id="chatImgBtn">
                        <input type="button" value="REMOVE IMG" id="removeImg" class="chatBtn">
                        <input type="button" value="MY IMG" id="myImg" class="chatBtn">
                        <input type="hidden" name="chatImg" value="MY IMG" id="imgChk">
                    </div>
                    <div id="chatNameText">
                        <span>M NAME</span>
                        <input type="text" id="chatName" name="chatName">
                        <input type="hidden" name="chatNum" id="chatNum">
                    </div>
                    <div id="chatEditCom">
                        <input type="submit" id="chatEditBtn" value="EDIT">
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
	let back;
	let backWord;
	let chatNum;
	let chatImg;
	const file = document.querySelector('#editFile');
    const img = document.querySelector('#editImg');

	window.onload = function() {
		const backHref = document.referrer;
    	const backArray = backHref.split('?')
    	const backChk = backArray[0].split('/')
    	back = backChk[backChk.length-1];	
    	const word = backArray[1].split('=')
    	backWord = word[1];
    	const now = location.href;
    	const nowChat = now.split('?')
    	const nowChatWord = nowChat[1].split('&')
    	const nowChatWordList = nowChatWord[0].split('=')
    	chatNum = nowChatWordList[1];
    	
    	for(let i = 0; i < $('.chatRoom').length; i++) {
    		if($('.chatNumList').eq(i).val() == chatNum) {
    			$('.chatRoom').eq(i).find('svg').css('display', 'block');
    			$('#chatName').attr('placeholder', $('.chatRoom').eq(i).find('span').text())
 				chatImg = $('.chatImgList').eq(i).val();
    		}
    	}
    	if(chatImg != null && chatImg.trim() != "") {
    		img.src = "download?filename="+chatImg	
    	} else {
    		img.src = "./resources/img/프로필.png";
    	}
	}
	
    //선택 확인
    $('.chatRoom').click(function () {
        let mRoom = $('.chatRoom')
        mRoom.find('svg').css('display', 'none')
        $(this).find('svg').css('display', 'block')
        chatImg = $(this).find('.chatImgList').val()
        chatNum = $(this).find('.chatNumList').val()
        $('#chatName').attr('placeholder', $(this).find('span').text())
        if(chatImg != null && chatImg.trim() != "") {
    		img.src = "download?filename="+chatImg	
    	} else {
    		img.src = "./resources/img/프로필.png";
    	}
    })

	//img 미리보기
    file.addEventListener('change', ()=> {
        const reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function() {
            img.src = reader.result;
        }
    })
    
    $('#backBtn').click(function() {
    	location.href=back+"?nickName="+backWord;
    })
    
    $('#removeImg').click(function() {
    	img.src = "./resources/img/프로필.png"
    	$('#imgChk').val($('#removeImg').val())
    	$('#editFile').val("")
    })
    
    $('#myImg').click(function() {
    	if(chatImg != null && chatImg.trim() != "") {
    		img.src = "download?filename="+chatImg	
    	} else {
    		img.src = "./resources/img/프로필.png";
    	}
        $('#imgChk').val($('#myImg').val())
        $('#editFile').val("")
    })
    
    function edit() {
    	$('#chatNum').val(chatNum);
    	if($('#chatName').val() != null && $('#chatName').val().trim() != "") {
    		return true;
    	} else {
    		if($('#editFile').val() != null && $('#editFile').val().trim() != "") {
    			$('#chatName').val($('#chatName').attr('placeholder'))
    			return true;
    		} else {
    			if(chatImg != null && chatImg.trim() != "") {
    				if($('#imgChk').val() == "REMOVE IMG") {
    					$('#chatName').val($('#chatName').attr('placeholder'))
    					return true;
    				} else {
    					alert('변경사항이 존재하지 않습니다.')
    					return false;
    				}
    			} else {
    				alert('변경사항이 존재하지 않습니다.')
					return false;
    			}
    		}
    	}
    }
</script>

</html>