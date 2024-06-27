<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Momentum</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!--다크 테마 기본 값-->
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<!--현재 테마 여부. 0 : 다크, 1 : 라이트-->
<input type="hidden" id="cur-theme" value="0">
<link rel="stylesheet" href="./resources/css/myPost.css">

<body class="theme">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div id="main">
			<div id="top">
				<div id="back_button">
					<h1><</h1>
				</div>
				<div id="top_text">
					<h1 class="theme-font">게시물 자세히보기</h1>
				</div>
			</div>

			<!-- 사용자 닉네임, 프로필사진등 가져와서 쓰기 -->
			<div id="post_main">
				<div id="post_me">
					<div id="pro_radius">
						<img src="./resources/img/프로필.png">
					</div>
					<div id="radius_and">
						<h3>
							글쓴이 : ${postvo.id} <br> 글번호(table no값) : ${postvo.no}
						</h3>
					</div>

					<div id="showMove" onclick="showSheet()">
						<h3>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5" />
								</svg>
						</h3>
					</div>
					<div class="move-sheet" id="moveSheet" onclick="hideSheet()">
						<div class="move-options">

							<div class="option close" onclick="hideSheet()">X</div>
							<div class="option" id="updatePost">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
									  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
									</svg>
								게시물 수정
							</div>
							<div class="option" id="deletePost">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
									  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0" />
									</svg>
								게시물 삭제
							</div>
						</div>
					</div>

				</div>


				<div class="theme-font">

					<div id="carouselExample" class="carousel slide ">
						<div class="carousel-inner">
							<c:forEach items="${postvo.filename }" var="file" varStatus="status">
								<c:if test="${status.index == 0 }">
									<div class="carousel-item active">
										<img src="download?filename=${status.current}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${status.index >= 1 }">
									<div class="carousel-item">
										<img src="download?filename=${status.current}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${status.last == true && status.index != 0  }">
									<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample${postStat.count }" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button" data-bs-target="#carouselExample${postStat.count }" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
									</button>
								</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
				<div id="likeField">
					<div style="float: left; margin-left: 70%; margin-top: 5px;">
						<a onclick="opencomm()"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
									 <path d="M16 8c0 3.866-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7M5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0m4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
								</svg></a>
					</div>

					<div style="float: right; margin-right: 20%; margin-top: 7px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
								</svg>

					</div>
				</div>
				<div style="border: 1px solid violet;">
					<textarea id="textField">${postvo.cont}</textarea>
				</div>
			</div>

			<!-- 댓글 테이블 -->
			<div class=".theme-fontx" id="comments">

				<input type="hidden" value="${postvo.no}" name="no">
				<div id="commdiv">
					<a onclick="opencomm()"><span>Comments [${Commcnt}]</span></a> <br> <input type=text placeholder="댓글 내용을 입력하세요." class="comminput" id="c_cont"><input type=submit value="댓글" class="postcommbut" onclick="incomm()"> <select id="ordercomm" onchange="selectorder()">
						<option value="latest">최신순</option>
						<option value="likeorder">좋아요순</option>
						<option value="dislikeorder">싫어요순</option>
					</select>
				</div>

				<div id="ctablediv">
					<!-- <button type = "button" value="ddffd" onclick = "tablerefresh()"></button> -->
					<c:forEach items="${commlist}" var="comm">
						<table class="ctable${comm.c_no}" style="word-break: break-all" id = "commtablelist">
							<tr>
								<td class="commpro_radius"><img src="./resources/img/프로필.png">
								<b>${comm.id}</b>
								<br><p class="comm_date">${comm.c_date}</p></td>
								
								<td width="5%">
								<button type="button" class="delete${comm.c_no} postcommbut" onclick="delcomm(${comm.c_no})">삭제</button>
								<button type="button" class="report${comm.c_no} postcommbut" onclick="alert('report')">신고</button></td>
							</tr>
							<tr>
								<td class="commcontents" width="1500px">${comm.c_cont}</td>
								<td width="15%" class="thumb"><input type="hidden" class="likebtnhid${comm.c_no}" value="0"><a onclick="c_like(${comm.c_no})">
										<button type="button" class="iconlike${comm.c_no}">
											<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  								<path
													d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
								</svg>
										</button>
								</a> <span id="like${comm.c_no}">${comm.c_like}</span> <input type="hidden" class="dislikebtnhid${comm.c_no}" value="0"> &nbsp&nbsp <a onclick="c_dislike(${comm.c_no})"><button type="button" class="icondislike${comm.c_no}">
											<svg class="icon${comm.c_no}" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
  <path
													d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />
</svg>
										</button></a> <span id="dislike${comm.c_no}">${comm.c_dislike}</span></td>
							</tr>
						</table>
					</c:forEach>
				</div>


			</div>
		</div>



	</div>



</body>

