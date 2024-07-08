<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/searchList.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" href="./resources/css/search.css">
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet"
	href="./resources/css/dark_theme.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div id="main">
			<!--메인 컨텐츠는 여기에 작성 부탁합니당-->
			<form action="searchList" method="get"
				onsubmit="return searchSubmit()">
				<div id="searchBar" class="theme">
					<input type="search" id="search" placeholder="SEARCH"
						autocomplete='off' name="keyWord">
					<div id="miniSearch">
						<div id="miniSearchTitle">
							<span id="searDel">모두 지우기</span>
						</div>
						<table id="miniSearchTable">

						</table>
					</div>
				</div>
			</form>
			<div id="searMenuBar" class=theme>
				<ul id="searMenu">
					<li><span class="keyType" id="nowKeyType">인기</span></li>
					<li><span class="keyType">최신</span></li>
					<li><span class="keyType">마음</span></li>
					<li><span class="keyType">리포스트</span></li>
					<li><span class="keyType">사용자</span></li>
				</ul>
			</div>
			<div id="searResult">
				<div id="searchResultAll">
				<c:choose>
					<c:when test="${info ne null}">
						<div id="searMain">
							<c:choose>
							<c:when test='${key.keyType ne "사용자"}'>
								<c:forEach items="${info}" var="mp">
								<c:set var="filenameLength" value="${fn:length(mp.filename)}" />
								<div class="p_inf">
									<a href="userprofile?id=${mp.id}" class="userprofilealink">
										<div class="proimg">
											<img class="profileImg" src="./resources/img/프로필.png">
											<c:forEach items="${profile}" var="pr">
												<c:if test="${mp.id eq pr.id }">
													<img class="profileImg"
														src="download?filename=${pr.photo }">
												</c:if>
											</c:forEach>
										</div> <span class="p_id">${mp.id }</span>
									</a> <span class="p_date">${mp.p_date} </span>

								</div>

								<a href="myPost?no=${mp.no}" style="cursor: pointer;"
									class="p_alink" onclick="p_show(${mp.no})"> <!-- 프로필 아이디 -->
									<div class="p_cont theme">${mp.cont }</div> <c:choose>
										<c:when test="${filenameLength eq 0}">
											<div class="p_files" style="display: none">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
													<div class="item">
														<img src="download?filename=${status.current}">
													</div>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${filenameLength eq 1}">
											<div class="p_files">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
													<div class="item">
														<img src="download?filename=${status.current}">
													</div>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${filenameLength eq 2}">
											<div class="p_files"
												style="display: grid; grid-template-columns: 1fr 1fr">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
													<div class="item" style="">
														<img src="download?filename=${status.current}">
													</div>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${filenameLength eq 3}">
											<div class="p_files"
												style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
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
											<div class="p_files"
												style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr;">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
													<div class="item">
														<img src="download?filename=${status.current}">
													</div>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${filenameLength eq 5}">
											<div class="p_files"
												style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr">
												<c:forEach items="${mp.filename }" var="file"
													varStatus="status">
													<c:choose>
														<c:when test="${status.index eq 3}">
															<div class="item">
																<img src="download?filename=${status.current}">
																<svg xmlns="http://www.w3.org/2000/svg" width="50"
																	height="50" fill="#ff00bf" class="bi bi-plus-circle"
																	viewBox="0 0 16 16"> <path
																		d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" /> <path
																		d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /> </svg>
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
										<button type="button" class="p_lovebut${mp.no } theme"
											onclick="p_love(${mp.no })">
											<svg xmlns="http://www.w3.org/2000/svg" width="25"
												height="25" fill="currentColor" class="bi bi-heart-fill"
												viewBox="0 0 16 16"> <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" /> </svg>
										</button>
										<span class="footspan p_lovecnt${mp.no}">${mp.p_love}</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="currentColor" class="bi bi-chat-right-dots-fill"
											viewBox="0 0 16 16"> <path
												d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353zM5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2" /> </svg>
										<span class="footspan">${mp.commCnt}</span>
									</div>
									<div>
										<button type="button" class="p_repostbut${mp.no } theme"
											onclick="repost(${mp.no})">
											<svg xmlns="http://www.w3.org/2000/svg" width="25"
												height="25" fill="currentColor" class="bi bi-share"
												viewBox="0 0 16 16"> <path
													d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" /> </svg>
										</button>
										<span class="footspan">${mp.reCnt}</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"> <path
												d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z" /> <path
												d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0" /> </svg>
										<span class="footspan">${mp.show}</span>
									</div>
								</div>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${info}" var="user">
								<div class="searchResultUser">
                					<div class="searUser" style="grid-column: 1 / 2; grid-row: 1 / 3;">
                    					<div class="userPhotoCircle">
                    						<c:choose>
                    							<c:when test="${user.photo eq null}">
                    								<img class="userPhoto" src="./resources/img/프로필.png">
                    							</c:when>
                        						<c:when test="${user.photo ne null}">
                        							<img class="userPhoto" src="download?filename=${user.photo}">
                    							</c:when>
                        					</c:choose>
                    					</div>
                					</div>
                					<c:choose>
                				<c:when test="${user.bio ne null}">
                				<div class="searUser" style="grid-column: 2 / 3; grid-row: 1 / 2;">
                    				<span class="userNick">
                        				${user.nickName}
                    				</span>
                    				<span class="userId">
                        				( ${user.id} )
                    				</span>
                				</div>
               					 <div class="searUser" style="grid-column: 2 / 3; grid-row: 2 / 3;">
                    				<span class="userBio">
                        				${user.bio}
                    				</span>
                				</div>
                				</c:when>
                				<c:when test="${user.bio eq null}">
                					<div class="searUser" style="grid-column: 2 / 3; grid-row: 1 / 3; padding-top: 4%;">
                    				<span class="userNick">
                        				${user.nickName}
                    				</span>
                    				<span class="userId">
                        				( ${user.id} )
                    				</span>
                					</div>
                				</c:when>
                				</c:choose>
                				<div class="userFollowBtn" style="grid-column: 3 / 4; grid-row: 1 / 3;">
                    
                				</div>
           					</div>
           					</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</c:when>
					<c:when test="${info eq null}">
						<div id="searchNone">
							<span>검색 결과가 존재 하지 않습니다.</span>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		</div>
	</div>
