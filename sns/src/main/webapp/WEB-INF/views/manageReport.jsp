<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
</head>
<link rel="stylesheet" href="/sns/resources/css/manageUser.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>

<body>
	<div id="manage-allGrid">
		<div id="manage-menu">
			<h2>
				<a href="/sns/main">SNS</a>
			</h2>
			<h2>
				<a href="/sns/manager">DashBoard</a>
			</h2>
			<h2>
				<a href="/sns/manager/user/">User Info</a>
			</h2>
			<h2>
				<a href="/sns/manager/report/">Report Info</a>
			</h2>
		</div>
		<div id="admin-grid-container">
			<div id="title">
				<a href="/sns/manager/user/"><h1>Report Info</h1></a>
			</div>
			<div id="admin-info">
				<span id="cur-date-span"></span> <span id="cur-adminId-span">Admin : ${curId }</span>
			</div>
			<!-- <div id="search-type">
                	<input type="hidden" name="searchArea" value="User">
                	<input type="hidden" name="searchLoc" value="">
                    <select id="searchType" name="searchType">
                        <option value="id" selected>user-Id</option>
                        <option value="cont">contents</option>
                        <option value="period">period</option>
                    </select>
                </div> -->
			<!-- <div id="search-cont">
                    <input type="text" id="searchWord" name="searchWord">
                    <input type="date" id="stDate" name="stDate">
                    <input type="date" id="ndDate" name="ndDate">
                    <button value="1" id="searchBtn">Search</button>
                </div> -->
			<!-- <div id="search-result">
                	<span id="result-span">총 조회 결과 : ${cnt }건.</span>
                </div>  -->
			<div id="menu-user-member">
				<button type="button" value="1" id="report-post-btn" onclick="report_post()">POST</button>
			</div>
			<div id="menu-user-profile">
				<button type="button" value="1" id="report-comm-btn" onclick="report_comm()">COMMENT</button>
			</div>
			<div id="menu-user-post">
				<button type="button" value="1" id="report-chat-btn" onclick="report_chat()">CHAT</button>
			</div>
			<div id="admin-table">


				<c:choose>
					<c:when test="${not empty report_post }">
						<table style="table-layout: fixed">
							<thead>
								<tr>
									<th style="width: 15%">글 작성자 ID</th>
									<th style="width: 15%">신고자 ID</th>
									<th style="width: 15%">신고일자</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고내용</th>
									<th style="width: 10%">정지</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${report_post }" var="one">
									<tr>
										<td style="width: 15%">${one.reportId }</td>
										<td style="width: 15%">${one.id }</td>
										<td class="tac" style="width: 15%">${one.r_date.split(' ')[0] }</td>
										<td style="width: 15%">${one.st_type }</td>
										<td style="width: 15%">${one.nd_type }</td>
										<td class="r_cont" style="width: 15%">${one.r_cont }</td>
										<td style="width: 10%"><input type="button" value="자세히보기" class="p_blockMember${one.no }" onclick="p_block(${one.no},'${one.nd_type }','${one.r_cont }')"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:when test="${not empty report_comm }">
						<table>
							<thead>
								<tr>
									<th style="width: 15%">글 작성자 ID</th>
									<th style="width: 15%">신고자 ID</th>
									<th style="width: 15%">신고일자</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고내용</th>
									<th style="width: 10%">정지</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${report_comm }" var="one">
									<tr>
										<td style="width: 15%">${one.reportId }</td>
										<td style="width: 15%">${one.id }</td>
										<td class="tac" style="width: 15%">${one.r_date.split(' ')[0] }</td>
										<td style="width: 15%">${one.st_type }</td>
										<td style="width: 15%">${one.nd_type }</td>
										<td class="r_cont" style="width: 15%">${one.r_cont }</td>
										<td style="width: 10%"><input type="button" value="자세히보기"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:when test="${not empty report_chat }">
						<table>
							<thead>
								<tr>
									<th style="width: 15%">글 작성자 ID</th>
									<th style="width: 15%">신고자 ID</th>
									<th style="width: 15%">신고일자</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고유형</th>
									<th style="width: 15%">신고내용</th>
									<th style="width: 10%">정지</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${report_chat }" var="one">
									<tr>
										<td style="width: 15%">${one.reportId }</td>
										<td style="width: 15%">${one.id }</td>
										<td class="tac" style="width: 15%">${one.r_date.split(' ')[0] }</td>
										<td style="width: 15%">${one.st_type }</td>
										<td style="width: 15%">${one.nd_type }</td>
										<td class="r_cont" style="width: 15%">${one.r_cont }</td>
										<td style="width: 10%"><input type="button" value="자세히보기"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
				</c:choose>

			</div>
			<div id="reset">
				<button type="button">
					<a href="/sns/manager/report/">reset</a>
				</button>
			</div>
		</div>
	</div>
	<div class="modal_block">
		<div class="modal_body_block">
			<svg class="closeModal" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="black" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
