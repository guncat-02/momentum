<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>


<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body class="theme">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div class="myPost">
			<c:forEach items="${aList}" var="mp">
				<c:set var="filenameLength" value="${fn:length(mp.filename)}" />
				<div class="p_inf">
					<a href="userprofile?id=${mp.id}" class="userprofilealink">
						<div class="proimg">
							<img class="profileImg" src="./resources/img/프로필.png">
							<c:forEach items="${profilelist }" var="pr">
								<c:if test="${mp.id eq pr.id }">
									<img class="profileImg" src="download?filename=${pr.photo }">
								</c:if>
							</c:forEach>
						</div> <span class="p_id">${mp.id }</span>
					</a> <span class="p_date">${mp.p_date} </span>

				</div>

				<a href="myPost?no=${mp.no}" style="cursor: pointer;" class="p_alink" onclick="p_show(${mp.no})"> <!-- 프로필 아이디 -->
					<div class="p_cont theme">${mp.cont }</div> <c:choose>
						<c:when test="${filenameLength eq 0}">
							<div class="p_files" style="display: none">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 1}">
							<div class="p_files">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 2}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<div class="item" style="">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 3}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<c:choose>
										<c:when test="${status.index eq 0}">
											<div class="item" style="grid-row: 1/3">
												<img src="download?filename=${status.current}">
											</div>
										</c:when>
										<c:otherwise>
											<div class="item">
												<img src="download?filename=${status.current}">
											</div>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 4}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr;">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 5}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
								<c:forEach items="${mp.filename }" var="file" varStatus="status">
									<c:choose>
										<c:when test="${status.index eq 3}">
											<div class="item">
												<img src="download?filename=${status.current}">
												<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#ff00bf" class="bi bi-plus-circle" viewBox="0 0 16 16"> <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" /> <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /> </svg>
											</div>
										</c:when>
										<c:when test="${status.index eq 4}">
										</c:when>
										<c:otherwise>
											<div class="item">
												<img src="download?filename=${status.current}">
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</a>

				<input type="hidden" value="0" class="p_lovehid${mp.no}">
				<input type="hidden" value="${mp.no}" id="p_lovehid${mp.no}">
				<div class="mpfooter theme">
					<div>
						<button type="button" class="p_lovebut${mp.no } theme" onclick="p_love(${mp.no })">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" /> </svg>
						</button>
						<span class="footspan p_lovecnt${mp.no}">${mp.p_love}</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-right-dots-fill" viewBox="0 0 16 16"> <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353zM5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2" /> </svg>
						<span class="footspan">${mp.commCnt}</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16"> <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" /> </svg>
						<span class="footspan">${mp.reCnt}</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"> <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z" /> <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0" /> </svg>
						<span class="footspan">${mp.show}</span>
					</div>
				</div>
			</c:forEach>
		</div>




		<div class="footer"></div>
	</div>
</body>
<script>
	$(document).ready(function(){
		setting();
	})
	// 좋아요 누른거 확인
	function setting() {
		var uid = '<%=(String) session.getAttribute("userid")%>';
		// 좋아요 누른 댓글 확인 후 아이콘 변경
		$.ajax({
			type:"POST",
			url:"chklove",
			data: {"id" : uid},
			dataType : 'json',
			cache : false,
			success:function(data) {
				$.each(data, function(index, no) {
					console.log(no);
					if($("#p_lovehid"+no).val() == no ) {
						$(".p_lovehid"+no).val(1)
						$(".p_lovebut"+no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
						</svg>`);	
					}
				})
				},
		 });
	}
	// 게시물 좋아요 누르기
	function p_love(no) {
		let lovenum = $(".p_lovecnt"+no).text();
		if($(".p_lovehid"+no).val()== 0) {
			$(".p_lovehid"+no).val(1)
			$(".p_lovebut"+no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
					</svg>`)
			$(".p_lovecnt"+no).text(Number(lovenum)+1);	
			loveAjax(no);
		}else {
			$(".p_lovehid"+no).val(0)
			$(".p_lovecnt"+no).text(Number(lovenum)-1);
			$(".p_lovebut"+no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
					</svg>`)
					loveCancelAjax(no);
		}
		
	}
	// 좋아요 ajax
	function loveAjax(no) {
		$.ajax({
			type:"POST",
			url:"p_love",
			data: {"no" : no},
			success:function() {
				alert("성공")
			}
		})
	}
	// 좋아요 취소 ajax
	function loveCancelAjax(no) {
		$.ajax({
			type:"POST",
			url:"p_loveCancel",
			data: {"no" : no},
			success:function() {
				alert("성공")
			}
		})
	}
	
	// 게시물 조회수 +1 
	function p_show(no) {
		$.ajax({
			type:"GET",
			url:"p_show",
			data: {"no" : no},
			cache : false,
			success:function() {
				}
		 })  
	}

</script>
</html>