<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
    <link rel="stylesheet" href="./resources/css/profileEdit.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
	<input type="hidden" value="true" id="editChk">
    <form id="editForm" action="profileUpdate" method="post" encType="multipart/form-data" onsubmit="return update()">
    	<input type="hidden" value="${profile.photo}" id="myPhoto" name="photo">
        <header id="back" class="theme">
            <span id="backBtn"><a href="profileShow" id="backLocation">&lang;</a></span>
            <div id="myProInfo">
                <span id="myNick">${profile.nickName}</span>
                <span class="myDetail">( </span>
                <span id="myId" class="myDetail">${profile.id}</span>
                <span class="myDetail"> )</span>
            </div>
        </header>
        <div id="myEdit">
            <div id="editTitle">
                <span>EDIT MY PROFILE</span>
            </div>
            <div id="editImg">
                <input type="button" value="REMOVE IMG" id="removeImg">
                <div id="editCircle">
                    <img id="editProImg">
                    <label for="proPhoto" id="photoLabel"></label>
                    <input type="file" id="proPhoto" name="proPhoto">
                </div>
            </div>
        </div>
        <div id="editNick" class="edit">
            <div id="editNickTitle" class="editTitle">
                <span>NICKNAME</span>
                <input type="button" id="editNickChk" value="CHECK">
            </div>
            <div id="editNickCont" class="editCont">
                <input type="text" name="nick" class="editItem" value="${profile.nickName}" placeholder="${profile.nickName}"  minlength="1" maxlength="8" pattern="^[ㄱ-ㅎ가-힣a-zA-Z\d_]+$" title="한글, 영어, 숫자, 언더바만 사용 가능합니다." id="editNickWord">
            </div>
        </div>
        <div id="editTel" class="edit">
            <div id="editTelTitle" class="editTitle">
                <span>TEL</span>
            </div>
            <div id="editTelCont" class="editCont">
                <input type="tel" name="tel" class="editItem" value="${profile.tel}" placeholder="${profile.tel}" maxlength="13" pattern="(010)-\d{4}-\d{4}" title="전화번호 형식으로 입력해주세요.">
            </div>
        </div>
        <div id="editBio" class="edit">
            <div id="editBioTitle" class="editTitle">
                <span>BIO</span>
            </div>
            <div id="editBioCont" class="editCont">
                <input type="text" name="bio" class="editItem" value="${profile.bio}" placeholder="${profile.bio}" maxlength="50">
            </div>
        </div>
        <div id="editPrivacy" class="edit">
            <div id="editPrivacyTitle" class="editTitle">
                <span>PRIVACY</span>
            </div>
            <div id="editPrivacyCont" class="editCont">
                <input type="radio" name="privacy" class="editPrivacyRadio" value="1"><span class="privacyWord">공개</span>
                <input type="radio" name="privacy" class="editPrivacyRadio" value="0" id="privacyNone"><span class="privacyWord">비공개</span>
            </div>
        </div>
        <div id="editComplete" class="edit">
            <input type="submit" value="EDIT" class="editComBtn">
            <input type="reset" value="CANCLE" class="editComBtn" id="cancleBtn">
        </div>
    </form>
</body>
<script>
    const img = document.querySelector('#editProImg');
    const file = document.querySelector('#proPhoto');
    const radio = document.querySelectorAll('.editPrivacyRadio');
    const word = document.querySelectorAll('.privacyWord');
    const base = document.querySelector('#removeImg');
    const photoValue = document.querySelector('#myPhoto').value;
    const photo = document.querySelector('#myPhoto');

    //form 초기화
    document.querySelector('#cancleBtn').addEventListener('click', () => {
        file.value = null;
        base.value = "REMOVE IMG";
        base.disabled = false;
        console.log(file.value)
        if(photo.value == "null") {
        	img.src = "./resources/img/프로필.png";
        } else {
        	img.src = "download?filename="+photo.value;
        }
    })

    //img 미리보기
    file.addEventListener('change', ()=> {
        base.value = "REMOVE IMG";
        base.disabled = false;
        const reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function() {
            img.src = reader.result;
        }
    })

    //라디오 체크 색 변경
    for(let i = 0; i < radio.length; i++) {
        radio[i].addEventListener('click', ()=> {
            word.forEach(e => {
                e.style.color = "white";
            });
            word[i].style.color = "#ff00bf";
        })
    }

    //기본프로필로 변경
    base.addEventListener('click', ()=> {
        file.value = null;
        base.value = "COMPLETE";
        img.src = "./resources/img/프로필.png"
        base.disabled = true;
    })

    //프로필 불러오기
    window.onload = function() {
        if(photo.value != null && photo.value != "") {
            img.src = "download?filename="+photo.value;
        } else {
            img.src = "./resources/img/프로필.png"
        }
        for(let i = 0; i < radio.length; i++) {
            if(radio[i].value == ${profile.privacy}) {
                radio[i].checked = true;
                word[i].style.color = "#ff00bf";
            }
        }
    }
    
    //submit을 위한 메서드
    function update() {
        const nickChk = document.querySelector('#editChk');
        if (nickChk.value == "true") {
            if ((file.value == null || file.value == "") && base.value != "COMPLETE") {
                document.querySelector('#myPhoto').value = photoValue;
            } else if (base.value == "COMPLETE") {
                document.querySelector('#myPhoto').value = "COMPLETE";
            }
            return true;
        } else {
        	alert("중복 체크를 해주세요.");
        }
        return false;
    }
    
    //닉네임 중복 체크
    $('#editNickChk').click(function() {
        if($('#editNickWord').val() == "${profile.nickName}") {
            alert('기존 NICK NAME과 동일합니다.');
        } else {
            $.ajax({
                url: "profileChk",
                method: "post",
                data: {nickName: $('#editNickWord').val()},
                success: function(result) {
                    if(result != "null") {
                        alert("확인되었습니다.");
                        $('#editChk').val("true");
                        $('#editNickChk').css("color", "#ff00bf")
                    } else {
                        alert("중복된 NICK NAME입니다.")
                        $('#editChk').val("false");
                    }
                },
                error: function() {
                	alert('잠시후 다시 시도해주세요.');
                }
            })
        }
    });
    
    //change 시 값 변경
    $('#editNickWord').change(function() {
        $('#editChk').val("false");
        $('#editNickChk').css("color", "#00f7ff");
        if($('#editNickWord').val() == "${profile.nickName}") {
            $('#editChk').val("true");
        }
    })
</script>
</html>