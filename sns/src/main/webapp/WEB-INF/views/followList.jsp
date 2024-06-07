<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>momentum</title>
</head>
<link rel="stylesheet" href="./resources/css/followList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<input type="hidden" id="cur-theme" value="0">

<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <div id="followList">
                <table>
                	<%-- <c:forEach> --%>
	                    <tr>
	                        <td class="followList-photo">
	                            <div>
	                                <img src="../4297e3fa-661e-446c-81da-071cb32b8271.png">
	                            </div>
	                        </td>
	                        <td class="followList-username">
	                            <h2>CRAYON</h2>
	                        </td>
	                        <td class="followList-btn">
	                            <button type="button" class="following-btn theme">
	                                <b>FOLLOWING</b>
	                            </button>
	                            <input type="hidden" class="followed" value="1">
	                        </td>
	                    </tr>
                    <%-- </c:forEach> --%>
                </table>
            </div>
        </div>
    </div>
</body>

<script>

    // 버튼 클릭 시 팔로윙-팔로우 디자인 변경
    $('#followList').on('click', '.following-btn', function() {
        let btn = $(this);
        let followed = followSwitch(btn);
        let curBack = $('body').css('background-color');
        if (followed.val() == 0) {
            btn.css('background-color', '#00f7ff');
            btn.css('color', '#000000');
            btn.children('b').text('FOLLOW');
        } else {
            btn.css('background-color', '');
            btn.css('color', '');
            btn.children('b').text('FOLLOWING');
        }
    });

    // 버튼 눌러서 팔로우 취소, 등록 여부의 input:hidden value 변경
    function followSwitch(btn) { 
        let followed = btn.closest('.followList-btn').children('input[type=hidden]');
        if (followed.val() == 0) {
            followed.val(1);
        } else {
            followed.val(0);
        }
        return followed;
    }
</script>
</html>