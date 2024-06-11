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

<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <div id="followList">
                <table>
                    <thead>
                        <tr>
                            <td colspan="2">
                                <label id="type-followings">
                                    <h3>FOLLOWINGS</h3>
                                    <!--내가 팔로우하는 사람 목록-->
                                </label>
                            </td>
                            <td colspan="2" width="50%">
                                <label style="color: grey" id="type-followers">
                                    <h3>FOLLOWERS</h3>
                                    <!--나를 팔로우하는 사람 목록-->
                                </label>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="followingsList">
                    	<c:forEach items="${followingsProfile }" var="prof">
	                        <tr>
	                            <td class="followList-photo">
	                                <div>
	                                	<c:choose>
	                                	<c:when test="${empty prof.photo}">
	                                		<img src="./resources/img/프로필.png">
	                                	</c:when>
	                                    <c:otherwise>
	                                    	<img src="download?filename=${prof.photo }">
                                    	</c:otherwise>
                                    	</c:choose>
	                                </div>
	                            </td>
	                            <td class="followList-nickname">
	                            	<input type="hidden" value="${prof.privacy}">
	                                ${prof.nickName }
	                            </td>
	                            <td class="followList-id">
	                                ${prof.id }
	                            </td>
	                            <td class="followList-btn">
	                                <button type="button" class="theme btn-followed" value="1">
	                                	<!--0: 언팔로우, 1: 팔로우-->
	                                    <b>FOLLOWING</b>
	                                </button>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                    <tbody id="allFollowersList" style="display: none;">
                    	<c:forEach items="${interFollowersProfile }" var="prof">
	                        <tr>
	                            <td class="followList-photo">
	                                <div>
	                                    <c:choose>
	                                	<c:when test="${empty prof.photo}">
	                                		<img src="./resources/img/프로필.png">
	                                	</c:when>
	                                    <c:otherwise>
	                                    	<img src="download?filename=${prof.photo }">
                                    	</c:otherwise>
                                    	</c:choose>
	                                </div>
	                            </td>
	                            <td class="followList-nickname">
	                                ${prof.nickName }
	                            </td>
	                            <td class="followList-id">
	                                ${prof.id }
	                            </td>
	                            <td class="followList-btn">
	                                <button type="button" class="theme btn-followed" value="1">
		                                <!--0: 언팔로우, 1: 팔로우-->
	                                    <b>FOLLOWING</b>
	                                </button>
	                            </td>
	                        </tr>
                        </c:forEach>
                        <c:forEach items="${followersProfile }" var="prof">
	                        <tr>
	                            <td class="followList-photo">
	                                <div>
	                                    <c:choose>
	                                	<c:when test="${empty prof.photo}">
	                                		<img src="./resources/img/프로필.png">
	                                	</c:when>
	                                    <c:otherwise>
	                                    	<img src="download?filename=${prof.photo }">
                                    	</c:otherwise>
                                    	</c:choose>
	                                </div>
	                            </td>
	                            <td class="followList-nickname">
	                                ${prof.nickName }
	                            </td>
	                            <td class="followList-id">
	                                ${prof.id }
	                            </td>
	                            <td class="followList-btn">
	                                <button type="button" class="theme btn-notFollowed" value="0">
		                                <!--0: 언팔로우, 1: 팔로우-->
	                                    <b>FOLLOW</b>
	                                </button>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

<script>

	// 화면 로딩 될 때 내가 팔로우 하지 않은 유저의 버튼 디자인 다르게
	$(document).ready(function() {
		let btn = $('.btn-notFollowed');
		btn.css('background-color', '#00f7ff');
        btn.css('color', '#000000');
	});
	
	// 내가 팔로우하는 유저 목록 볼 때 (FOLLOWINGS)
	$('#type-followings').on('click', function() {
		// 테이블 가장 위쪽 followings, followers 글씨 디자인 변경
		$('#type-followings').css('color', '');
		$('#type-followers').css('color', 'grey');
		// 테이블에 보여지는 유저 목록 변경
		$('#followingsList').css('display', '');
		$('#allFollowersList').css('display', 'none');
	});
	
	// 나를 팔로우하는 유저 목록 볼 때 (FOLLOWERS)
	$('#type-followers').on('click', function() {
		// 테이블 가장 위쪽 followings, followers 글씨 디자인 변경
		$('#type-followings').css('color', 'grey');
		$('#type-followers').css('color', '');
		// 테이블에 보여지는 유저 목록 변경
		$('#followingsList').css('display', 'none');
		$('#allFollowersList').css('display', '');
	});

	
	//버튼 클릭 시 언팔로우-팔로우 작업
	$('#followList').on('click', 'button', function () {
	    let btn = $(this);
	    // 서버 부하 방지 및 DB 작업의 정확도를 위해 누른 버튼의 마우스 이벤트 발생 차단
	    btn.css('pointer-events', 'none');
	    if (btn.val() == 0) { // (팔로우 취소 후 다시) 팔로우 할 때
	        follow(btn);
	    } else { // 팔로우 취소 할 때
			unfollow(btn);
	    }
	});
	function follow(btn) {
		// 버튼 값 변경
        btn.val(1);
    	// 버튼 디자인 변경
        btn.css('background-color', '');
        btn.css('color', '');
        btn.children('b').text('FOLLOWING');
        
        // ajax 통해 Request
	    $.ajax({
	        url: 'follow',
	        type: 'get',
	        data: {
	        	// id는 session에서 가져온다
	        	id: 'brian332',
	            followId: $.trim(btn.closest('tr').children('.followList-id').text())
	        },
	        success: function () {
	        	// 차단한 마우스 이벤트 재활성화
	        	btn.css('pointer-events', 'auto');
	        },
	        error: function () {
	        	alert('잠시 후 다시 시도해주세요.');
	        	// 버튼 값 되돌리기
	            btn.val(0);
	            // 버튼 디자인 되돌리기
	            btn.css('background-color', '#00f7ff');
	            btn.css('color', '#000000');
	            btn.children('b').text('FOLLOW');
	        }
	    });
	}
	function unfollow(btn) {
		
        btn.val(0);
        btn.css('background-color', '#00f7ff');
        btn.css('color', '#000000');
        btn.children('b').text('FOLLOW');
        
	    $.ajax({
	        url: 'unfollow',
	        type: 'get',
	        data: {
	        	// id는 session에서 가져온다
	        	id: 'brian332',
	        	followId: $.trim(btn.closest('tr').children('.followList-id').text())
	        },
	        success: function () {
	        	btn.css('pointer-events', 'auto');
	        },
	        error: function () {
	        	alert('잠시 후 다시 시도해주세요.');
	            btn.val(1);
	            btn.css('background-color', '');
	            btn.css('color', '');
	            btn.children('b').text('FOLLOWING');
	        }
	    });
	}
	
	
</script>
</html>