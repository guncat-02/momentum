<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");
String curId = (String)session.getAttribute("userid");
// JSTL에서 세션 아이디 사용 할 수 있도록 하는 코드.
pageContext.setAttribute("curId", curId);
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
<body class="theme theme-scroll">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div id="main">
		<div class="myPost">
			<c:forEach items="${aList}" var="mp">
				<c:set var="filenameLength" value="${fn:length(mp.fileName)}" />
				<div class="p_inf">
				<input type = "hidden" value="${mp.id }">
					<a href="userprofile?id=${mp.id}" class="userprofilealink">
						<div class="proimg">
							<c:choose>
								<c:when test="${not empty mp.photo }">
									<img class="profileImg" src="download?filename=${mp.photo }">
								</c:when>
								<c:otherwise>
									<img class="profileImg" src="./resources/img/프로필.png">		
								</c:otherwise>
							</c:choose>
						</div> 
					</a>
						<span class="p_id">${mp.id }</span>

					<span class="p_date">${mp.p_date} </span>
					<!-- 해당 게시물 게시 유저를 내가 팔로우 하고 있는 지 여부 true, false -->
					<c:if test="${mp.id ne curId}">
						<c:set var="containFlag" value="${fn:contains(fList, mp.id) }" />
						<c:if test="${containFlag == false }">
							<button type="button" class="theme main-po-follow-btn" value="0">FOLLOW</button>
						</c:if>
					</c:if>
				</div>

				<a href="myPost?no=${mp.no}" style="cursor: pointer;" class="p_alink" onclick="p_show(${mp.no})"> <!-- 프로필 아이디 -->
					<div class="p_cont theme">${mp.cont }</div> <c:choose>
						<c:when test="${filenameLength eq 0}">
							<div class="p_files" style="display: none">
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 1}">
							<div class="p_files">
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 2}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr">
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
									<div class="item" style="">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 3}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
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
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
									<div class="item">
										<img src="download?filename=${status.current}">
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${filenameLength eq 5}">
							<div class="p_files" style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
								<c:forEach items="${mp.fileName }" var="file" varStatus="status">
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
								
				<c:if test="${mp.re_no != 0 }">
					<span class="reposted-mark-span">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                   			<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" />
               			</svg> REPOSTED
					</span>
					<div class="repost-container theme">
						<input type="hidden" value="${mp.re_no }">
						<c:set var="repFlag" value="false" />
						<c:forEach items="${repList }" var="repost">
							<c:if test="${not repFlag }">
								<c:if test="${repost.no == mp.re_no }">
									<c:set var="repFlag" value="true" />
									<div class="repost-attach-div">
										<c:if test="${not empty repost.fileName}">
											<div class="repost-attach-img-div">
												<img src="download?filename=${repost.fileName[0] }">
											</div>
										</c:if>
									</div>					
									<div class="repost-profile-div">
										<c:set var="flag" value="false" />
										<c:forEach items="${reproList }" var="reprof">
											<c:if test="${not flag }">
												<c:if test="${repost.id eq reprof.id }">
													<div class="repost-profile-img-div">
														<c:choose>
															<c:when test="${not empty reprof.photo }">
																<img src="download?filename=${reprof.photo }">
															</c:when>
															<c:otherwise>
																<img src="/sns/resources/img/프로필.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="repost-names-div">
														<input type="hidden" value="${reprof.id }">
														<span class="repost-nickname-span">${reprof.nickName }</span>
													</div>																							
													<c:set var="flag" value="true" /> 
												</c:if>
											</c:if>
										</c:forEach>
									</div>
									<div class="repost-cont-div">
										<span class="repost-cont-span">
											${repost.cont }
										</span>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</c:if>

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
						<button type="button" class="p_repostbut theme" onclick="repost(${mp.no})">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16"> <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" /> </svg>
							<span class="footspan">${mp.reCnt}</span>
						</button>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
		                    <path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1M8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5 5 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.6 2.6 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046zm2.094 2.025" />
		                </svg> <span class="show-cnt-span">
						<span class="footspan">${mp.shows}</span>
					</div>
				</div>
			</c:forEach>
		</div>




		<div class="footer"></div>
		</div>
	</div>
