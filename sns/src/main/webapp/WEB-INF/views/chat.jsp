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
<link rel="stylesheet" href="./resources/css/chat.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
	<form id="form">
		<input type="hidden" value="${nickName}" id="user" name="nickName">
		<div id="chatAll">
			<div id="chatMenu" class="chatItem">
				<ul>
					<li><a href="main">SNS</a></li>
					<li>PROFILE</li>
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
							<td style="width: 80%;"><span style="font-size: 16px;"
								class="infoName">${chat.chatName}</span> <input type="hidden"
								value="${chat.chatNum}" class="infoNum" name="chatNum">
								<input type="hidden" value="${chat.chatImg}" class="infoImg"
								name="chatImg"></td>
							<td
								style="width: 20%; font-size: 20px; text-align: center; color: #ff00bf;">
								<span style="display: none; color: #ff00bf;" class="userSel">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-suit-heart-fill"
										viewBox="0 0 16 16">
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
				<a href="newChat?nickName=${nickName}"><input type="button"
					value="NEW CHAT +" id="newChatBtn"></a>
			</div>
			<div id="nowUserProfile" class="chatItem">
				<div id="nowUserCircle">
					<img id="nowUserImg">
				</div>
			</div>
			<div id="nowUserInfo" class="chatItem">
				<span id="nowUserName"></span>
			</div>
			<div id="chatSetting" class="chatItem">
				<div id="chatSet">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                    <path
							d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                </svg>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-archive" viewBox="0 0 16 16"
						id="storageIcon">
                    <path
							d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5zm13-3H1v2h14zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
                </svg>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path
							d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
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
						<label id="chatFileLabel" for="chatFile"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-floppy" viewBox="0 0 16 16"
								id="chatAttachBtn">
                            <path d="M11 2H9v3h2z" />
                            <path
									d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v4.5A1.5 1.5 0 0 1 11.5 7h-7A1.5 1.5 0 0 1 3 5.5V1H1.5a.5.5 0 0 0-.5.5m3 4a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V1H4zM3 15h10v-4.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5z" />
                        </svg>
						</label> <input type="file" id="chatFile" name="chatFile" multiple
							style="display: none;">
					</div>
					<div id="chatEmojiIcon">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16"
							id="emojiList">
                        <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                        <path
								d="M4.285 9.567a.5.5 0 0 1 .683.183A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5m4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5" />
                    </svg>
					</div>
					<div id="chatImc">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16"
							id="chatImcBtn">
                        <path
								d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5" />
                        <path
								d="M10 8a2 2 0 1 1-4 0V3a2 2 0 1 1 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3" />
                    </svg>
					</div>
				</div>
			</div>
			<div id="chatCover" class="chatItem theme">
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
	<div id="imgDiv">
		<img id="bigImg">
	</div>
