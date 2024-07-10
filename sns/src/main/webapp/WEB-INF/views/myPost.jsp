<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Momentum</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/myPost.css">

<body class="theme">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div id="main">
			<form id="clicked-profile" action="userprofile" method="get">
				<input type="hidden" value="${proVO.id }" name="id">
			</form>
			<form id="clicked-re-profile" action="userprofile" method="get">
				<input type="hidden" value="${reProVO.id }" name="id">
			</form>
			<form id="clicked-repost" action="myPost" method="get">
				<input type="hidden" value="${repvo.no }" name="no">
			</form>
			<!-- 게시물 시작 -->
			<div class="one-post-container">

				<!-- 게시물 프로필 사진 -->
				<div class="one-post-photo">
					<div class="photo-div">
						<c:choose>
							<c:when test="${not empty proVO.photo}">
								<img src="/sns/download?filename=${proVO.photo }">
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

				<!-- 게시물 메뉴 -->
				<div class="one-post-menu">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
		                <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
		            </svg>
					<div class="one-post-menu-box">
						<button type="button" class="theme one-post-menu-edit">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
		                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325" />
		                    </svg>
							EDIT
						</button>
						<button type="button" class="theme one-post-menu-remove">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
		                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
		                    </svg>
							REMOVE
						</button>
						<button type="button" class="theme one-post-menu-report" onclick=reportPostbut(${postvo.no})>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-exclamation" viewBox="0 0 16 16">
							  <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855a.75.75 0 0 0-.124 1.329l4.995 3.178 1.531 2.406a.5.5 0 0 0 .844-.536L6.637 10.07l7.494-7.494-1.895 4.738a.5.5 0 1 0 .928.372zm-2.54 1.183L5.93 9.363 1.591 6.602z"/>
							  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1.5a.5.5 0 0 1-1 0V11a.5.5 0 0 1 1 0m0 3a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>
							</svg>
							REPORT
						</button>
						<button type="button" class="theme one-post-menu-block">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ban" viewBox="0 0 16 16">
							  <path d="M15 8a6.97 6.97 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0"/>
							</svg>
							BLOCK
						</button>
					</div>
				</div>

				<!-- 게시물 글 내용 -->
				<div class="one-post-cont">
					<span class="contents-span"> ${postvo.cont } </span>
					<textarea maxlength="100" class="edit-contents-textarea theme" required>${postvo.cont }</textarea>
				</div>

				<!-- 게시물 프로필 사진 아래 빈 공간 -->
				<div class="one-post-space"></div>

				<!-- 게시물 사진 -->
				<div class="one-post-attach">
					<c:if test="${not empty postvo.filename }">
						<div class="attach-div">
							<c:set var="pFileLength" value="${fn:length(postvo.filename)}" />
							<c:if test="${pFileLength gt 1 }">
								<button class="arrow-left">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
				                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
				                    </svg>
								</button>
							</c:if>
							<c:forEach items="${postvo.filename }" var="file">
								<img src="/sns/download?filename=${file}">
							</c:forEach>
							<c:if test="${pFileLength gt 1 }">
								<button class="arrow-right">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
				                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
				                    </svg>
								</button>
							</c:if>
						</div>
					</c:if>
				</div>

				<!-- 리포스트된 게시물 -->
				<div class="one-post-reposted">
					<c:if test="${not empty repvo }">
						<div class="reposted-div">
							<span class="reposted-mark-span"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
			                    	<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" />
			                	</svg> REPOSTED
							</span>
							<div class="reposted-container">
								<div class="reposted-attach">
									<c:if test="${not empty repvo.filename }">
			                        <div class="re-attach-div">
				                        <c:set var="rpFileLength" value="${fn:length(repvo.filename)}" />
				                        <c:if test="${rpFileLength gt 1 }">
				                            <button class="re-arrow-left">
				                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
				                                    class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
				                                    <path fill-rule="evenodd"
				                                        d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
				                                </svg>
				                            </button>
			                            </c:if>
			                            <c:forEach items="${repvo.filename }" var="file">
			                            	<img src="/sns/download?filename=${file }">
			                            </c:forEach>
			                            <c:if test="${rpFileLength gt 1 }">
				                            <button class="re-arrow-right">
				                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
				                                    class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
				                                    <path fill-rule="evenodd"
				                                        d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
				                                </svg>
				                            </button>
			                            </c:if>
			                        </div>
			                        </c:if>
			                    </div>
								<div class="reposted-photo">
									<div class="re-photo-div">
										<c:choose>
											<c:when test="${not empty reProVO.photo}">
												<img src="/sns/download?filename=${reProVO.photo }">
											</c:when>
											<c:otherwise>
												<img src="/sns/resources/img/프로필.png">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="reposted-names">
									<span class="re-nickname-span">${reProVO.nickName }</span> <span class="re-id-span">${reProVO.id }</span>
								</div>
								<div class="reposted-cont">
									<span class="re-contents-span">${repvo.cont }</span>
								</div>
							</div>
						</div>
					</c:if>
				</div>

				<!-- 좋아요, 댓글, 리포스트, 조회수 버튼 -->
				<input type="hidden" value="0" class="p_lovehid${postvo.no}"> <input type="hidden" value="${postvo.no}" id="p_lovehid${postvo.no}">
				<div class="one-post-interactions">
					<span class="interactions-span">
						<button type="button" class="p_lovebut${postvo.no }" onclick="p_love(${postvo.no })">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
		                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
		                </svg>
						</button> <span class="like-cnt-span">${postvo.p_love }</span> <!-- 좋아요 수 -->
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
		                    <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z" />
		                    <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
		                </svg> <span class="comm-cnt-span">${postvo.commCnt }</span> <!-- 댓글 수 -->
		                <svg id="interactions-svg-repost" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
		                    <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" />
		                </svg> <span class="repost-cnt-span">${postvo.reCnt }</span> <!-- 해당 게시물이 리포스트 된 수 -->
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
		                    <path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1M8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5 5 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.6 2.6 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046zm2.094 2.025" />
		                </svg> <span class="show-cnt-span">${postvo.show }</span> <!-- 조회수 -->
						<button type="button" class="edit-confirm-btn theme">EDIT POST</button>
						<button type="button" class="edit-cancel-btn theme">CANCEL EDIT</button>
					</span>
				</div>

			</div>
			<!-- 게시물 끝 -->


			<!-- 댓글 테이블 -->
			<div class=".theme-fontx" id="comments">

				<input type="hidden" value="${postvo.no}" name="no">
				<div id="commdiv">
					<a onclick="opencomm()"><span>Comments [${Commcnt}]</span></a> <br> <input type=text placeholder="댓글 내용을 입력하세요." class="comminput" id="c_cont"><input type=submit value="댓글" class="postcommbut" onclick="incomm()"> <br> <select id="ordercomm" onchange="selectorder()">
						<option value="latest">최신순</option>
						<option value="likeorder">좋아요순</option>
						<option value="dislikeorder">싫어요순</option>
					</select>
				</div>

				<div id="ctablediv">
					<c:forEach items="${commlist}" var="comm">

						<table class="ctable${comm.c_no}" style="word-break: break-all" id="commtablelist">
							<tr>
								<td class="commpro_radius">
								<c:set var="p_proimg" value="" />
								<c:forEach items="${profileimglist}" var="pr">
									<c:choose>
										<c:when test="${comm.id eq pr.id}">
											<img class="profileImg" src="download?filename=${pr.photo}">
											<c:set var="p_proimg" value="true" />
										</c:when>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${p_proimg ne 'true'}">
										<img class="profileImg" src="./resources/img/프로필.png">
										<c:set var="p_proimg" value="flase" />
									</c:when>
								</c:choose>

								<c:forEach items="${profilelist }" var="ap">
									<c:if test="${comm.id eq ap.id}">
										<b>${ap.nickName }</b>
									</c:if>
								</c:forEach>
									<p class="comm_date">${comm.c_date}</p></td>

								<td width="5%">
									<button type="button" class="delete${comm.c_no} postcommbut" onclick="delcomm(${comm.c_no})">삭제</button>
									<button type="button" class="report${comm.c_no} postcommbut" onclick="openreportmodal('${comm.c_no}','${comm.id }','${comm.c_cont }')">신고</button>
								</td>
							</tr>
							<tr>
								<td class="commcontents" width="1000px">${comm.c_cont}</td>
								<td width="20%" class="thumb"><input type="hidden" class="likebtnhid${comm.c_no}" value="0"> <a onclick="c_like(${comm.c_no})">
										<button type="button" class="iconlike${comm.c_no}">
											<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
			  									<path
													d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
											</svg>
										</button>
								</a> <span id="like${comm.c_no}">${comm.c_like}</span> <input type="hidden" class="dislikebtnhid${comm.c_no}" value="0"> &nbsp&nbsp <a onclick="c_dislike(${comm.c_no})">
										<button type="button" class="icondislike${comm.c_no}">
											<svg class="icon${comm.c_no}" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
			  									<path
													d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1" />
											</svg>
										</button>
								</a> <span id="dislike${comm.c_no}">${comm.c_dislike}</span></td>
							</tr>
						</table>
					</c:forEach>

				</div>
			</div>

		</div>
	</div>
	<form id = "postreportform">
	<div class="modal_Post">
		<div class="modal_body_comm">
			<svg class="closeModal" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="black" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
