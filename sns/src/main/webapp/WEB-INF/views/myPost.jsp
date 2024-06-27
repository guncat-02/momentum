<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Momentum</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
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
            <main>
            	<div id="top">
	            	<div id="back_button">
	            		<h1><</h1>
	            	</div>
	            	<div id="top_text">
	            		<h1 class="theme-font" >게시물 자세히보기</h1>
	            	</div>
                </div>
                
                <!-- 사용자 닉네임, 프로필사진등 가져와서 쓰기 -->
                <div id="post_main">
	                <div id="post_me" >
		                <div id="pro_radius">
		                	<img src="./resources/img/프로필.png">
		                </div>
	                	<div id="radius_and">
		                	<h3>
		                		사용자id : ${myid }
		                		<br>
		                		사용자이름 : ${myname }
		                		<br>
		                		사용자등급 : ${mygrade }
		                		<br>
		                		글쓴이 : ${postvo.id}
		                		<br>
		                		글번호(table no값) : ${postvo.no}
		                	</h3>
	                	</div>
	                	
	                	<div id="showMove" onclick="showSheet()">
		                	<h3>
			                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
								</svg>
		                	</h3>
	                	</div>
	                	<div class="move-sheet" id="moveSheet" onclick="hideSheet()">
		                	<div class="move-options">
		                		
		                		<div class="option close" onclick="hideSheet()">X</div>
		                		<div class="option" id="updatePost">
			                		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
									</svg>
			                		게시물 수정
		                		</div>
		                		<div class="option" id="deletePost">
			                		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
									  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
									</svg>
		                			게시물 삭제
		                		</div>
		                	</div>
	                	</div>
		                <script>
		                	function showSheet(){
		                		document.getElementById("moveSheet").classList.add("active");
		                	}
		                	//showMove.addEventListener('click',()=>{
		                	//	document.getElementById("moveSheet").classList.add("active");
		                	//})
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
		                </script>
	                </div>
	                <div class="theme-font">
	               	
	               		<div id="carouselExample" class="carousel slide " >
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
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
										  	</button>
										  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExample${postStat.count }" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
									  		</button>
						        		</c:if>
				        			</c:forEach>
								</div>
							</div>
	               	
		                </div>
	                	 <div id="likeField">
			            	<div style="float:left; margin-left:70%; margin-top:5px;">
				            	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
									 <path d="M16 8c0 3.866-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7M5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0m4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
								</svg>
			            	</div>
			            		
			            	<div style="float:right; margin-right:20%; margin-top:7px;">
			            		<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
								</svg>
			            		
			            	</div>
			            </div>
	                	<div 
	                	style=" border:1px solid violet;">
	                	<textarea id="textField"><%-- <%=title %><%=body %> --%>${postvo.cont}</textarea>
	                	</div>
	                </div>
                </div>
					<div class="theme-font">
						<div id="mytheme">
							<img src="./resources/img/프로필.png">
						</div>
						<div style="text-align: center;">
							<button class="inb"><</button>
							<form class="inRadio radio_style">
								<input type="radio" name="page" value="1" checked> <input type="radio" name="page" value="2"> <input type="radio" name="page" value="3"> <input type="radio" name="page" value="4"> <input type="radio" name="page" value="5">
							</form>
							<button class="inb">></button>


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
							<textarea id="textField"></textarea>
						</div>

					</div>
				</div>

				<div class=".theme-fontx" id="comments">
					<form action="incomm" method="get">
						<div>
							<span>Comments [2]</span> <br> <input type=text placeholder="댓글 내용을 입력하세요." class="comminput" name="c_cont"><input type=submit value="댓글" class="postcommbut">
						</div>
					</form>
					<div id="ctablediv">
						<table class="ctable" style="word-break: break-all">

							<tr>
								<td class="commpro_radius">
									<img src="./resources/img/프로필.png"><b>코로짱</b>
								</td>
								
							</tr>
							<tr>
								<td class="comm_date">2024-6-13</td>
							</tr>
							<tr>
								<td class="commcontents" width="1500px">너 없는 지금도 눈부신 하늘과 눈부시게 웃는 사람들 나의 헤어짐을 모르는 세상은 슬프도록 그대로인데 시간마저 데려가지 못하게 나만은 널 보내지 못했나봐 가시처럼 깊게 박힌 기억은 아파도 아픈줄 모르고 그대 기억이 지난 사랑이 내 안을 파고 드는 가시가 되어 제발 가라고 아주 가라고 애써도 나를 괴롭히는데</td>
								<td width="10%" class = "thumb"><a onclick="like()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path
												d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg></a> <span>10</span> <a onclick="dislike()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
  <path
												d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />
</svg></a> <span>3</span></td>
							</tr>
						</table>
						<table class="ctable" style="word-break: break-all">

							<tr>
								<td class="commpro_radius">
									<img src="./resources/img/프로필.png">
									<b>guncat</b>
								</td>
								
							</tr>
							<tr>
								<td class="comm_date">2024-6-13</td>
							</tr>
							<tr>
								<td class="commcontents" width="1500px">개노잼 ㅋ</td>
								<td width="10%" class = "thumb"><a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path
												d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg></a> <span>1</span> <a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
  <path
												d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />
</svg></a> <span>2332</span></td>
							</tr>
						</table>
					</div>


				</div>

			</main>
		</div>

	</div>
</body>

<script>
	
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
	
	function opencomm() {
    	if($('.ctable').css("display") == "block") {
    		$('.ctable').css('display', 'none');
    	}else if($('.ctable').css("display") == 'none') {
    		$('.ctable').css('display', 'block');
    	}
    	
    }
    
	function like() {
		$.ajax({
			type:"GET",
			url:"c_like?no="+no,
			cache : false,
			success:function(data) {
				
				}
		 })
	}
	function dislike() {
		$.ajax({
			type:"GET",
			url:"c_dislike?no="+no,
			cache : false,
			success:function(data) {
				
				}
		 })
	}
    
</script>
</html>

<%-- <c:forEach items="${allListitems }" var="JMTvo">

					<tr>

						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.title }</a></td>
						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.name }</a></td>
						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.indate }</a></td>
						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.id }</a></td>
						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.loc }</a></td>

						<td><a href="#" onclick="show(${JMTvo.no } )">${JMTvo.review }</a></td>

						<td><a href="#"
							onclick="delchk(${JMTvo.no }, ${JMTvo.password })"><input
								type=button value="삭제"></a></td>
						<td><a href="#"
							onclick="popup(${JMTvo.no }, ${JMTvo.password })"><input
								type=button value="수정"></a></td>

						<td><a href="#" onclick="like(${JMTvo.no })"><i
								class="bi bi-hand-thumbs-up"></i></a> ${JMTvo.love }</td>
					</tr> 

				</c:forEach>--%>

