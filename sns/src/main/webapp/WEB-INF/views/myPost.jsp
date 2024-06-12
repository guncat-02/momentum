<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String body = request.getParameter("body");
	session.setAttribute("title",title);
	session.setAttribute("body",body);
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Momentum</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>

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
						<h1 class="theme-font">게시물 자세히보기</h1>
					</div>
				</div>
				<!--테마 변경은 추후 설정 화면에서 제어 (임시 주석)-->

				<!-- 
                <input type="button" value="themechange" id="btn">
                 -->


				<!-- 사용자 닉네임, 프로필사진등 가져와서 쓰기 -->
				<div id="post_main">
					<div id="post_me">
						<div id="pro_radius">
							<img src="./resources/img/프로필.png">
						</div>
						<div id="radius_and">
							<h3>username1234567890</h3>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
									  <path d="M16 8c0 3.866-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7M5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0m4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
									</svg>
							</div>


							<div style="float: right; margin-right: 20%; margin-top: 7px;">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
									</svg>

							</div>


						</div>
						<div style="border: 1px solid violet;">
							<textarea id="textField"><%=title %><%=body %></textarea>
						</div>

					</div>
				</div>

				<div class="theme-font" id="comments">
					<div>
						<span>댓글 </span>
						<input type = text placeholder = "댓글을 입력하세요">
						
					</div>

					<table class="table table-hover" id="mtable">
						<thead>
							<tr>
								<th>닉네임</th>
							</tr>

						</thead>
							<td>글 내용</td>
						<tbody>

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



						</tbody>
					</table>
					<%-- <br>
                	댓글 추가작업 예정
                	<h2>title: <%=title %></h2>
                	
                	<p>body: <%=body %></p>
                	 --%>

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
</script>
</html>
