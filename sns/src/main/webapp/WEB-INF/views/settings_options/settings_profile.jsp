<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
<style>
    #profile-info-table {
        display: block;
        width: auto;
        height: fit-content;
        border-radius: 15px;
        padding: 10px;
        border: 1px solid grey;
    }

    #profile-info-table table {
        width: 100%;
        height: fit-content;
        border-collapse: collapse;
    }


    #profile-info-table thead tr td {
        font-size: 25px;
        font-weight: bolder;
        padding-bottom: 30px;
    }

    #profile-info-table tr {
        height: 30px;
    }

    #profile-info-table .cont-title {
        font-size: 20px;
        padding-top: 15px;
    }

    .profile-info-btns {
        width: 15%;
    }

    .profile-info-btns button {
        width: 100%;
        height: 30px;
        border-radius: 8px;
        font-weight: bold;
    }

    .profile-info-btns button:hover {
        transition-duration: 250ms;
        filter: invert(100%);
        cursor: pointer;
    }
</style>

<body class="theme">
    <div id="profile-info-table">
        <table>
            <thead>
                <tr>
                    <td colspan="3">
                        프로필
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="3" class="cont-title">메인 프로필</td>
                </tr>
                <tr>
                    <td colspan="2">
                        메인 프로필은 SNS에서 사용됩니다.
                    </td>
                    <td class="profile-info-btns">
                        <button type="button" class="theme theme-border" id="upd-main-profile">프로필 수정</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="cont-title">팔로우 / 차단 관리</td>
                </tr>
                <tr>
                    <td colspan="2">
                        메인 프로필의 팔로우 및 차단 유저를 관리합니다.
                    </td>
                    <td class="profile-info-btns">
                        <button type="button" class="theme theme-border" id="follow-block-list">팔로우 / 차단</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="cont-title">
                        서브 프로필
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        서브 프로필들은 채팅에서 사용됩니다.
                    </td>
                    <td class="profile-info-btns">
                        <button type="button" class="theme theme-border" id="show-sub-profile">프로필 보기</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

<script>
    $('#upd-main-profile').on('click', function () {
        location.href = "/sns/profileEdit";
    });
    // 해당 프로필의 팔로우 및 차단 리스트
    $('#follow-block-list').on('click', function() {
        location.href = "/sns/list_fnb/";
    });
    // 해당 계정의 서브 프로필
    $('#show-sub-profile').on('click', function() {
        location.href = "#"
    });
</script>
</html>