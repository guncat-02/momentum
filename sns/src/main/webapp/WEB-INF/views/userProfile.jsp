<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./css/dark_theme.css">
    <link rel="stylesheet" href="./resources/css/userProfile.css">
    <link rel="stylesheet" href="./resources/css/profileShow.css">
</head>
<body class="theme">
    <input type="hidden" value="download?filename=${profile.photo}" id="photo">
    <div id="back" class="theme">
        <span id="backBtn"><a href="main">&lang;</a></span>
        <div id="myProInfo">
            <span id="myNick">guncat</span>
            <span class="myDetail">( </span>
            <span id="myId" class="myDetail">nuit0204</span>
            <span class="myDetail"> )</span>
        </div>
    </div>
    <div id="userFollowBtn">
        <input type="button" id="userFollow" value="FOLLOW">
    </div>
    <div id="myProfile">
        <div id="myImg">
            <div id="myImgCircle">
                <img id="proImg" src="./img/20230515_200604.jpg">
            </div>
        </div>
        <div id="myInfo">
            <div id="myFollow">
                <table>
                    <tr>
                        <th style="width: calc(100% / 3);">게시물</th>
                        <th style="width: calc(100% / 3);"><a href="#">FOLLOWING</a></th>
                        <th style="width: calc(100% / 3);"><a href="#">FOLLOWER</a></th>
                    </tr>
                    <tr>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
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
        <input type="button" class="myMenuItem theme" value="POST">
        <input type="button" class="myMenuItem theme" value="REPOST">
        <input type="button" class="myMenuItem theme" value="COMMENT">
        <input type="button" class="myMenuItem theme" value="MEDIA">
        <input type="button" class="myMenuItem theme" value="LOVE">
    </div>
</body>
<script>
    //프로필 불러오기
    window.onload = function() {
        const img = document.querySelector('#proImg')
        const photo = document.querySelector('#photo');
        if(photo.value != null) {
            img.src = "download?filename="+photo.value;
        } else if(photo.value == null) {
            img.src = "./resources/img/프로필.png"
        }
    }
</script>
</html>