</svg>
			<input type="hidden" value="${postvo.no }" name="no" id="report_no">
			<input type="hidden" value="${postvo.id }" name="reportId" id="report_id">
			<input type="hidden" value="POST" name="r_loc" id="report_loc">
			
			<div class="Commreport">
				<div class="reportdiv">글 신고하기</div>
				<div class="rc_div1">
					<div>
						<span class="rc_s1">작성자 |</span> <span class="rc_s2">${postvo.id }</span>
					</div>
					<div>
						<span class="rc_s1">내 용 &nbsp; |</span> <span class="rc_s2"> ${postvo.cont }</span>
					</div>
				</div>
				<div class="reportdiv1">사유선택</div>
				<div class="reportReason">
					<select class="selectReasonPost" onchange="selectReasonPost()" name="st_type" id="re_st_type">
						<option>선택해주세요</option>
						<option value="curse">욕설</option>
						<option value="badContents">부적절한 컨텐츠</option>
						<option value="spam">스팸성</option>
						<option value="badNick">부적절한 nick</option>
					</select> <select class="selectReasonPost2" onchange="selectReasonPost2()" name="nd_type" id="re_nd_type">
						<option>선택해주세요</option>
					</select>

				</div>
				<div>
					<div class="reportdiv1">신고 사유</div>
					<textarea class="reportPostText" name="r_cont" cols="30" rows="5" placeholder="신고사유를 상세히 적어주세요." id="report_cont"></textarea>
				</div>
			</div>
			<div class="reportPostbut">
				<button type="submit" class="rpsubmit postcommbut">신고하기</button>
			</div>
		</div>
	</div>