</body>
<script>
	let chatNum;
	let lastNum;

    //window 시작 시 기본 설정
    window.onload = function () {
        const color = $('body').css("background-color")
        $('#chatFollow').css("background-color", color)
        $('#chatFollowerBtn').css("background-color", color)
        $('#chatFollowingBtn').css("background-color", color)
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
               	const form = $('#form')[0];
               	const formData = new FormData(form);
            	$.ajax({
            		url: "/sns/chat/chatting",
            		type: "post",
            		enctype: "multipart/form_data",
            		data: formData,
            		async: false,
            		processData: false,
                	contentType: false
            	})
            }
            resetChat();
            contAjax(chatNum);
        }
    })
    
    let chatIndex;
    
    //그룹방 선택 시
    $('.chatInfo').click(function() {
    	$('#chatCover').css("display", "none");
    	resetChat();
        chatIndex = $('.chatInfo').index($(this));
    	chatNum = $('.infoNum').eq(chatIndex).val();
    	switchInput(chatIndex);
    	const img = $('.infoImg').eq(chatIndex).val();
    	$('.userSel').css("display","none")
    	$('.userSel').eq(chatIndex).css("display", "block");
    	$('#nowUserName').text($('.infoName').eq(chatIndex).text())
    	if(img != null && img.trim() != "") {
    		$('#nowUserImg').attr('src', "download?filename="+img)
    	} else {
    		$('#nowUserImg').attr('src', "./resources/img/프로필.png")
    	}
        contAjax(chatNum);
    });
    
    //채팅 초기화
    function resetChat() {
    	$('#nowChatting').empty();
    	$('#chattingText').val("");
    	$('#chatAttachBox').css("display", "none");
    	dataSave.items.clear();
    	file.files = dataSave.files;
    	$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight);
    }
    
    //true false 변환
    function switchInput(index) {
    	const chatNumInput = $('.infoNum')
    	for(let i = 0; i < chatNumInput.length; i++) {
    		if(index != i) {
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
            data: {chatNum: chat},
            success: function(result) {
            	const user = $('#user').val();
                const chatCont = result;
                let usersProfile = proAjax(chat);
                chatInsert(chatCont, usersProfile, user);            
            }
        })
    }
    
    //profile을 들고 오기 위한 ajax
    function proAjax(chat) {
    	let usersProfile;
        $.ajax({
        	url: "/sns/chat/users",
        	type: "post",
        	data: {chatNum: chat},
        	traditional: true,
        	async: false,
        	success: function(result) {
        		usersProfile = result;
        	}
        })
        return usersProfile;
    }
    
    //userList 추가
    function userList(index, users) {
    	$('.userListDiv').empty();
    	$('.userInfo').css('display', 'none')
    	$('.userInfo').eq(index).css('display', 'table');
    	for(let i = 0; i < users.length; i++) {
    		if(users[i].nickName == $('#user').val()) {
    			$('.userListDiv').eq(index).append("<span style='font-size: 15px; color: #ff00bf;'>"+users[i].nickName+" (M)</span>");
    		} else {
    			$('.userListDiv').eq(index).append("<span style='font-size: 15px;'>"+users[i].nickName+"</span>");
    		}
    	}   	
    }
    
    //cont 내용 추가
    function chatInsert(chatCont, usersProfile, user) {	
    	userList(chatIndex, usersProfile);
    	if(chatCont != null && chatCont.length != 0) {
    		let spDate = chatCont[0].chatTime.split(' ');
            let firstDate = spDate[0];
            $('#nowChatting').append("<thead><tr><td colspan='2' class='allDate'><div><hr>"+firstDate+"<hr></div></td></tr></thead>")
            for (let i = 0; i < chatCont.length; i++) {
                let allDate = chatCont[i].chatTime.split(' ');
                let day = allDate[0];
                let time = allDate[1];
                if(firstDate != day) {
                    firstDate = day;
                    $('#nowChatting').append("<thead><tr><td colspan='2' class='allDate'><div><hr>"+firstDate+"<hr></div></td></tr></thead>")
                }
                if (chatCont[i].nickName == user) {
                	if(chatCont[i].cont != null && chatCont[i].cont.trim() != "") {
                		$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'>" + chatCont[i].cont + "</div></div></td></tr>");
                	} else {
                		$('#nowChatting').append("<tr><td class='chatCont'><div class='chatting myChatting'><div class='chatUserDate myChatDate'><span>" + time + "</span></div><div class='userChat myChat'><img src=download?filename=" + chatCont[i].chatAttach + " class='chattingImg'></div></div></td></tr>");
                	}
                    $('#nowChat').scrollTop($('#nowChat')[0].scrollHeight)
                } else if (chatCont[i].nickName != user) {
                    for (let j = 0; j < usersProfile.length; j++) {
                        if (chatCont[i].nickName == usersProfile[j].nickName) {
                            if (usersProfile[j].photo != null) {
                                $('#nowChatting').append("<tr><td class='chatProfile'><div class='chatProfileYou'><img src='download?filename=" + usersProfile[j].photo + "'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userNick'>" + usersProfile[j].nickName + "</div><div class='userChat'>" + chatCont[i].cont + "</div><div class='chatUserDate'><span>" + time + "</span></div></div></td></tr>")
                                break;
                            } else {
                                $('#nowChatting').append("<tr><td class='chatProfile'><div class='chatProfileYou'><img src='./resources/img/프로필.png'></div></td><td class='chatCont'><div class='chatting yourChatting'><div class='userNick'>" + usersProfile[j].nickName + "</div><div class='userChat'>" + chatCont[i].cont + "</div><div class='chatUserDate'><span>" + time + "</span></div></div></td></tr>")
                                break;
                            }
                        }
                    }
                }
            }	
    	}
    	$('#nowChat').scrollTop($('#nowChat')[0].scrollHeight)
    }
    
    //이미지 크게보기
    $('#nowChatting').on('click', '.chattingImg', function() {
    	$('#imgDiv').css('display', 'block');
    	$('#bigImg').attr('src', $(this).attr('src'));
    })
    
    //이미지 없애기
    $('#imgDiv').click(function(){
    	$('#imgDiv').css('display', 'none');  	
    })
    
    //채팅방 검색
    $('#chatSearch').keydown(function(e) {
    	if (e.keyCode == 13) {
    		let searWord = $('.infoName')
    		if($('#chatSearch').val().trim != "") {
    			$('.chatInfo').css('display', 'none')
    			let word = $('#chatSearch').val()
    			for(let i = 0; i < searWord.length; i++) {
    				if(searWord[i].innerText.includes(word)) {
    					$('.chatInfo').eq(i).css('display', 'table');
    				}
    			}
    		} else {
    			$('.chatInfo').css('display', 'table')
    		}
    	}
    })
</script>
</html>