<script>
	//페이지 로드 할 때 좋아요 누른 여부 가져오기
	$(document).ready(function(){
		setting();
	})

	function showSheet(){
		document.getElementById("moveSheet").classList.add("active");
	}

	function hideSheet(){
		document.getElementById("moveSheet").classList.remove("active");
	}
		updatePost.addEventListener('click',()=>{
		alert('게시물 수정화면으로 이동합니다');
	})
	deletePost.addEventListener('click',()=>{
		if( confirm('삭제 하시겠습니까?') == true ){
			console.log('딜리트 true');
		}else{
			console.log('딜리트 false');
			}
		})
    //테마 변경 스크립트. 나중에 설정 화면에서 별도 제어 예정
    $('#btn').on('click', function () {
        themeSwitch();
        if ($('#cur-theme').val() == 0) {
            $('#theme-setting').prop('href', './resources/css/dark_theme.css');
        } else {
            $('#theme-setting').prop('href', './resources/css/light_theme.css');
        }
        $('#postingWindow').css('z-index', 1);
    });
    function themeSwitch() {
        if ($('#cur-theme').val() == 0) {
            $('#cur-theme').val(1);
        } else {
            $('#cur-theme').val(0);
        }
    }
    back_button.addEventListener('click',()=>{
    	location.href="main";
    })
	// 댓글 열고 닫기 
	function opencomm() {
    	console.log("dd")
    	if($("[class*='ctable']").css("display") == "block") {
    		$("[class*='ctable']").css('display', 'none');
    	}else if($("[class*='ctable']").css("display") == 'none') {
    		$("[class*='ctable']").css('display', 'block');
    	}
    }
	// 좋아요 버튼 누르기
	function c_like(c_no) {
		if($(".likebtnhid" + c_no).val()== 0) {
			if($(".dislikebtnhid" + c_no).val() == 1) {
				alert("이미 싫어요 한 글입니다.")
				return 0;
			}else {
				$(".likebtnhid" + c_no).val(1);	
			}
		} else {
			$(".likebtnhid" + c_no).val(0);
		}
		let chkno = $(".likebtnhid" + c_no).val();
		let likenum = $("#like"+c_no).text();	
		if($(".likebtnhid" + c_no).val() == 1) {
			
			$(".iconlike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
		  			<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
					</svg>`);
			likeajax(c_no,chkno);
			$("#like"+c_no).text(Number(likenum)+1);
		}else {
			// 숫자 다시 원래대로 하고 아이콘 바꿈
			$(".iconlike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
						<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
					</svg>`);
			$("#like"+c_no).text(Number(likenum)-1);
			likeajax(c_no,chkno);
		}
	 }
	 function likeajax(c_no,chkno) {
		 console.log(c_no);
		 console.log(chkno+"체크")
		 $.ajax({
				type:"POST",
				url:"c_like",
				data: {"c_no" : c_no, "chkno" : chkno},
				cache : false,
				success:function() {
					}
			 })  
	 }
	 
		 
	
	 function c_dislike(c_no) {
		if($(".dislikebtnhid" + c_no).val()== 0) {
			if($(".likebtnhid" + c_no).val() == 1) {
				alert("이미 좋아요한 글입니다.")
				return 0;
			}else {
				$(".dislikebtnhid" + c_no).val(1);	
			}
			
			
		} else {
			$(".dislikebtnhid" + c_no).val(0);
		}
		let chkno = $(".dislikebtnhid" + c_no).val();
		let dislikenum = $("#dislike"+c_no).text();	
		if($(".dislikebtnhid" + c_no).val() == 1) {
			$(".icondislike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
					  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.38 1.38 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51q.205.03.443.051c.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.9 1.9 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2 2 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.2 3.2 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.8 4.8 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591"/>
					</svg>`);
			dislikeajax(c_no,chkno);
			$("#dislike"+c_no).text(Number(dislikenum)+1);
		}else {
			// 숫자 다시 원래대로 하고 아이콘 바꿈
			$(".icondislike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
					  <path
					d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />
</svg>`);
			$("#dislike"+c_no).text(Number(dislikenum)-1);
			dislikeajax(c_no,chkno);
		}
		
	 }
	 function dislikeajax(c_no,chkno) {
		 $.ajax({
				type:"POST",
				url:"c_dislike",
				data: {"c_no" : c_no, "chkno" : chkno},
				cache : false,
				success:function() {
					
					alert("성공");
					}
			 })  
	 }
	 
	 
	function incomm() {
		// 해당 글 값 가져오기
		var no = "${postvo.no}";
		var c_cont = $("#c_cont").val();
		var param = {
				"no" : no, 
				"c_cont" : c_cont}
	 	 $.ajax({
				type:"POST",
				url:"inputcomm",
				contentType:'application/json; charset=utf-8',
				data : JSON.stringify(param),
				success:function(data) {
					console.log("여기 안됨?");
					document.location.reload();
					}
			 }) 
	}
	
	 function selectorder() {
		let sort = $("#ordercomm").val();
		let no = ${postvo.no};
		var uid = '<%=(String) session.getAttribute("userid")%>';
		var postno = '${postvo.no}';
		 $.ajax({
				type:"POST",
				url:"orderlikecomm",
				data: {"order" : sort,"no" : no},
				cache : false,
				 success: function(data) {
			            // AJAX 요청이 성공한 후 실행할 코드
			        $("#ctablediv").empty();   
			            
			        var commlist = data.commlist;
		            var html = '';    
		            $.each(commlist, function(index, comm) {
		            	html += '<table class="ctable' + comm.c_no + '" style="word-break: break-all" id="commtablelist">';
		                html += '<tr>';
		                html += '<td class="commpro_radius"><img src="./resources/img/프로필.png"><b>' + comm.id + '</b>';
		                html += '<br><p class="comm_date">' + comm.c_date + '</p></td>';
		                html += '<td width="5%"><button type="button" class="delete' + comm.c_no + ' postcommbut" onclick="delcomm(' + comm.c_no + ')">삭제</button>';
		                html += '<button type="button" class="report' + comm.c_no + ' postcommbut" onclick="alert(\'report\')">신고</button></td>';
		                html += '</tr>';
		                html += '<tr>';
		                html += '<td class="commcontents" width="1500px">' + comm.c_cont + '</td>';
		                html += '<td width="15%" class="thumb">';
		                html += '<input type="hidden" class="likebtnhid' + comm.c_no + '" value="0">';
		                html += '<a onclick="c_like(' + comm.c_no + ')">';
		                html += '<button type="button" class="iconlike' + comm.c_no + '">';
		                html += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">';
		                html += '<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />';
		                html += '</svg>';
		                html += '</button>';
		                html += '</a>';
		                html += '<span id="like' + comm.c_no + '">' + comm.c_like + '</span>';
		                html += '<input type="hidden" class="dislikebtnhid' + comm.c_no + '" value="0"> &nbsp&nbsp';
		                html += '<a onclick="c_dislike(' + comm.c_no + ')">';
		                html += '<button type="button" class="icondislike' + comm.c_no + '">';
		                html += '<svg class="icon' + comm.c_no + '" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">';
		                html += '<path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 0-.443-.05 9.36 9.36 0 0 0-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />';
		                html += '</svg>';
		                html += '</button>';
		                html += '</a>';
		                html += '<span id="dislike' + comm.c_no + '">' + comm.c_dislike + '</span>';
		                html += '</td>';
		                html += '</tr>';
		                html += '</table>';
		            });
			        $('#ctablediv').html(html);
			        },
			        error: function(xhr, status, error) {
			            // AJAX 요청이 실패한 경우 처리할 코드
			            console.error("AJAX 요청 실패:", status, error);
			        }
			 });
		 setting(); 
	} 
	// 댓글 삭제
	function delcomm(c_no) {
		console.log(c_no +"이거 지움")
		$.ajax({
			type:"GET",
			url:"delcomm?c_no="+c_no,
			success: function() {
				$(".ctable"+c_no).remove();
			}
		})
		
	}
	
	
	function setting() {
		var uid = '<%=(String) session.getAttribute("userid")%>';
		var postno = '${postvo.no}';
		
		// 좋아요 누른 댓글 확인 후 아이콘 변경
		$.ajax({
			type:"POST",
			url:"chklike",
			data: {"id" : uid, "no" : postno},
			dataType : 'json',
			cache : false,
			success:function(data) {
				$.each(data, function(index, c_no) {
					$(".likebtnhid"+c_no).val(1);
					$(".iconlike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
				  			<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
							</svg>`);
				})
				},
				
		 
		 });
		// 싫어요 누른 댓글 확인 후 아이콘 변경
		$.ajax({
			type:"POST",
			url:"chkdislike",
			data: {"id" : uid, "no" : postno},
			dataType : 'json',
			cache : false,
			success:function(data) {
				$.each(data, function(index, c_no) {
					$(".dislikebtnhid"+c_no).val(1);
					$(".icondislike"+c_no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
							  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.38 1.38 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51q.205.03.443.051c.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.9 1.9 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2 2 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.2 3.2 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.8 4.8 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591"/>
							</svg>`);
				});
					
					
				
				},
				
				
	}); 
		// 해당 댓글 쓴 아이디면 삭제버튼 
		$.ajax({
			type:"POST",
			url:"mycomm",
			data: {"id" : uid, "no" : postno},
			dataType : 'json',
			cache : false,
			success:function(data) {
				$.each(data, function(index, c_no) {
					$(".delete"+c_no).css("display","block");
					$(".report"+c_no).css("display","none");
				})
				},
		 });
	}
	
</script>
</html>



