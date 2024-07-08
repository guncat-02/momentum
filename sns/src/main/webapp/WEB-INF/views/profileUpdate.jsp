<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <link rel="stylesheet" href="./resources/css/profileUpdate.css">
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
    <link rel="stylesheet" href="./resources/css/profileMenu.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body class="theme">
    <div id="chatAll">
        <div id="chatMenu">
            <ul>
                <li class="proMainMenu"><a href="main">SNS</a></li>
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
        <div id="profileUpdateTitle">
            <span>PROFILE EDIT</span>
        </div>
        <div id="profileEditMain">
            <div id="proEdit">
                <div id="proSel">
                	<c:forEach var="p" items="${profile}">
                    <div class="proSelDiv">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path
                                d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z" />
                        </svg>
                        <div class="proSelCircle">
                        <c:choose>
                        	<c:when test="${p.photo != null}">
                        		<img class="proSelImg" src="download?filename=${p.photo}">
                        	</c:when>
                        	<c:when test="${p.photo == null}">
                        		<img class="proSelImg" src="./resources/img/프로필.png">
                        	</c:when>
                        </c:choose>
                        </div>
                        <div class="proSelInfo">
                            <span class="proSelNick">${p.nickName}</span>
                            <span class="proSelBio">${p.bio}</span>
                        </div>
                    </div>
                    </c:forEach>
                    <input type="button" value="&rang;" id="nextStep">
                </div>
                <div id="proEditNext">
                    <form onsubmit="return editProfile()" action="edit" method="post" encType="multipart/form-data">
                    	<input type="hidden" id="userNick" name="userNick">
                        <input type="button" value="&lang;" id="backStep">
                        <div id="editPhoto">
                        	<div id="remove">
                                <input type="button" value="REMOVE IMG" id="removeImg">
                                <input type="button" value="MY IMG" id="backImg">
                                <input type="hidden" id="imgChk" name="imgChk">
                            </div>
                            <div id="editPhotoCircle">
                                <label for="editPhotoFile" id="edtiPhotoLabel"><img id="editSelPhoto"></label>
                                <input type="file" id="editPhotoFile" name="proPhoto">
                            </div>
                        </div>
                        <div id="editInfoMain">
                            <div id="editNick">
                                <span>NICK NAME</span>
                                <input type="button" value="CHECK" id="chk">
                            </div>
                            <input type="text" id="nickEdit" class="editText" name="nickName" minlength="1" maxlength="8" pattern="^[ㄱ-ㅎ가-힣a-zA-Z\d_]+$" title="한글, 영어, 숫자, 언더바만 사용 가능합니다.">
                            <span>BIO</span>
                            <textarea id="bioEdit" class="editText" name="bio" maxlength="50"></textarea>
                            <div id="formComplete">
                                <input type="submit" value="EDIT" id="editSubmit">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="editInfo">
            <span>수정하실 M 프로필을 선택해주세요.</span>
        </div>
    </div>