</form>
	<form id = "commreportform">
	<div class="modal_Comm">
		<div class="modal_body_comm">
			<svg class="closeModal" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="black" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
</svg>	
			<input type="hidden" value="${postvo.no }" name="no" id="reportC_no">
			<input type="hidden" name="reportId" id="reportC_id">
			<input type="hidden" value="COMM" name="r_loc" id="reportC_loc">
			<div class="Commreport">
				<div class="reportdiv">댓글 신고하기</div>
				<div class="rc_div1">
					<div>
						<span class="rc_s1">작성자 |</span> <span class="rc_id rc_s2"></span>
					</div>
					<div>
						<span class="rc_s1">내 용 &nbsp; |</span> <span class="rc_cont rc_s2"> </span>
					</div>
				</div>
				<div class="reportdiv1">사유선택</div>
				<div class="reportReason">
					<select class="selectReason" onchange="selectReason()" name="st_type" id = "co_st_type">
						<option>선택해주세요</option>
						<option value="curse">욕설</option>
						<option value="badContents">부적절한 컨텐츠</option>
						<option value="spam">스팸성</option>
						<option value="badNick">부적절한 nick</option>
					</select> <select class="selectReason2" onchange="selectReason2()" name="nd_type" id = "co_nd_type">
						<option>선택해주세요</option>
					</select>

				</div>
				<div>
					<div class="reportdiv1">신고 사유</div>
					<textarea class="reportCommText" name="r_cont" cols="30" rows="5" placeholder="신고사유를 상세히 적어주세요." id = "co_report_cont"></textarea>
				</div>
			</div>
			<div class="reportCommbut">
				<button type="submit" class="rcsubmit postcommbut">신고하기</button>
			</div>
		</div>
	</div>
</form>
</body>

