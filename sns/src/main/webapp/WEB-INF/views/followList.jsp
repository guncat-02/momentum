<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

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
                	<input type="hidden" id="listType">
                    <thead>
                        <tr>
                            <td colspan="2">
                                <label id="type-followings">
                                    <h3>FOLLOWINGS</h3>
                                    <!--내가 팔로우하는 사람 보기-->
                                </label>
                            </td>
                            <td colspan="2" width="50%">
                                <label style="color: grey" id="type-followers">
                                    <h3>FOLLOWERS</h3>
                                    <!--나를 팔로우하는 사람 보기-->
                                </label>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="followingsList">
                    	<!-- list 가져오는 부분 -->
                    </tbody>
                    <tbody id="allFollowersList" style="display: none;">
                    	<!-- list 가져오는 부분 -->
                    </tbody>
                    <tfoot>
                    	<tr>
                    		<td colspan="4">
		                    	<button type="button">
		                    		<a href="follow-new"><b>Find new Follow</b></a>
		                    	</button>
	                    	</td>
                    	</tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</body>

<script>

	// 화면 로딩 될 때 내가 팔로우하는 사람 목록 띄운다
	$(document).ready(function() {
		getFollowingsList();
	});
	
	// 내가 팔로우하는 유저 목록 볼 때 (FOLLOWINGS)
	$('#type-followings').on('click', function() {
		// 테이블 가장 위쪽 followings, followers 글씨 디자인 변경
		$('#type-followings').css('color', '');
		$('#type-followers').css('color', 'grey');
		// 테이블에 보여지는 유저 목록 변경
		$('#followingsList').css('display', '');
		$('#allFollowersList').css('display', 'none');
		getFollowingsList();
	});
	
	// 나를 팔로우하는 유저 목록 볼 때 (FOLLOWERS)
	$('#type-followers').on('click', function() {
		// 테이블 가장 위쪽 followings, followers 글씨 디자인 변경
		$('#type-followings').css('color', 'grey');
		$('#type-followers').css('color', '');
		// 테이블에 보여지는 유저 목록 변경
		$('#followingsList').css('display', 'none');
		$('#allFollowersList').css('display', '');
		getAllFollowersList();
	});

	
	//버튼 클릭 시 언팔로우-팔로우 작업
	$('#followList').on('click', 'button', function () {
	    let btn = $(this);
	    // 서버 부하 방지 및 DB 작업의 정확도를 위해 누른 버튼의 마우스 이벤트 발생 차단
	    btn.css('pointer-events', 'none');
	    if (btn.val() == 0) { // (팔로우 취소 후 다시) 팔로우 할 때
	        follow(btn);
	    } else { // 팔로우 취소 할 때
			followCancel(btn);
	    }
	});
	function follow(btn) {
		// 버튼 값 변경
        btn.val(1);
    	// 버튼 디자인 변경
        btn.css('background-color', '');
        btn.css('color', '');
        
        
        let fPriv = btn.closest('tr').find('.followList-privacy').val();
        let fId = $.trim(btn.closest('tr').find('.followList-id').text());
        
        // ajax 통해 Request
        if (fPriv == 0) { // 비공개 계정일 때 팔로우 요청 (기능 구현 중)
        	btn.children('b').text('REQUESTED');
        	$.ajax({
        		url: 'follow_request',
        		type: 'get',
        		data: {
    	        	// id는 session에서 가져온다
    	        	id: 'brian332',
    	            followId: fId.substring(1, fId.length-1)
    	        },
    	        success: function() {
    	        	
    	        },
    	        error: function() {
    	        	alert('잠시 후 다시 시도해주세요.');
    	        	// 버튼 값 되돌리기
    	            btn.val(0);
    	            // 버튼 디자인 되돌리기
    	            btn.css('background-color', '#00f7ff');
    	            btn.css('color', '#000000');
    	            btn.children('b').text('FOLLOW');
    	        }
        	});
        } else { // 공개 계정일 때 즉시 팔로우
        	btn.children('b').text('FOLLOWING');
        	$.ajax({
    	        url: 'follow',
    	        type: 'get',
    	        data: {
    	        	// id는 session에서 가져온다
    	        	id: 'brian332',
    	            followId: fId.substring(1, fId.length-1)
    	        },
    	        success: function (result) {
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
        
	    
	}
	function followCancel(btn) {
		
		let fPriv = btn.closest('tr').find('.followList-privacy').val();
        let fId = $.trim(btn.closest('tr').find('.followList-id').text());
		let message = `다시 팔로우하려면 \${fId.substring(1, fId.length-1)}에게 팔로우 요청을 다시 보내야 합니다.\n팔로우를 취소하시겠습니까?`;
		
		// 계정이 공개 상태이거나, 비공개 계정의 언팔로우에 동의 할 경우
		if((fPriv == 0 && confirm(message)) || fPriv == 1) {
			btn.val(0);
	        btn.css('background-color', '#00f7ff');
	        btn.css('color', '#000000');
	        btn.children('b').text('FOLLOW');
	        
		    $.ajax({
		        url: 'followcancel',
		        type: 'get',
		        data: {
		        	// id는 session에서 가져온다
		        	id: 'brian332',
		        	followId: fId.substring(1, fId.length-1)
		        },
		        success: function (result) {
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
	}
	
	// 내가 팔로우하는 id 목록 출력
	function getFollowingsList() {
		$('#followingsList tr').remove();
		$.ajax({
			url: 'follow_followings',
			type: 'get',
			data: {id : 'brian332'},
			success: function(result) {
				let newFollowing;
		    	let userPhoto;
		    	for (let f of result) {
		    		if (f.photo == null) {
		    			userPhoto = `<img src="./resources/img/프로필.png">`
		    		} else {
		    			userPhoto = `<img src="download?filename=\${f.photo}">`
		    		}
		    		newFollowing = `<tr>
		        		<td class="followList-photo">
		        		<div>
		        			\${userPhoto}
		        		</div>
		        	</td>
		        	<td class="followList-names" colspan="2">
		        		<input type="hidden" class="followList-privacy" value="\${f.privacy}">
		      			<span class="followList-nickname">\${f.nickName}</span>
		      			<span class="followList-id">(\${f.id })</span>
		        	</td>
		        	<td class="followList-btn">
		        		<button type="button" class="theme" value="1">
		        			<b>FOLLOWING</b>
		        		</button>
		        	</td>
		        </tr>`
		        	$('#followingsList').append(newFollowing);
		    	}
			},
			error: function() {
				alert('잠시 후 다시 시도해주세요.');
			}
		});
	}

	// 나를 팔로우하는 모든 id 출력
	function getAllFollowersList() {
		$('#allFollowersList tr').remove();
		
		// 나를 팔로우하는 id를 나도 팔로우하는 경우
		$.ajax({
			url: 'follow_interfollowers',
			type: 'get',
			data: {id : 'brian332'},
			success: function(result) {
				let newFollower;
		    	let userPhoto;
		    	for (let f of result) {
		    		if (f.photo == null) {
		    			userPhoto = `<img src="./resources/img/프로필.png">`
		    		} else {
		    			userPhoto = `<img src="download?filename=\${f.photo}">`
		    		}
		    		newFollower = `<tr>
		        		<td class="followList-photo">
		        		<div>
		        			\${userPhoto}
		        		</div>
		        	</td>
		        	<td class="followList-names" colspan="2">
		        		<input type="hidden" class="followList-privacy" value="\${f.privacy}">
		      			<span class="followList-nickname">\${f.nickName}</span>
		      			<span class="followList-id">(\${f.id })</span>
		        	</td>
		        	<td class="followList-btn">
		        		<button type="button" class="theme" value="1">
		        			<b>FOLLOWING</b>
		        		</button>
		        	</td>
		        </tr>`
		        	$('#allFollowersList').append(newFollower);
		    	}
			},
			error: function() {
				alert('잠시 후 다시 시도해주세요.');
			}
		});
		
		// 나를 팔로우하는 id를 나는 팔로우하지 않는 경우
		$.ajax({
			url: 'follow_followers',
			type: 'get',
			data: {id : 'brian332'},
			success: function(result) {
				let newFollower;
		    	let userPhoto;
		    	for (let f of result) {
		    		if (f.photo == null) {
		    			userPhoto = `<img src="./resources/img/프로필.png">`
		    		} else {
		    			userPhoto = `<img src="download?filename=\${f.photo}">`
		    		}
		    		newFollower = `<tr>
		        		<td class="followList-photo">
		        		<div>
		        			\${userPhoto}
		        		</div>
		        	</td>
		        	<td class="followList-names" colspan="2">
		        		<input type="hidden" class="followList-privacy" value="\${f.privacy}">
		      			<span class="followList-nickname">\${f.nickName}</span>
		      			<span class="followList-id">(\${f.id })</span>
		        	</td>
		        	<td class="followList-btn">
		        		<button type="button" class="theme btn-notFollowed" value="0">
		        			<b>FOLLOW</b>
		        		</button>
		        	</td>
		        </tr>`
		        	$('#allFollowersList').append(newFollower);
		    	}
		    	// 내가 팔로우하지 않는 경우의 버튼 디자인 변경
		    	let btn = $('.btn-notFollowed');
				btn.css('background-color', '#00f7ff');
				btn.css('color', '#000000');
			},
			error: function() {
				alert('잠시 후 다시 시도해주세요.');
			}
		});
	}
	
	
</script>
</html>