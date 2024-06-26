<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>momentum</title>
</head>
<link rel="stylesheet" href="/sns/resources/css/followList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<%
String curId = (String)session.getAttribute("userid");
pageContext.setAttribute("curId", curId);
%>
<body class="theme">
	<span id="followList-back-btn"><a href="/sns/main" class="theme">&lang; BACK</a></span>
    <h1>
    	<c:choose>
    		<c:when test="${curId eq reqId }">
    			My Follow List
    		</c:when>
    		<c:otherwise>
    			Follow List : ${reqId }
   			</c:otherwise>
    	</c:choose>
    </h1>
	<div id="followList">
		<table>
			<thead>
				<tr>
					<td colspan="2">
						<label id="type-followings">
								<h3>FOLLOWINGS</h3> <!--내가 팔로우하는 사람 보기-->
						</label>
					</td>
					<td colspan="2" width="50%">
						<label id="type-followers">
								<h3>FOLLOWERS</h3> <!--나를 팔로우하는 사람 보기-->
						</label>
					</td>
				</tr>
			</thead>
			<tbody id="followingsList">
				<c:if test="${not empty fList && not empty followFlag}">
					<c:set var="curIdList" value="${followFlag }" />
					<c:forEach items="${fList }" var="fProf">
						<tr>
							<td class="followList-photo">
								<div>
									<c:choose>
										<c:when test="${empty fProf.photo }">
											<img src="/sns/resources/img/프로필.png">
										</c:when>
										<c:otherwise>
											<img src="/download?filename=${fProf.photo }">
										</c:otherwise>
									</c:choose>
								</div>
							</td>
							<td class="followList-names" colspan="2">
								<input type="hidden" class="followList-privacy" value="${fProf.privacy}">
								<c:if test="${fProf.privacy == 0 }">
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
	  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
									</svg>
								</c:if>
								<span class="followList-nickname">${fProf.nickName}</span>
								(<span class="followList-id">${fProf.id }</span>)
							</td>
							<td class="followList-btn">
								<c:set var="proId" value="${fProf.id }" />
								<c:set var="containFlag" value="${fn:contains(curIdList, proId)}" />
								<c:if test="${proId ne curId }">
									<c:choose>
										<c:when test="${containFlag == true }">
											<button type="button" class="theme" value="1">
												<b>FOLLOWING</b>
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="theme" value="0">
												<b>FOLLOW</b>
											</button>
										</c:otherwise>
									</c:choose>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<button type="button">
							<a href="/sns/follow-new"><b>Find new Follow</b></a>
						</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
	
	const curId = '<%=curId %>';
	const reqId = '${reqId}';
	console.log(reqId);

	// 화면 로딩 될 때 식별자에 따라 리스트 다르게 띄운다.
	$(document).ready(function() {
		let url = window.location.href.split('/');
		let curList = $.trim(url[url.length - 1].split('?')[0]);
		$('label[id^=type-]').css('color', 'grey');
		if (curList != '') {
			$(`label[id*=\${curList} i]`).css('color', '');
		} else {
			$('#type-followings').css('color', '');
		}
	});

	$('label[id^=type-]').on('click', function() {
		$('label[id^=type-]').css('color', 'grey');
		$(this).css('color', '');
		let curType = $.trim($(this).text().substring(5).toLowerCase());
		location.href = `/sns/followList/\${curType}?id=\${reqId}`;
	});

	//버튼 클릭 시 언팔로우-팔로우 작업
	$('#followList').on('click', 'button', function() {
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

		let fPriv = btn.closest('tr').find('.followList-privacy').val();
		let fId = $.trim(btn.closest('tr').find('.followList-id').text());

		// ajax 통해 Request
		if (fPriv == 0) { // 비공개 계정일 때 팔로우 요청 (기능 구현 중)
			// 버튼 텍스트 변경
			btn.children('b').text('REQUESTED');
			$.ajax({
				url : '/sns/follow_request',
				type : 'get',
				data : {
					'id' : curId,
					'followId' : fId,
				},
				success : function() {
					// 차단한 마우스 이벤트 재활성화
					btn.css('pointer-events', 'auto');
				},
				error : function() {
					alert('잠시 후 다시 시도해주세요.');
					// 버튼 값 및 텍스트 되돌리기
					btn.val(0);
					btn.children('b').text('FOLLOW');
				}
			});
		} else { // 공개 계정일 때 즉시 팔로우
			//  버튼 텍스트 변경
			btn.children('b').text('FOLLOWING');
			$.ajax({
				url : '/sns/follow',
				type : 'get',
				data : {
					'id' : curId,
					'followId' : fId,
				},
				success : function(result) {
					if (result == 1) {
						btn.css('pointer-events', 'auto');		
						return;
					} else if (result == -1) {
						alert('차단한 유저는 팔로우 할 수 없습니다.\n차단 해제 후 다시 시도해주세요.');
					} else {
						alert('잠시 후 다시 시도해주세요.');
					}
					btn.val(0);
					btn.children('b').text('FOLLOW');
				},
				error : function() {
					alert('잠시 후 다시 시도해주세요.');
					btn.val(0);
					btn.children('b').text('FOLLOW');
				}
			});
		}

	}
	function followCancel(btn) {

		let fPriv = btn.closest('tr').find('.followList-privacy').val();
		let fId = $.trim(btn.closest('tr').find('.followList-id').text());
		let message = `다시 팔로우하려면 \${fId}에게 팔로우 요청을 다시 보내야 합니다.\n팔로우를 취소하시겠습니까?`;

		// 계정이 공개 상태이거나, 비공개 계정의 언팔로우에 동의 할 경우
		if ((fPriv == 0 && confirm(message)) || fPriv == 1) {
			btn.val(0);
			btn.children('b').text('FOLLOW');

			$.ajax({
				url : '/sns/followcancel',
				type : 'get',
				data : {
					'id' : curId,
					'followId' : fId
				},
				success : function(result) {
					btn.css('pointer-events', 'auto');
				},
				error : function() {
					alert('잠시 후 다시 시도해주세요.');
					btn.val(1);
					btn.children('b').text('FOLLOWING');
				}
			});
		}
	}
</script>
</html>