</body>
<script>
	let myImg;
	let imgChk = $('#backImg').val();

    window.onload = function () {
        $('#profileSub').css('color', '#ff00bf');
        $('.proSubMenu').eq(1).css('color', '#ff00bf');
    }

    //프로필 선택
    $('.proSelDiv').click(function () {
        const index = $('.proSelDiv').index($(this));
        const proSel = $('.proSelDiv');
        const svg = $('.proSelDiv').children('svg');
        for (let i = 0; i < proSel.length; i++) {
            if (i == index) {
                svg[i].style.display = 'block';
            } else {
                svg[i].style.display = 'none';
            }
        }
        $('#editInfo').children('span').text($(this).find('.proSelNick').text() + ' 선택')
        $('.editText').eq(0).attr('placeholder', $(this).find('.proSelNick').text())
        $('.editText').eq(1).attr('placeholder', $(this).find('.proSelBio').text())
        $('#editSelPhoto').attr('src', $(this).find('.proSelImg').attr('src'))
        myImg = $(this).find('.proSelImg').attr('src');
        if($(this).find('.proSelImg').attr('src') == "./resources/img/프로필.png") {
        	$('#removeImg').css('display', 'none');
        }
        $('#userNick').val($(this).find('.proSelNick').text());
    })

    //체크 확인
    function scrollChk() {
        const svg = $('.proSelDiv').children('svg');
        for (let i = 0; i < svg.length; i++) {
            if (svg[i].style.display == "block") {
                return true;
            }
        }
        return false;
    }

    //스크롤 오른쪽 이동
    $('#nextStep').click(function () {
        if (scrollChk()) {
            $('#profileEditMain').animate({
                scrollLeft: $('#profileEditMain')[0].scrollWidth
            }, 1000);
        } else {
            alert('수정하실 프로필을 선택해주세요.')
        }
    })

    //스크롤 왼쪽으로 이동
    $('#backStep').click(function () {
        $('#profileEditMain').animate({
            scrollLeft: 0
        }, 800);
    })

    const file = document.querySelector('#editPhotoFile')
    const img = document.querySelector('#editSelPhoto')

    //img 미리보기
    $('#editPhotoFile').change(function() {
    	$('#baseImg').css('display', 'block')
        const reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function() {
            img.src = reader.result;
        }
        $('#removeImg').css('display', 'block');
        $('#backImg').css('display', 'block');
    })

    //remove
    $('#removeImg').click(function() {
        img.src = "./resources/img/프로필.png"
        $('#editPhotoFile').val('')
        $('#removeImg').css('display', 'none');
        imgChk = $('#removeImg').val();
        if(myImg == "./resources/img/프로필.png") {
        	$('#backImg').css('display', 'none');
    	} else {
    		$('#backImg').css('display', 'block');
    	}
    })
    
    //원래 이미지로
    $('#backImg').click(function() {
    	$('#editPhotoFile').val('');
    	img.src = myImg;
    	imgChk = $('#backImg').val();
    	$('#backImg').css('display', 'none');
    	if(myImg == "./resources/img/프로필.png") {
    		$('#removeImg').css('display', 'none');
    	} else {
    		$('#removeImg').css('display', 'block');
    	}
    })
    
    //닉네임 중복 체크
    $('#chk').click(function() {
    	if($('#nickEdit').val().trim() != "" && $('#nickEdit').val() != null) {
    		if($('#nickEdit').val() == $('#nickEdit').attr('placeholder')) {
    			alert('동일한 NICK NAME 입니다.')
    			$('#nickEdit').val("")
    		} else {
    			$.ajax({
            		url: "profileChk",
            		type: "post",
            		data: {nickName: $('#nickEdit').val()},
                	success: function(result) {
                		if(result != "null") {
                			alert('사용 가능한 NICK NAME입니다.');
                    		$('#chk').css('color', '#ff00bf');	
                		} else {
                			alert('중복된 NICK NAME 입니다.');
                		}
                	}
            	})	
    		}
    	} else {
    		alert('수정 내용을 입력해주세요.')
    	}
    })
    
    //닉네임 다시 입력 시 중복체크 풀기
    $('#nickEdit').change(function(){
    	$('#chk').css('color', '#00f7ff');
    })
    
    //submit
    function editProfile() {
    	if($('#nickEdit').val().trim() == "" || $('#nickEdit').val() == null) {
    		$('#nickEdit').val($('#nickEdit').attr('placeholder'))
    	} else {
    		if($('#chk').css('color') != 'rgb(255, 0, 191)') {
    			alert('중복 체크를 해주세요.')
    			return false;
    		}
    	}
    	if($('#bioEdit').val().trim() == "" || $('#bioEdit').val() == null) {
    		$('#bioEdit').val($('#bioEdit').attr('placeholder'))
    	}
    	if($('#editPhotoFile').val().trim() == "" || $('#editPhotoFile').val() == null) {
    		$('#imgChk').val(imgChk)
    	}
    	return true;
    }
</script>
</html>