<script>

	//페이지 로드 할 때 좋아요 누른 여부 가져오기
	$(document).ready(function(){
		setting();
		adjustImgs();
		adjustReImgs();
		limitMenu();
		limitProfileShow();
	});
	
	//현재 로그인 아이디
	const curId = '<%=(String) session.getAttribute("userid")%>';
	//게시물 전체 이미지
	const allImg = $('.attach-div img');
	//리포스트 게시물 전체 이미지
	const allReImg = $('.re-attach-div img');
	//게시물 이미지 현재 인덱스
	let imgIdx = 0;
	// 리포스트 게시물 이미지 현재 인덱스
	let reImgIdx = 0;
	
	//게시물의 프로필사진 및 아이디 닉네임 클릭해서 해당 프로필로 이동
	$('.photo-div, .one-post-names').on('click', function() {
		$('#clicked-profile').submit();
	});
	//리포스트 게시물의 프로필사진 및 아이디 닉네임 클릭해서 해당 프로필로 이동
	$('.re-photo-div, .reposted-names').on('click', function() {
		$('#clicked-re-profile').submit();
	});
	//리포스트 게시물 클릭 시 해당 게시물로 이동
	$('.reposted-cont').on('click', function() {
		$('#clicked-repost').submit();
	});
	
	//게시물 작성자와 세션 아이디 비교해서 사용 가능한 메뉴 제한.
	function limitMenu() {
		if ('${proVO.id}' != curId) { // 게시물 작성자 아이디와 현재 로그인 아이디 다를 때 
			$('.one-post-menu-edit').remove();
			$('.one-post-menu-remove').remove();
		} else {
			$('.one-post-menu-report').remove();
			$('.one-post-menu-block').remove();
		}
	}
	// 게시물 작성자 프로필 클릭 시 이동할 페이지에 대한 form action 조정.
	function limitProfileShow() {
		if ('${proVO.id}' == curId) { // 게시물 작성자 아이디와 현재 로그인 아이디 같을 때
			$('#clicked-profile').attr('action', 'profileShow');
			$('#clicked-profile > input[type="hidden"]').attr('disabled', '');
		}
		if ('${reProVO.id}' == curId) { // 리포스트 게시물 작성자 아이디와 현재 로그인 아이디 같을 때
			$('#clicked-re-profile').attr('action', 'profileShow');
			$('#clicked-re-profile > input[type="hidden"]').attr('disabled', '');
		}
	}
	
	//...버튼 눌러서 메뉴 활성화 비활성화
	$('.one-post-menu svg').on('click', function() {
	    $(this).css('pointer-events', 'none');
	    onOffMenu();
	    $(this).css('pointer-events', 'auto');
	});
	function onOffMenu() {
		let status = $('.one-post-menu-box').css('display');
	    if (status.indexOf('block') == -1) {
	        $('.one-post-menu-box').css('display', 'block');
	    } else {
	        $('.one-post-menu-box').css('display', 'none');
	    }
	}
	// 메뉴 클릭 시 이벤트 처리
	$('.one-post-menu-box button').on('click', function() {
		let status = $(this).attr('class');
		if (status.indexOf('edit') != -1) { // edit 클릭
			$('.contents-span').css('display', 'none');
			$('.edit-contents-textarea').css('display', 'block');
			$('.interactions-span svg, .interactions-span span').css('display', 'none');
			$('.interactions-span button[class^=edit-]').css('display', 'block');
		} else if (status.indexOf('remove') != -1) { // remove 클릭
			if (confirm('해당 작업은 되돌릴 수 없습니다. 게시물을 삭제하시겠습니까?')) {
				deletePost();
			}
		} else if (status.indexOf('report') != -1) { // report 클릭
			
		} else if (status.indexOf('block') != -1) { // block 클릭
			blockUser();
		}
		onOffMenu();
	});
	// edit 버튼 클릭 후 동작 제어.
	$('.interactions-span button[class^=edit-]').on('click', function() {
		let status = $(this).attr('class');
		console.log(status);
		if (status.indexOf('confirm') != -1) { // edit post 버튼 클릭 시
			if ($.trim($('.edit-contents-textarea').val()) == '') { // 빈칸 입력 시
				alert('게시물은 필수로 작성해야 합니다.');
			} else if (confirm('게시물을 수정하시겠습니까?')) { // 수정 확인 창
				updatePost();
			}
		} else if (status.indexOf('cancel') != -1) { // cancel post 버튼 클릭 시
			if (confirm('수정한 내용이 저장되지 않습니다. 취소하시겠습니까?')) {
				location.reload(true);
			}
		}
	});
	
	function updatePost() {
		$.ajax({
			url: 'edit-save',
			type: 'post',
			data: {
				no: '${postvo.no}',
				cont: $.trim($('.edit-contents-textarea').val())
			},
			success: function(result) {
				if (result == 1) {
					location.reload(true);
				} else {
					alert('잠시 후 다시 시도해주세요.');
				}
			},
			error: function() {
				alert('잠시 후 다시 시도해주세요.');
			}
		});
	}
	function deletePost() {
		$.ajax({
			url: 'delete-post',
			type: 'get',
			data: {
				no: '${postvo.no}'
			},
			success: function() {
				location.href="/sns/main";
			},
			error: function() {
				alert('잠시 후 다시 시도해주세요.');
			}
		});
	}
	function blockUser() {
    	if (confirm('차단한 유저의 게시물이 더 이상 표시되지 않습니다.\n차단하시겠습니까?')) {
    		let bId = '${postvo.id}';
        	let blockReason = prompt('차단 사유를 입력해주세요. 서비스 개선에 도움이 됩니다.', '');
        	
        	$.ajax({
        		url: '/sns/block',
        		type: 'get',
        		data: {
        			blockId: bId,
        			reason: blockReason
        		},
        		success: function() {
        			location.href = '/sns/main';
        		},
        		error: function() {
        			alert('잠시 후 다시 시도해주세요.');
        		}
        	});
    	}
    }
	//리포스트 아이콘 클릭 시 해당 게시물 리포스트 되도록.
	$('#interactions-svg-repost').on('click', function() {
		$(this).css('pointer-events', 'none'); // 여러번 클릭 방지.
		location.href = `/sns/reposting?no=${postvo.no}`;
	});

	
	
	//게시물 사진 css 적용
	function adjustImgs() {
	    allImg.css('display', 'none');
	    if (allImg.length != 0) {
	        for (let one of allImg) {
	            let imgObj = new Image();
	            imgObj.src = one.getAttribute('src');
	            imgObj.onload = function() {
	                let width = this.width;
	                let height = this.height;
	                let ratio; // 기존 대비 사진 크기 증감 비율.
	                if (width >= height) {
	                    ratio = 550/width;
	                    let changedTop = ((550-height*ratio)/2) + 'px';
	                    one.style.width = '100%';
	                    one.style.height = 'auto';
	                    one.style.top = changedTop;
	                    one.style.left = '0';
	                } else {
	                    ratio = 550/height;
	                    let changedLeft = ((550-width*ratio)/2) + 'px';
	                    one.style.width = 'auto';
	                    one.style.height = '100%';
	                    one.style.top = '0';
	                    one.style.left = changedLeft;
	                }
	            }
	        }
	        allImg.eq(0).css('display', '');
	    }
	}
	//리포스트 게시물 사진 css 적용
    function adjustReImgs() {
        allReImg.css('display', 'none');
        if (allReImg.length != 0) {
            for (let one of allReImg) {
                let imgObj = new Image();
                imgObj.src = one.getAttribute('src');
                imgObj.onload = function() {
                    let width = this.width;
                    let height = this.height;
                    let ratio;
                    if (width >= height) {
                        ratio = 200/width;
                        let changedTop = ((200-height*ratio)/2) + 'px';
                        one.style.width = '100%';
                        one.style.height = 'auto';
                        one.style.top = changedTop;
                        one.style.left = '0';
                    } else {
                        ratio = 200/height;
                        let changedLeft = ((200-width*ratio)/2) + 'px';
                        one.style.width = 'auto';
                        one.style.height = '100%';
                        one.style.top = '0';
                        one.style.left = changedLeft;
                    }
                }
            }
            allReImg.eq(0).css('display', '');
        }
    }

	// 게시물 사진의 버튼 눌러서 이미지 변경
	$('button[class^=arrow-]').on('click', function() {
	    for (let img of allImg) {
	        img.style.display = 'none';
	    }
	    if ($(this).attr('class').indexOf('left') != -1) {
	        if(--imgIdx < 0) {
	            imgIdx = allImg.length - 1;
	        }
	    } else {
	        if(++imgIdx > allImg.length - 1) {
	            imgIdx = 0;
	        }
	    }
	    allImg.eq(imgIdx).css('display', '');
	});
	//리포스트 게시물 있을 경우 사진 버튼 눌러서 이미지 변경
    $('button[class^=re-arrow-]').on('click', function() {
        for (let img of allReImg) {
            img.style.display = 'none';
        }
        if ($(this).attr('class').indexOf('left') != -1) {
            if(--reImgIdx < 0) {
                reImgIdx = allReImg.length - 1;
            }
        } else {
            if(++reImgIdx > allReImg.length - 1) {
                reImgIdx = 0;
            }
        }
        allReImg.eq(reImgIdx).css('display', '');
    });
	
	
	function showSheet(){
		document.getElementById("moveSheet").classList.add("active");
	}
	// 게시물 작성자 프로필 클릭 시 이동할 페이지에 대한 form action 조정.
	function limitProfileShow() {
		if ('${proVO.id}' == curId) { // 게시물 작성자 아이디와 현재 로그인 아이디 같을 때
			$('#clicked-profile').attr('action', 'profileShow');
			$('#clicked-profile > input[type="hidden"]').attr('disabled', '');
		}
		if ('${reProVO.id}' == curId) { // 리포스트 게시물 작성자 아이디와 현재 로그인 아이디 같을 때
			$('#clicked-re-profile').attr('action', 'profileShow');
			$('#clicked-re-profile > input[type="hidden"]').attr('disabled', '');
		}
	}
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
		let lovenum = $(".like-cnt-span").text();
		if($(".p_lovehid"+no).val()== 0) {
			$(".p_lovehid"+no).val(1)
			$(".p_lovebut"+no).html(`<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
					</svg>`)
			$(".like-cnt-span").text(Number(lovenum)+1);	
			loveAjax(no);
		}else {
			$(".p_lovehid"+no).val(0)
			$(".like-cnt-span").text(Number(lovenum)-1);
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
	
	$(".rpsubmit").click(function() {
	    // 폼 제출 이벤트 처리
	    $('#postreportform').submit(function(event) {
	        // 폼 제출을 중단하여 기본 동작을 막음
	        event.preventDefault();
	        
	        // 폼 데이터를 직렬화(serialization)하여 변수에 저장
	        var formData = $(this).serialize();
	        if(chkPostreport()) {
	        	// AJAX 요청 설정
	            $.ajax({
	                type: 'POST',
	                url: 'reportPost', // 폼 데이터를 처리할 서버 측 URL
	                data: formData, // 직렬화한 폼 데이터
	                success: function(response) {
	                    // 성공적으로 응답을 받았을 때 할 일
	                    alert('신고가 완료되었습니다.');
	                	$(".modal_Post").css("display","none");
	                	$("#commreportform")[0].reset();
	            		$("#postreportform")[0].reset();
	                },
	                error: function(xhr, status, error) {
	                    // 오류 발생 시 처리할 코드
	                    alert('오류 발생: ' + error);
	                }
	            });
	        }else {
	        	alert("필수 입력해주세요.")
	        }
	        
	    });
	});   
	$(".rcsubmit").click(function() {
	    $('#commreportform').submit(function(event) {
	        // 폼 제출을 중단하여 기본 동작을 막음
	        event.preventDefault();
	        
	        // 폼 데이터를 직렬화(serialization)하여 변수에 저장
	        var formData = $(this).serialize();
	        if(chkCommreport()) {
	        	// AJAX 요청 설정
	            $.ajax({
	                type: 'POST',
	                url: 'reportPost', // 폼 데이터를 처리할 서버 측 URL
	                data: formData, // 직렬화한 폼 데이터
	                success: function(response) {
	                    // 성공적으로 응답을 받았을 때 할 일
	                    alert('신고가 완료되었습니다.');
	                    $(".modal_Comm").css("display","none");
	                    $("#commreportform")[0].reset();
	                    $("#postreportform")[0].reset();
	            		
	                },
	                error: function(xhr, status, error) {
	                    // 오류 발생 시 처리할 코드
	                    alert('오류 발생: ' + error);
	                }
	            });
	        }else {
	        	alert("필수 입력해주세요.")
	        }
	        
	    });
	});

	// 모달    
	const modal_Comm = document.querySelector('.modal_Comm');
	const modal_Post = document.querySelector('.modal_Post');

	function openreportmodal(c_no,id,c_cont) {
		modal_Comm.style.display="flex";
		$(".rc_id").text(id);
		$(".rc_cont").text(c_cont);
		console.log($(".rc_id").text());
		let a = $(".rc_id").text(); 
		$("#reportC_id").val(a);
	}

	function reportPostbut(no) {
		$(".report_no").val(no);
		modal_Post.style.display="flex";
		
	}


	$(".closeModal").click(function() {
		$(".modal_Comm").css("display","none");
		$(".modal_Post").css("display","none");
		// 폼 태그 안에 값들 리셋
		$("#commreportform")[0].reset();
		$("#postreportform")[0].reset();
		
	});
		// 댓글 신고
		function selectReason() {
			let reason = $(".selectReason").val();
			var badContents = ["폭력적 컨텐츠","선정적 컨텐츠","기타"];
			var spam = ["과도한 횟수","광고","기타"];
			var badNick = ["불쾌감 유발 닉네임","선정적닉네임","차별적 닉네임","기타"];
			var changeItem;
			
			if(reason == "curse") {
				
				$(".selectReason2").val("curse");
				$(".reportCommText").css("display","block");
				$(".reportCommbut").css("display","block");
				$(".selectReason2").css("display","none");
			}else if(reason == "badContents") {
				$(".selectReason2").css("display","inline-block");
				changeItem = badContents;
				$('.selectReason2').children('option:not(:first)').remove();
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");               
					option.val(changeItem[i]);
					$('.selectReason2').append(option);
				}

			}else if(reason == "spam") {
				$(".selectReason2").css("display","inline-block");
				changeItem = spam;
				$('.selectReason2').children('option:not(:first)').remove();  
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");       
					option.val(changeItem[i]);
					$('.selectReason2').append(option);
				}
			}else if(reason == "badNick") {
				$(".selectReason2").css("display","inline-block");
				changeItem = badNick;
				$('.selectReason2').children('option:not(:first)').remove();  
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");     
					option.val(changeItem[i]);  
					$('.selectReason2').append(option);
				}
			}
		}
			
		
		function selectReason2() {
			let reason2 = $(".selectReason2").val();
			
			if(reason2 != "" && reason2 != "선택해주세요") {
				$(".reportCommText").css("display","block");
				$(".reportCommbut").css("display","block");
			} 
		}
		
		// 글 신고
		function selectReasonPost() {
			let reason = $(".selectReasonPost").val();
			var badContents = ["폭력적 컨텐츠","선정적 컨텐츠","기타"];
			var spam = ["과도한 횟수","광고","기타"];
			var badNick = ["불쾌감 유발 닉네임","선정적 닉네임","차별적 닉네임","기타"];
			var changeItem;
			
			if(reason == "curse") {
				console.log(reason);
				$(".selectReasonPost2").val("curse");
				$(".reportPostbut").css("display","block");
				$(".reportPostText").css("display","block");
				$(".selectReasonPost2").css("display","none");
			}else if(reason == "badContents") {
				$(".selectReasonPost2").css("display","inline-block");
				changeItem = badContents;
				$('.selectReasonPost2').children('option:not(:first)').remove();
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");   
					option.val(changeItem[i]);            
					$('.selectReasonPost2').append(option);
				}

			}else if(reason == "spam") {
				$(".selectReasonPost2").css("display","inline-block");
				changeItem = spam;
				$('.selectReasonPost2').children('option:not(:first)').remove();  
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");       
					option.val(changeItem[i]);
					$('.selectReasonPost2').append(option);
				}
			}else if(reason == "badNick") {
				$(".selectReasonPost2").css("display","inline-block");
				changeItem = badNick;
				$('.selectReasonPost2').children('option:not(:first)').remove();  
				for(var i = 0; i < changeItem.length;i++) {
					var option = $("<option>"+changeItem[i]+"</option>");   
					option.val(changeItem[i]);    
					$('.selectReasonPost2').append(option);
				}
			}
			
			
		}
		function selectReasonPost2() {
			let reason2 = $(".selectReasonPost2").val();
			
			if(reason2 != "" && reason2 != "선택해주세요") {
				$(".reportPostText").css("display","block");
				$(".reportPostbut").css("display","block");
			} 
		}

		
		// 글 신고 체크
		function chkPostreport() {
			let st = $("#re_st_type").val();
			let nd = $("#re_nd_type").val();
			let rept = $("#report_cont").val();
			if(nd == "선택해주세요" || rept == "") {
				if(st=="curse") {
					return true;	
				}
				return false;
			} else {
				return true;
			}
		}
		// 댓글 신고 체크
		function chkCommreport() {
			let st = $("#co_st_type").val();
			let nd = $("#co_nd_type").val();
			let rept = $("#co_report_cont").val();
			if(nd == "선택해주세요" || rept == "") {
				if(st=="curse") {
					return true;	
				}
				return false;
			} else {
				return true;
			}
		}
</script>
</html>



