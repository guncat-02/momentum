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

        </div>
        <form>
            <div id="admin-grid-container">
                <div id="title">
                    <a href="/sns/manager/user/"><h1>User Info</h1></a>
                </div>
                <div id="admin-info">
                    <span id="cur-date-span"></span>
                    <span id="cur-adminId-span">Admin : ${curId }</span>
                </div>
                <div id="search-type">
                    <select name="searchType" id="sType">
                        <option value="id">user-Id</option>
                        <option value="cont">contents</option>
                        <option value="period">period</option>
                    </select>
                </div>
                <div id="search-cont">
                    <input type="text" name="searchWord" id="sWordText">
                    <input type="date" name="stDate" id="sDateFirst">
                    <input type="date" name="ndDate" id="sDateSecond">
                    <input type="button" value="search" id="searchBtn">
                </div>
                <div id="search-result">
                	<span id="result-span"></span>
                </div>
                <div id="menu-user">
                    <button type="button" value="member">MEMBER</button>
                </div>
                <div id="menu-user-profile">
                    <button type="button" value="profile">PROFILE</button>
                </div>
                <div id="menu-user-post">
                    <button type="button" value="post">POST</button>
                </div>
                <div id="menu-user-comm">
                    <button type="button" value="comm">COMM</button>
                </div>
                <div id="menu-admin">
                    <button type="button" value="admin">ADMIN</button>
                </div>
                <div id="menu-banned">
                    <button type="button" value="banned">BANNED</button>
                </div>
                <div id="admin-table">
                    <table>
                    	<c:choose>
                    		<c:when test="${not empty users }">
		                        <thead>
		                            <tr>
		                                <th style="width: 20%">ID</th>
		                                <th>EMAIL</th>
		                                <th>PASSWORD</th>
		                                <th>NAME</th>
		                                <th>B_DATE</th>
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
			                                			<c:when test="${i < 2 }">${pass.charAt(i) }</c:when><c:otherwise>*</c:otherwise>
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
				                                			<img src="download?filename=${one.photo }">
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
                <div id="reset">
                    <input type="reset" value="reset">
                </div>
                <div id="export-Excel">
                    <button type="button">export as Excel</button>
                </div>
            </div>
        </form>
	</div>
</body>

<script>
	
   
    $(document).ready(function () {
        connTime();
        initialization();
        getResultCnt();
		let url = window.location.href.split('/');
		let curList = $.trim(url[url.length-1].split('?')[0]);
		if (curList == 'user' || curList == '') { curList = 'member'; }
        $(`button[value=\${curList}]`).css('filter', 'invert(100%)');
    });
    
    $('#searchBtn').on('click', function() {
    	let flag = $(this);
    	$.ajax({
    		url: '/sns/manager/search',
    		type: 'get',
    		data: {
    			searchType: $('#sType').val(),
    			searchWord: $('#sWordText').val(),
    			stDate: $('#sDateFirst').val(),
    			ndDate: $('#sDateSecond').val(),
    			searchArea: 'User'
    		},
    		success: function() {
    			alert('s');
    		},
    		error: function() {
    			alert('e');
    		}
    	});
    });
    
    function updateTable(flag) {
    	$('#admin-table').load(`/sns/manager/user/\${flag}` + " #admin-table table", function() {
    		getResultCnt();
    	});
    }
    
    function getResultCnt() {
    	let cnt = $('#admin-table tbody tr').length;
    	$('#result-span').text(`조회 결과 : \${cnt}건.`);
    }
    
    function connTime() {
		let dt = new Date();
    	let dtStr = `\${dt.getFullYear()}-\${dt.getMonth() + 1}-\${dt.getDate()} \${dt.getHours()}:\${dt.getMinutes()}:\${dt.getSeconds()}`;
    	$('#cur-date-span').text(dtStr);	
    }
    
    
    $('#reset').on('click', function () { initialization(); });
    function initialization() {
        $('input[type=text]').css('display', '');
        $('input[type=date]').css('display', 'none');
        $('input[name=ndDate]').attr('disabled', '');
    }
    
    $('#export-Excel').on('click', function() {
    });
    
    
    $('#sType').on('change', function () {
        let selected = $(this).val();
        if (selected != 'period') {
            $('#sWordText').css('display', '');
            $('input[type=date]').css('display', 'none');
        } else {
            $('#sWordText').css('display', 'none');
            $('input[type=date]').css('display', '');
        }
    });
    $('input[name=stDate]').on('change', function () {
        $('input[name=ndDate]').removeAttr('disabled');
        $('input[name=ndDate]').attr('min', $(this).val());
    });
    $('div[id^=menu-]').on('click', 'button', function() {
    	$('div[id^=menu] button').css('filter', '');
    	let flag = $(this);
    	flag.css('filter', 'invert(100%)');
    	connTime();   
		updateTable(flag.val());
    });

</script>
</html>