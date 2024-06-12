<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<link rel="stylesheet" href="./resources/css/profile.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<input type="hidden" id="chkSave" value="false">
    <form action="profileSave" method="post" onsubmit="return saveProfile()" encType="multipart/form-data">
        <div id="proAll">
            <span id="proTitle">CREATE YOUR PROFILE</span>
            <div id="profile">
                <div id="proLeft">
                    <div id="proPhoto">
                        <label for="file" id="fileSelect"><img src="./resources/img/프로필.png" id="profileImg" style="background-color: black;"></label>
                        <input type="file" name="myPhoto" id="file">
                    </div>
                    <span>* 메인 프로필을 설정하여 게시글을 등록할 수 있습니다.</span>
                    <P>* 프로필 사진 클릭 시 설정할 수 있습니다.</P>
                    <P>* USER NAME은 필수 입력입니다.</P>
                    <P>* 그 외 항목은 자유롭게 입력해주세요.</P>
                </div>
                <div id="proRight">
                    <table id="proTable">
                        <tr style="height: 10%;">
                            <th style="width: 40%;"><span style="color: #ff00bf;">♥ </span>NICK NAME</th>
                            <td><input type="text" id="profileNick" name="nickName" class="proText" minlength="1" maxlength="8" pattern="^[ㄱ-ㅎ가-힣a-zA-Z\d_]+$" title="한글, 영어, 숫자, 언더바만 사용 가능합니다." id="nameText"></td>
                            <td><input type="button" value="중복체크" id="nickNameChk"></td>
                        </tr>
                        <tr style="height: 10%;">
                            <th>TEL</th>
                            <td colspan="2"><input type="text" name="tel" class="proText" placeholder=" - 없이 입력하세요" maxlength="11" pattern="\d*" title="숫자만 입력하실 수 있습니다."></td>
                        </tr style="height: 10%;">
                        <tr>
                            <th>한 줄 소개</th>
                            <td colspan="2"><textarea name="bio" class="proText" maxlength="50" placeholder="50자 까지 입력 가능합니다."></textarea></td>
                        </tr>
                        <tr style="height: 10%;">
                            <th>공개 여부</th>
                            <td colspan="2">
                                <span class="radioWord">공개</span>
                                <input type="radio" name="privacy" value="1" class="proChk" required>
                                <span style="margin-left: 20px;" class="radioWord">비공개</span>
                                <input type="radio" name="privacy" value="0" class="proChk" required>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="profileSouth">
                <input type="submit" value="NEXT >" id="save">
            </div>
        </div>
    </form>
</body>
<script>
    const proRadio = document.querySelectorAll('.proChk');
    const word = document.querySelectorAll('.radioWord');
    const fileName = document.querySelector('#file');
    const img = document.querySelector('#profileImg');

    //라디오 선택 시 css 변경
    for(let i = 0; i < proRadio.length; i++) {
        proRadio[i].addEventListener('click', ()=> {
            word.forEach(e => {
                e.style.color = "white";
            });
            word[i].style.color = "#00f7ff";
        })
    }

    //사진 미리보기
    fileName.addEventListener('change', ()=> {
        const reader = new FileReader();
        reader.readAsDataURL(fileName.files[0]);
        reader.onload = function() {
            img.src = reader.result;
        }
    })

    //중복체크
    $("#nickNameChk").click(function () {
        if ($("#profileNick").val().trim() != "") {
            $.ajax({
                url: "/sns/profileChk",
                method: "post",
                data: { nickName: $("#profileNick").val() },
                success: function (result) {
                    if (result != "null") {
                        alert("확인되었습니다.");
                        $('#chkSave').val("true");
                    } else {
                        alert("중복된 아이디입니다.");
                        $('#chkSave').val("false");
                    }
                }
            })
        } else {
            alert("NICK NAME이 입력되지 않았습니다.");
        }
    })

    //nickname 값 변경 시 아이디 체크 다시 해야 하는 메서드
    $('#profileNick').change(function () {
        $('#chkSave').val(false);
    })

    //submit을 위한 메서드
    function save() {
        if ($("#chkSave").val().equals("false")) {
            alert("중복체크가 완료되지 않았습니다.");
            return false;
        }
        return true;
    }
</script>
</html>