</body>
<script>
	let searWord;

	//검색 기록 추가
	window.onload = function() {
		$('#search').val('${key.keyWord}')
		if(localStorage.getItem('${id}') != null) {
			searWord = localStorage.getItem('${id}')
			searchList();
		}	
	}
	
	//검색 기록 띄우기
	function searchList() {
		$('#miniSearchTable').empty();
		if(localStorage.getItem('${id}') != null) {
			let myList = searWord.split('/');
			for(let i = 0; i <myList.length; i++) {
				$('#miniSearchTable').append("<tr><td class='searListWord' style='width: 90%'>"+myList[i]+"</td><td style='width: 10%; text-align: right;'><span class='searListDel'>X</span></td></tr>");	
			}
		} else {
			$('#miniSearch').css('display', 'none');
		}
	}
	
	//검색어가 없을 경우 submit x
	function searchSubmit() {
		if($('#search').val().trim() != "" && $('#search').val() != null) {
			if(localStorage.getItem('${id}') != null) {
				let myList = searWord.split('/');
				let myWord;
				for(let i = 0; i < myList.length; i++) {
					if($('#search').val() == myList[i]) {
						myWord = myList[i];
						myList.splice(i, 1)
						break;
					}
				}
				if(myWord != null) {
					if(myList.length == 0) {
						localStorage.setItem('${id}', $('#search').val())
					} else {
						searWord = "";
						for(let i = 0; i < myList.length; i++) {
							if(myList[i] != null && myList[i].trim() != "") {
								if(i == myList.length-1) {
				        			searWord += myList[i]
				        		} else {
				        			searWord += myList[i]+"/"
				        		}
							}
						}
						localStorage.setItem('${id}', $('#search').val()+"/"+searWord)
					}
				} else {
					localStorage.setItem('${id}', $('#search').val()+"/"+searWord)
				}
			} else {
				localStorage.setItem('${id}', $('#search').val())
			}
			return true;
		}
		return false;
	}
	
	//검색어 클릭 시 검색 기록 확인
	$('#search').click(function() {
		if(localStorage.getItem('${id}') != null) {
			$('#miniSearch').css('display', 'block');	
		}
	})
    
    //삭제 버튼 누를 시 값 삭제
    $('#miniSearchTable').on('click', '.searListDel', function() {
    	let index = $('.searListDel').index($(this))
    	let word = searWord.split('/')
    	word.splice(index, 1);
    	searWord = "";
    	if(word.length == 0) {
    		localStorage.removeItem('${id}')
    		searchList();
    	} else {
    		for(let i = 0; i < word.length; i++) {
        		if(i == word.length-1) {
        			searWord += word[i]
        		} else {
        			searWord += word[i]+"/"
        		}
        	}
    		localStorage.setItem('${id}', searWord);
    		searchList();
    	}
    })
    
    //모두 지우기 버튼을 누를 시
    $('#searDel').click(function() {
    	searWord = "";
    	localStorage.removeItem('${id}')
		searchList();
    })
    
    //검색어 누르면 자동으로 값 입력
    $('#miniSearchTable').on('click', '.searListWord', function() {
    	$('#search').val($(this).text());
    	$('form').submit();
    })
    
	//검색기록 안 보이게 만들기
    $('#searchBar').mouseleave(function() {
    	if($('#miniSearch').css('display') == 'block') {
    		$('#miniSearch').css('display', 'none');
    	}
    })
    
    	$(document).ready(function(){
		setting();
		console.log('no : ${aList[0].no}');
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
	function repost(no) {
		location.href = `/sns/reposting?no=\${no}`;
	}
	
    $('body').on('mousewheel', function() {
		mousewheelEvent();
    });
    
    // 추천 게시물 시작 번호
    let curRecomPage = 1;
    // 이미 로딩된 기존 컨텐츠
    let prevCont;
    function mousewheelEvent() {
        if ((window.scrollY + window.innerHeight)/document.body.clientHeight > 0.85) { // 마지막까지 스크롤 했을 때.
        	// 이벤트 지워준다.
        	$('body').off('mousewheel');
        	// 이미 로딩된 기존 컨텐츠의 html 객체 저장.
    		prevCont = $('.myPost').html();
        	// 0.25초 뒤 다음 코드 실행.
        	setTimeout(() => {        		
        		$('#searchResultAll').load(`newRecomPost?pageNo=\${curRecomPage} #searMain`, function() {
        			// 새로 고침 성공 시 실행.
        			// 기존 게시물을 새로 로딩된 게시물 위에 추가.
        			$('#searMain').prepend(prevCont);
        			// 다음 페이지 시작 번호 갱신.
        			curRecomPage += 10;
        			// 제거했던 이벤트 다시 생성.
        			$('body').on('mousewheel', function() { mousewheelEvent(); });
        		});
        		// 두 경우 모두에 속하지 않는 경우 스크롤 페이징 중단.
        	}, '250');
        }
    }
    
    //검색어마다 결과 가져오기
    $('.keyType').click(function() {
    	let word = $('#search').val();
    	let type = $(this).text();
    	const index = $('.keyType').index($(this))
    	$('#searResult').load(`searchList?keyWord=\${word}&keyType=\${type} #searchResultAll`)
    	$('.keyType').removeAttr("id");
    	$('.keyType').eq(index).attr("id", "nowKeyType")
    })
    
    //프로필 이동
    $('#searResult').on('click', '.searUser', function() {
    	location.href = "profileShow?id="+$('.searUser').closest('.searchResultUser').find('span').eq(1).text().trim().split(" ")[1];
    })
</script>
</html>