</body>
<script>
	
	$('body').on('click', '.repost-attach-div, .repost-cont-div', function() {		
		let no = $(this).closest('.repost-container').find('input[type="hidden"]').val();
		location.href = `/sns/myPost?no=\${no}`;
	});
	
	$('body').on('click', '.repost-profile-div', function() {
		let id = $(this).find('input[type="hidden"]').val();
		location.href = `/sns/userprofile?id=\${id}`;
	});
	


	$(document).ready(function(){
		setting();
		// 리포스트 된 이미지 css 조정
		adjustRepostImgs();
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
					if($("#p_lovehid"+no).val() == no ) {
						$(".p_lovehid"+no).val(1)
						$(".p_lovebut"+no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
						</svg>`);	
					}
				})
			}
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
			data: {"no" : no}
		})
	}
	// 좋아요 취소 ajax
	function loveCancelAjax(no) {
		$.ajax({
			type:"POST",
			url:"p_loveCancel",
			data: {"no" : no}
		})
	}
	
	// 게시물 조회수 +1 
	function p_show(no) {
		$.ajax({
			type:"GET",
			url:"p_show",
			data: {"no" : no},
			cache : false
		})  
	}
	function repost(no) {
		location.href = `/sns/reposting?no=\${no}`;
	}
   	
    
    // 팔로우 한 사람 있는 여부 true/false
    let fListFlag = ${fListFlag};
    // 로그인 유저의 팔로우 유저가 작성한 게시물 다음 페이지 시작 번호.
    let curFollowPage = 10;
    // 추천 게시물 시작 번호
    let curRecomPage = 0;
    // 이미 로딩된 기존 컨텐츠
    let prevCont;
	function scrollEventHandler() {
		if ((window.scrollY + window.innerHeight)/document.body.clientHeight > 0.8) { // 마지막까지 스크롤 했을 때.
        	// 이벤트 지워준다.
        	/* $('body').off('mousewheel.paging'); */
        	document.removeEventListener('scroll', scrollEventHandler);
        	// 이미 로딩된 기존 컨텐츠의 html 객체 저장.
    		prevCont = $('.myPost').html();
        	console.log(fListFlag);
       		// 게시물 로딩되는 부분 새로 고침.
       		if (fListFlag) { // 팔로우 한 유저의 최근 게시물이 남아 있거나, 팔로우한 유저가 있을 경우
           		$('#main').load(`newFollowingPost?pageNo=\${curFollowPage} .myPost`, function() {
           			// 새로 고침 성공 시 실행.
           			console.log($('.p_inf').length);
           			if ($('.p_inf').length == 0) { // 새롭게 로딩된 게시물 없었을 경우
           				fListFlag = false;
           			}
       				// 다음 페이지 시작 번호 갱신.
           			curFollowPage += 10;
        			// 리포스트 된 이미지 css 조정
        			adjustRepostImgs();
           			// 기존 게시물을 새로 로딩된 게시물 위에 추가.
           			$('.myPost').prepend(prevCont);
           			// 제거했던 이벤트 다시 생성.
           			document.addEventListener('scroll', scrollEventHandler);
           		});
       		} else { // 팔로우 한 유저의 최근 게시물을 전부 출력 했거나, 팔로우한 유저가 없을 경우
       			$('#main').load(`newRecomPost?pageNo=\${curRecomPage} .myPost`, function() {
           			// 새로 고침 성공 시 실행.
           			console.log($('.p_inf').length);
           			if ($('.p_inf').length != 0) { // 새로운 게시물이 로딩될 때
           				// 리포스트 된 이미지 css 조정
           				adjustRepostImgs();
               			// 다음 페이지 시작 번호 갱신.
               			curRecomPage += 10;
               			// 제거했던 이벤트 다시 생성.
               			document.addEventListener('scroll', scrollEventHandler);
           			}
           			// 기존 게시물을 새로 로딩된 게시물 위에 추가.
           			$('.myPost').prepend(prevCont);
           		});
       		}
       		// 두 경우 모두에 속하지 않는 경우 스크롤 페이징 중단.
        }
	}
	document.addEventListener('scroll', scrollEventHandler);
    
	// 현재 세션 로그인 아이디. 현 페이지 최상단에 변수 추가.
	let curId = "${curId}";
    // 게시자 아이디 옆 follow-following 버튼 클릭 시
    $('body').on('click', '.main-po-follow-btn', function() {
    	let btn = $(this);
    	btn.css('pointer-events', 'none');
    	if (btn.val() == 0) {
    		follow(btn);
    	} else {
    		followCancel(btn);
    	}
    });
    function follow(btn) {
		btn.val(1);
		btn.text('FOLLOWING');

		
		let fId = $.trim(btn.prevAll('input[type="hidden"]').val());
		
		$.ajax({
			url : '/sns/follow',
			type : 'get',
			data : {
				'id' : curId,
				'followId' : fId,
			},
			success : function(result) {
				if (result == 1) { // 팔로우 성공 시
					btn.css('pointer-events', 'auto');
					$('#menuall').load('<c:url value="menuReload" />');
					adjustFollowBtn(btn.val(), fId);
					return;
				} else if (result == -1) { // 차단 유저 팔로우 시
					alert('차단한 유저는 팔로우 할 수 없습니다.\n차단 해제 후 다시 시도해주세요.');
				} else { // 이 외 오류 발생 시
					alert('잠시 후 다시 시도해주세요.');
				}
				btn.val(0);
				btn.text('FOLLOW');
			},
			error : function() {
				alert('잠시 후 다시 시도해주세요.');
				btn.val(0);
				btn.text('FOLLOW');
			}
		});
	}
	function followCancel(btn) {
		btn.val(0);
		btn.text('FOLLOW');
		
		
		let fId = $.trim(btn.prevAll('input[type="hidden"]').val());
		
		$.ajax({
			url : '/sns/followcancel',
			type : 'get',
			data : {
				'id' : curId,
				'followId' : fId
			},
			success : function(result) {
				btn.css('pointer-events', 'auto');
				$('#menuall').load('<c:url value="menuReload" />');
				adjustFollowBtn(btn.val(), fId);
			},
			error : function() {
				alert('잠시 후 다시 시도해주세요.');
				btn.val(1);
				btn.text('FOLLOWING');
			}
		});
	}
	function adjustFollowBtn(btnVal, fId) {
		let allPosts = $('.p_inf');
		let pId;
		$.each(allPosts, function(idx) {
			pId = $.trim(allPosts.eq(idx).find('input[type="hidden"]').val());
			if (pId == fId) {
				let curBtn = allPosts.eq(idx).find('.main-po-follow-btn')
				if (btnVal == 0) { // 팔로우 취소 한 뒤
					curBtn.val(0);
					curBtn.text('FOLLOW');
				} else { // 팔로우 한 뒤
					curBtn.val(1);
					curBtn.text('FOLLOWING');
				}
			}
		});
	}
	
	//게시물 사진 css 적용
	function adjustRepostImgs() {
		let allImg = $('.repost-attach-img-div img');
	    if (allImg.length != 0) {
	        for (let one of allImg) {
	            let imgObj = new Image();
	            imgObj.src = one.getAttribute('src');
	            imgObj.onload = function() {
	                let width = this.width;
	                let height = this.height;
	                if (width <= height) {
	                    one.style.width = '100%';
	                    one.style.height = 'auto';
	                } else {
	                    one.style.width = 'auto';
	                    one.style.height = '100%';
	                }
	            }
	        }
	    }
	}

</script>
</html>