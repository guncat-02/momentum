<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User</title>
</head>
<link rel="stylesheet" href="/sns/resources/css/manageUser.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>

<body>
    <div id="manage-allGrid">
        <div id="manage-menu">
            <h2><a href="/sns/main">SNS</a></h2>
            <h2><a href="/sns/manager">DashBoard</a></h2>
            <h2><a href="/sns/manager/user/">User Info</a></h2>
            <h2><a href="#">Report Info</a></h2>
        </div>
        <form action="/sns/manager/search" method="get" onsubmit="return validation();">
            <div id="admin-grid-container">
                <div id="title">
                    <a href="/sns/manager/user/"><h1>User Info</h1></a>
                </div>
                <div id="admin-info">
                    <span id="cur-date-span"></span>
                    <span id="cur-adminId-span">Admin : ${curId }</span>
                </div>
                <div id="search-type">
                	<input type="hidden" name="searchArea" value="User">
                	<input type="hidden" name="searchLoc" value="">
                    <select id="searchType" name="searchType">
                        <option value="id" selected>user-Id</option>
                        <option value="cont">contents</option>
                        <option value="period">period</option>
                    </select>
                </div>
                <div id="search-cont">
                    <input type="text" id="searchWord" name="searchWord">
                    <input type="date" id="stDate" name="stDate">
                    <input type="date" id="ndDate" name="ndDate">
                    <button value="1" id="searchBtn">Search</button>
                </div>
                <div id="search-result">
                	<span id="result-span">총 조회 결과 : ${cnt }건.</span>
                </div>
                <div id="menu-user-member">
                    <button type="button" value="1" id="member-btn">MEMBER</button>
                </div>
                <div id="menu-user-profile">
                    <button type="button" value="1" id="profile-btn">PROFILE</button>
                </div>
                <div id="menu-user-post">
                    <button type="button" value="1" id="post-btn">POST</button>
                </div>
                <div id="menu-user-comm">
                    <button type="button" value="1" id="comm-btn">COMM</button>
                </div>
                <div id="menu-admin">
                    <button type="button" value="1" id="admin-btn">ADMIN</button>
                </div>
                <div id="menu-banned">
                    <button type="button" value="1" id="banned-btn">BANNED</button>
                </div>
                <div id="admin-table">
                    <table>
                    	<c:choose>
                    		<c:when test="${not empty users }">
		                        <thead>
		                            <tr>
		                                <th style="width: 20%">ID</th>
		                                <th style="width: 30%">EMAIL</th>
		                                <th style="width: 20%">PASSWORD</th>
		                                <th style="width: 10%">NAME</th>
		                                <th style="width: 20%">B_DATE</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        	<c:forEach items="${users }" var="one">
			                            <tr>
			                                <td>${one.id }</td>
			                                <td>${one.email }</td>
			                                <td>
			                                	<c:set var="pass" value="${one.pass }" />
			                                	<c:forEach begin="0" end="${pass.length() - 1 }" var="i">
			                                		<c:choose>
			                                			<c:when test="${i < 2 }">${pass.charAt(i) }</c:when>
			                                			<c:otherwise>*</c:otherwise>
			                                		</c:choose>
			                                	</c:forEach>
			                                </td>
			                                <td>${one.name }</td>
			                                <td class="tac">${one.b_date.split(' ')[0] }</td>
			                            </tr>
		                            </c:forEach>
		                        </tbody>
	                        </c:when>
	                        <c:when test="${not empty profiles }">
		                        <thead>
		                            <tr>
		                                <th>ID</th>
		                                <th>NICKNAME</th>
		                                <th>PHOTO</th>
		                                <th style="width: 15%">TEL</th>
		                                <th style="width: 35%">BIO</th>
		                                <th style="width: 5%;">PRIV.</th>
		                                <th style="width: 5%;">P_MAIN</th>
		                            </tr>
		                        </thead>
		                        <tbody>
			                        <c:forEach items="${profiles }" var="one">
			                            <tr>
			                                <td>${one.id }</td>
			                                <td>${one.nickName }</td>
			                                <td class="profile-photo-td">
			                                	<div>
				                                	<c:choose>
				                                		<c:when test="${not empty one.photo }">
				                                			<img src="/download?filename=${one.photo }">
				                                		</c:when>
				                                		<c:otherwise>
				                                			<img src="/sns/resources/img/프로필.png">
				                                		</c:otherwise>
				                                	</c:choose>
			                                	</div>
		                                	</td>
			                                <td class="tac">${one.tel }</td>
			                                <td>${one.bio }</td>
			                                <td class="tac">${one.privacy }</td>
			                                <td class="tac">${one.p_main }</td>
			                            </tr>
		                            </c:forEach>
		                        </tbody>
	                        </c:when>
	                        <c:when test="${not empty posts }">
		                        <thead>
		                            <tr>
		                                <th style="width: 5%;">NO</th>
		                                <th style="width: 5%;">RE_NO</th>
		                                <th style ="width: 10%">ID</th>
		                                <th style="width: 50%;">CONT</th>
		                                <th>SHOW</th>
		                                <th style="width: 5%;">PRIV.</th>
		                                <th style="width: 5%;">C_BLOCK</th>
		                                <th>P_DATE</th>
		                            </tr>
		                        </thead>
		                        <tbody>
			                        <c:forEach items="${posts }" var="one">
			                            <tr>
			                                <td class="tac">${one.no }</td>
			                                <td class="tac">
			                                	<c:if test="${one.re_no != 0 }">
			                                		${one.re_no }
			                                	</c:if>
			                                </td>
			                                <td>${one.id }</td>
			                                <td>${one.cont }</td>
			                                <td class="tac">${one.show }</td>
			                                <td class="tac">${one.privacy }</td>
			                                <td class="tac">${one.c_block }</td>
			                                <td class="tac">${one.p_date }</td>
			                            </tr>
		                            </c:forEach>
		                        </tbody>
	                        </c:when>
	                        <c:when test="${not empty comms }">
		                        <thead>
		                            <tr>
		                                <th style="width: 5%;">C_NO</th>
		                                <th style="width: 5%;">NO</th>
		                                <th style="width: 50%;">C_CONT</th>
		                                <th>ID</th>
		                                <th>C_DATE</th>
		                                <th style="width: 7%;">C_LIKE</th>
		                                <th style="width: 7%;">C_DISLIKE</th>
		                            </tr>
		                        </thead>
		                        <tbody>
			                        <c:forEach items="${comms }" var="one">
			                            <tr>
			                                <td class="tac">${one.c_no }</td>
			                                <td class="tac">${one.no }</td>
			                                <td>${one.c_cont }</td>
			                                <td>${one.id }</td>
			                                <td class="tac">${one.c_date }</td>
			                                <td class="tac">${one.c_like }</td>
			                                <td class="tac">${one.c_dislike }</td>                                
			                            </tr>
		                            </c:forEach>
		                        </tbody>
	                        </c:when>
                        </c:choose>
                    </table>
                </div>
                <div id="paging">
                	<c:if test="${pagevo.prev }">
                		<button type="button">[prev]</button>
					</c:if> 
					<c:forEach begin="${pagevo.startPage }" end="${pagevo.endPage }" var="idx">
						<c:choose>
							<c:when test="${idx == pagevo.page }">
								<!-- 현재 페이지 굵은 글씨 -->
								<button type="button"><b>${idx }</b></button>
							</c:when>
							<c:otherwise>
							<button type="button">${idx }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					<c:if test="${pagevo.next }">
						<button type="button">[next]</button>
					</c:if>
                </div>
                <div id="reset">
                	<button type="button"><a href="/sns/manager/user/">reset</a></button>
                </div>
                <div id="export-Excel">
                    <button type="button">export as Excel</button>
                </div>
            </div>
		</form>           
	</div>
