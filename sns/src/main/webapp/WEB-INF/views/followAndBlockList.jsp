<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%
String contextPath = request.getContextPath();
String id = (String)session.getAttribute("userid");
%>
<script src="/sns/resources/JS/setTheme.js"></script>
<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/followAndBlockList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<body class="theme">
    <span id="fnb-back-btn"><a href="/sns/main" class="theme">&lang; BACK</a></span>
    <h1>Follow and Blocked List</h1>
    <div id="fnbList">
        <table>
            <thead>
                <tr>
                    <td colspan="2">
                        <label id="type-followings">
                            FOLLOWINGS
                        </label>
                    </td>
                    <td colspan="2" style="width: calc(100% / 3);">
                        <label id="type-allFollowers">
                            FOLLOWERS
                        </label>
                    </td>
                    <td colspan="2" style="width: calc(100% / 3);">
                        <label id="type-blocked">
                            BLOCKED
                        </label>
                    </td>
                </tr>
            </thead>
	            <c:if test="${not empty followings }">
            <tbody id="followingsList">
	            	<c:forEach items="${followings }" var="fProf">
			                <tr>
			                    <td class="fnb-img-td">
			                        <div class="fnb-img-div">
			           					<c:choose>
				           					<c:when test="${empty fProf.photo}">
				                            	<img src="<%=contextPath%>/resources/img/프로필.png">
		                   					</c:when>
			                            	<c:otherwise>
			                            		<img src="/download?filename=${fProf.photo}">
			                           		</c:otherwise>
		                           		</c:choose> 
			                        </div>
			                    </td>
			                    <td colspan="4" class="fnb-username-td">
			                    	<c:if test="${fProf.privacy == 0 }">
			                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
		  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
										</svg>
									</c:if>
			                        <span class="fnb-nickname">${fProf.nickName}</span>
			                        (<span class="fnb-id">${fProf.id}</span>)
			                        <input type="hidden" name="privacy" class="priv" value="${fProf.privacy }">
			                    </td>
			                    <td class="fnb-btns-td">
			                        <button type="button" class="fnb-btn fnb-follow-btn theme" value="1">FOLLOWING</button>
			                    </td>
			                </tr>
	                </c:forEach>
            </tbody>
                </c:if>
	            <c:if test="${not empty interfollowers }">
            <tbody id="allFollowersList">
	            	<c:forEach items="${interfollowers }" var="fProf">
			                <tr>
			                    <td class="fnb-img-td">
			                        <div class="fnb-img-div">
			                  			<c:choose>
				                        	<c:when test="${empty fProf.photo}">
				                            	<img src="<%=contextPath%>/resources/img/프로필.png">
			                   				</c:when>
			                            	<c:otherwise>
			                            		<img src="/download?filename=${fProf.photo}">
			                           		</c:otherwise>
		                           		</c:choose>
			                        </div>
			                    </td>
			                    <td colspan="4" class="fnb-username-td">
			                    	<c:if test="${fProf.privacy == 0 }">
			                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
		  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
										</svg>
									</c:if>
			                        <span class="fnb-nickname">${fProf.nickName}</span>
			                        (<span class="fnb-id">${fProf.id}</span>)
			                        <input type="hidden" name="privacy" class="priv" value="${fProf.privacy }">
			                    </td>
			                    <td class="fnb-btns-td">
			                        <button type="button" class="fnb-btn fnb-follow-btn theme" value="1">FOLLOWING</button>
			                    </td>
			                </tr>
	                </c:forEach>
                </c:if>
                <c:if test="${not empty followers }">
	                <c:forEach items="${followers }" var="fProf">
			                <tr>
			                    <td class="fnb-img-td">
			                        <div class="fnb-img-div">
			                			<c:choose>
				                        	<c:when test="${empty fProf.photo}"> 
				                            	<img src="<%=contextPath%>/resources/img/프로필.png">
			                        		</c:when>
			                            	<c:otherwise>
			                            		<img src="/download?filename=${fProf.photo}">
			                           		</c:otherwise>
		                           		</c:choose> 
			                        </div>
			                    </td>
			                    <td colspan="4" class="fnb-username-td">
			                    	<c:if test="${fProf.privacy == 0 }">
			                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
		  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
										</svg>
									</c:if>
			                        <span class="fnb-nickname">${fProf.nickName}</span>
			                        (<span class="fnb-id">${fProf.id}</span>)
			                        <input type="hidden" name="privacy" class="priv" value="${fProf.privacy }">
			                    </td>
			                    <td class="fnb-btns-td">
			                        <button type="button" class="fnb-btn fnb-follow-btn theme" value="0">FOLLOW</button>
			                    </td>
			                </tr>
	                </c:forEach>
            </tbody>
                </c:if>
            	<c:if test="${not empty blocked }">
            <tbody id="blockedList">
	                <c:forEach items="${blocked }" var="bProf">
			                <tr>
			                    <td class="fnb-img-td">
			                        <div class="fnb-img-div">
			                			<c:choose>
				                        	<c:when test="${empty bProf.photo}"> 
				                            	<img src="<%=contextPath%>/resources/img/프로필.png">
			                        		</c:when>
			                            	<c:otherwise>
			                            		<img src="/download?filename=${bProf.photo}">
			                           		</c:otherwise>
		                           		</c:choose> 
			                        </div>
			                    </td>
			                    <td colspan="4" class="fnb-username-td">
			                    	<c:if test="${bProf.privacy == 0 }">
			                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
		  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
										</svg>
									</c:if>
			                        <span class="fnb-nickname">${bProf.nickName}</span>
			                        (<span class="fnb-id">${bProf.id}</span>)
			                        <input type="hidden" name="privacy" class="priv" value="${bProf.privacy }">
			                    </td>
			                    <td class="fnb-btns-td">
			                    	<!-- 0: 차단해제, 1: 차단 -->
			                        <button type="button" class="fnb-btn fnb-block-btn theme" value="1">BLOCKED</button>
			                    </td>
			                </tr>
	                </c:forEach>
            </tbody>
                </c:if>
        </table>
    </div>