</svg>
			<div class="Commreport">
				<div class="reportdiv">정지</div>
				<div id="reported_post">
					<div class="one-post-container">
						<!-- 게시물 프로필 사진 -->
						<div class="one-post-photo">
							<div class="photo-div">
								<c:choose>
									<c:when test="${not empty proVO.photo}">
										<img src="/sns/download?filename=${proVO.photo}">
									</c:when>
									<c:otherwise>
										<img src="/sns/resources/img/프로필.png">
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<!-- 게시물 닉네임, 아이디 -->
						<div class="one-post-names">
							<span class="nickname-span">${proVO.nickName }</span> <span class="id-span">${proVO.id }</span>
						</div>

						<!-- 게시물 글 내용 -->
						<div class="one-post-cont">
							<span class="contents-span">${postvo.cont }</span>
							<textarea maxlength="100" class="edit-contents-textarea theme" required>${postvo.cont }</textarea>
						</div>

						<!-- 게시물 사진 -->
						<div class="one-post-attach">
							<c:if test="${not empty postvo.filename }">
								<div class="attach-div">
									<button class="arrow-left">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                    </svg>
									</button>
									<c:forEach items="${postvo.filename }" var="file">
										<img src="/sns/download?filename=${file}">
									</c:forEach>
									<button class="arrow-right">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                    </svg>
									</button>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="b_div">
					<div>
						<span>신고 유형 | &nbsp; </span><span class="b_type"></span>
					</div>
					<br>
					<div>
						<span>신고 내용 | &nbsp;</span><span class="b_cont"></span>
					</div>
					<div class="b_date_div">
						<label for="startDate">정지 시작 날짜:</label> <input type="date" id="startDate" name="s_Date"> <label for="endDate">정지 끝 날짜:</label> <input type="date" id="endDate" name="f_Date">
					</div>
				</div>
			</div>
			<div class="reportCommbut">
				<button type="submit" class="rcsubmit postcommbut">유죄</button>
				<button type="button" class="rcsubmit postcommbut">무죄</button>
			</div>
		</div>
	</div>
</body>

<script>
	

    $(document).ready(function () {
        connTime(); // 접속 시간 갱신
        // getResultCnt(); // 조회 튜플 개수 갱신
       
    });
    
    
    // table 위 버튼 클릭 시 버튼 디자인 변경 및 table 영역 새로고침
    function report_post() {
    	updateTable("report_post");
    }
	function report_comm() {
		updateTable("report_comm");
    }
	function report_chat() {
		updateTable("report_chat");
	}

    
    // search 없는 테이블 업데이트
    function updateTable(flag) {
		location.href = `/sns/manager/report/\${flag}`;

    }
    

    // 페이지 새로고침 또는 접속한 시간 갱신 및 표시
    function connTime() {
		let dt = new Date();
    	let dtStr = `\${dt.getFullYear()}-\${dt.getMonth() + 1}-\${dt.getDate()} \${dt.getHours()}:\${dt.getMinutes()}:\${dt.getSeconds()}`;
    	$('#cur-date-span').text(dtStr);	
    }

	function p_block(no,type,r_cont) {
		$(".modal_block").css("display","flex");
		let r_no = no;
		$.ajax({
	        url: 'getPostModal',
	        type: 'GET',
	        data: {
	            no: r_no
	        },
	        success: function(response) {
	        	console.log(response);
	            $('.reported_post').html(response); // 모달 내부의 특정 부분에 가져온 HTML 삽입
	            $(".modal_block").css("display","flex");
	            $(".b_type").text(type);
	    		$(".b_cont").text(r_cont);
	        },
	        error: function() {
	            alert('게시물 정보를 가져오는 중 오류가 발생했습니다.');
	        }
	    });
	}
    
	$(".closeModal").click(function() {
		$(".modal_block").css("display","none");
	});

    $('#export-Excel').on('click', function() {
    });
    
</script>
</html>