</body>

<script>
	
	function validation() {
		let selected = $('#searchType').val();
		if (selected != 'period') {
			if ($.trim($('#searchWord').val()) == '') {
				alert('유효한 값을 입력하세요.');
				return false;
			} else {
				return true;
			}
		} else {
			if ($.trim($('#stDate').val()) == '' || $.trim($('#ndDate').val()) == '') {
				alert('유효한 값을 입력하세요.');
				return false;
			} else {
				return true;
			}
		}
	}

    $(document).ready(function () {
        connTime(); // 접속 시간 갱신
        // getResultCnt(); // 조회 튜플 개수 갱신
        
        let curList = '${pagevo.searchLoc}';
        $(`div[id$=\${curList}] button`).css('filter', 'invert(100%)');
        $('input[name=searchLoc]').val(curList);
       	let result = searchFlag();
       	searchTypeChange(); // 검색 타입 지정
       	searchPaging(result);
    });
    
    function searchFlag() {
    	let sType = '${pagevo.searchType}';
    	
    	if (sType.trim() != '') {
        	let sWord = '${pagevo.searchWord}';
        	let stDate = '${pagevo.stDate}';
        	let ndDate = '${pagevo.ndDate}';
    		$('option[value=id]').removeAttr('selected');
    		$(`option[value=${pagevo.searchType}]`).attr('selected', '');
        	if (sWord != null && stDate != null && ndDate != null) {
				$('#searchWord').val(sWord);
        		$('#stDate').val(stDate);
        		$('#ndDate').val(ndDate);
        	}
        	return {
        		'searchLoc' : '${pagevo.searchLoc}',
        		'sType' : sType,
        		'sWord' : sWord,
        		'stDate' : stDate,
        		'ndDate' : ndDate,
        	};
    	}
    	return null;
    }
    
    function searchPaging(result) {
		$('#paging').on('click', 'button', function() {
			let idx = $.trim($(this).text());
			let link;
			if (result != null) {
				link = `/sns/manager/search?searchArea=User&searchLoc=\${result.searchLoc}&searchType=\${result.sType}&searchWord=\${result.sWord}&stDate=\${result.stDate}&ndDate=\${result.ndDate}`
				if (idx  == '[prev]') {
					location.href = `\${link}&page=${pagevo.startPage -1}`;
				} else if (idx == '[next]') {
					location.href = `\${link}&page=${pagevo.endPage +1}`;				
				} else {
					location.href = `\${link}&page=\${idx}`;
				}
			} else {
				link = `/sns/manager/user/${pagevo.searchLoc}`;
				if (idx  == '[prev]') {
					location.href = `\${link}?page=${pagevo.startPage -1}`;
				} else if (idx == '[next]') {
					location.href = `\${link}?page=${pagevo.endPage +1}`;				
				} else {
					location.href = `\${link}?page=\${idx}`;
				}
			}

		});
    }
    
    
    // 선택한 검색 유형에 따라 검색어 input display 변환
    $('#searchType').on('change', function () { searchTypeChange(); });
    function searchTypeChange() {
        let selected = $('#searchType').val();        
        if (selected != 'period') { // userid, contents
            $('#searchWord').css('display', '');
            $('input[type=date]').css('display', 'none');
            $('input[type=date]').attr('disabled', '');
        } else { // period
            $('#searchWord').css('display', 'none');
            $('input[type=date]').css('display', '');
            $('#stDate').removeAttr('disabled');
        }
        limitAction(selected);
    }
    // 선택된 검색 유형에 따라 볼 수 있는 데이터 유형 제한.
    function limitAction(selected) {
    	$('div[id^=menu-] button').attr('disabled','');
    	$('div[id^=menu-] button').val(0);
    	if (selected == 'cont') {
    		$('#profile-btn').removeAttr('disabled');
    		$('#post-btn').removeAttr('disabled');
    		$('#comm-btn').removeAttr('disabled');
    		$('#profile-btn').val(1);
    		$('#post-btn').val(1);
    		$('#comm-btn').val(1);
    	} else if (selected == 'period') {
    		$('button:not([id^=profile-])').removeAttr('disabled');
    		$('button:not([id^=profile-])').val(1);
    	} else {
    		$('div[id^=menu-] button').removeAttr('disabled');
    		$('div[id^=menu-] button').val(1);
    	}
    	console.log($('button[value=0]').text().toLowerCase().indexOf('${pagevo.searchLoc}'));
    	if ($('button[value=0]').text().toLowerCase().indexOf('${pagevo.searchLoc}') != -1) {
    		$('#searchBtn').attr('disabled', '');
    		$('#searchBtn').val(0);
    	} else {
    		$('#searchBtn').removeAttr('disabled');
    		$('#searchBtn').val(1);
    	}
    }
    
    
    // 기간 검색에서, 첫번째 날짜 선택 시 두번째 날짜는 이후의 날짜만 선택 가능하도록 변경
    $('#stDate').on('change', function () {
        $('#ndDate').removeAttr('disabled');
        $('#ndDate').val('');
        $('#ndDate').attr('min', $(this).val());
    });
    
    // table 위 버튼 클릭 시 버튼 디자인 변경 및 table 영역 새로고침
    $('div[id^=menu-]').on('click', 'button', function() {
		updateTable($(this).text().toLowerCase());
    });
    
    // table 영역 새로고침 및 리턴 결과 개수 갱신
    function updateTable(flag) {
		let searchFlag = window.location.href;
		console.log(searchFlag);
		if (searchFlag.indexOf('search') == -1) {
			location.href = `/sns/manager/user/\${flag}`;
		} else {
			let sType = '${pagevo.searchType}';
        	let sWord = '${pagevo.searchWord}';
        	let stDate = '${pagevo.stDate}';
        	let ndDate = '${pagevo.ndDate}';
			location.href = `/sns/manager/search?searchArea=User&searchLoc=\${flag}&searchType=\${sType}&searchWord=\${sWord}&stDate=\${stDate}&ndDate=\${ndDate}`;
		}
    }
    

    // 페이지 새로고침 또는 접속한 시간 갱신 및 표시
    function connTime() {
		let dt = new Date();
    	let dtStr = `\${dt.getFullYear()}-\${dt.getMonth() + 1}-\${dt.getDate()} \${dt.getHours()}:\${dt.getMinutes()}:\${dt.getSeconds()}`;
    	$('#cur-date-span').text(dtStr);	
    }


    


    $('#export-Excel').on('click', function() {
    });
    
</script>
</html>