</body>
<script>
	
	const curId = '<%=id %>';

    $(document).ready(function() {
        let url = window.location.href.split('/');
        let curList = $.trim(url[url.length-1]);
		
        $('label[id^=type-]').css('color', 'grey');
        if (curList != '') {
        	$(`label[id*=\${curList} i]`).css('color', '');
        } else {
        	$('#type-followings').css('color', '');
        }
    });

    // FOLLOWINGS FOLLOWERS BLOCKED 글자 누를 때 디자인 및 보이는 리스트 변화
    $('label[id^=type-]').on('click', function() {
        $('label[id^=type-]').css('color', 'grey');
        $(this).css('color', '');
        let curType = $.trim($(this).text().substring(5).toLowerCase());
        console.log(curType);
        location.href = `/sns/list_fnb/\${curType}`;
    });
    
    // FOLLOWING-FOLLOW 버튼 누를 때 디자인 변화
    $('tbody').on('click', '.fnb-btns-td .fnb-follow-btn', function() {
    	let btn = $(this);
    	btn.css('pointer-events', 'none');
    	let flag = followSwitch(btn);
    	if (flag == 0) {
    		followCancel(btn);
    	} else {
    		follow(btn);
    	}
    });
    function followSwitch(flag) {
    	if (flag.val() == 0) {
    		flag.val(1);
    		flag.text('FOLLOWING');
    	} else {
    		flag.val(0);
    		flag.text('FOLLOW');
    	}
    	return flag.val();
    }
    
    function follow(btn) {
    	
    	let fId = $.trim(btn.closest('tr').find('.fnb-id').text());
    	$.ajax({
    		url: '/sns/follow',
    		type: 'get',
    		data: {
    			id: curId,
    			followId: fId
    		},
    		success: function(result) {
    			console.log(result);
    			btn.css('pointer-events', 'auto');
    		},
    		error: function() {
    			alert('잠시 후 다시 시도해주세요.');
    			btn.val(0);
    			btn.text('FOLLOW');
    		}
    	});
    }
    function followCancel(btn) {
    	
    	let fId = $.trim(btn.closest('tr').find('.fnb-id').text());

    	$.ajax({
    		url: '/sns/followcancel',
    		type: 'get',
    		data: {
    			id: curId,
    			followId: fId
    		},
    		success: function(result) {
    			console.log(result);
    			btn.css('pointer-events', 'auto');
    		},
    		error: function() {
    			alert('잠시 후 다시 시도해주세요.');
    			btn.val(1);
    			btn.text('FOLLOWING');
    		}
    	});
    	
    }
    
    
    
    
    $('tbody').on('click', '.fnb-btns-td .fnb-block-btn', function() {
    	let btn = $(this);
    	btn.css('pointer-events', 'none');
    	let flag = blockSwitch(btn);
    	if (flag == 0) { // 차단 해제
    		blockCancel(btn);
    	} else { // 차단
    		block(btn);
    	}
    });
    function blockSwitch(flag) {
    	if (flag.val() == 0) {
    		flag.val(1);
    		flag.text('BLOCKED');
    	} else {
    		flag.val(0);
    		flag.text('UNBLOCKED');
    	}
    	return flag.val();
    }
    function block(btn) {
    	
    	let bId = $.trim(btn.closest('tr').find('.fnb-id').text());
    	let blockReason = prompt('차단 사유를 입력해주세요. 서비스 개선에 도움이 됩니다.', '');
    	
    	$.ajax({
    		url: '/sns/block',
    		type: 'get',
    		data: {
    			blockId: bId,
    			reason: blockReason
    		},
    		success: function() {
    			btn.css('pointer-events', 'auto');
    		},
    		error: function() {
    			alert('잠시 후 다시 시도해주세요.');
    			btn.val(0);
    		}
    	});
    }
    function blockCancel(btn) {
    	
    	let bId = $.trim(btn.closest('tr').find('.fnb-id').text());
    	
    	$.ajax({
    		url: '/sns/blockCancel',
    		type: 'get',
    		data: {
    			blockId: bId
    		},
    		success: function() {
    			btn.css('pointer-events', 'auto');
    		},
    		error: function() {
    			alert('잠시 후 다시 시도해주세요.');
    			btn.val(1);
    		}
    	});
    }
    
    
    
    
    

</script>
</html>