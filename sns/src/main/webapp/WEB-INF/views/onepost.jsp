<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<link rel="stylesheet" href="/sns/resources/css/onepost.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<body class="theme">
	<div id="all">
		<div id="menuall">
			<%@ include file="menuAll.jsp"%>
		</div>
		<div id="main">
		    <div class="one-post-container">
		        <div class="one-post-photo">
		            <div class="photo-div">
		                <img src="../4262a568-2b47-4df4-b332-66fdf47ac9ac.png">
		            </div>
		        </div>
		        <div class="one-post-names">
		            <span class="nickname-span">bluewhale332</span>
		            <span class="id-span">brian332</span>
		        </div>
		        <div class="one-post-menu">
		            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots"
		                viewBox="0 0 16 16">
		                <path
		                    d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
		            </svg>
		            <div class="one-post-menu-box">
		                <button type="button" class="theme">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
		                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
		                    </svg>
		                    EDIT
		                </button>
		                <button type="button" class="theme">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
		                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
		                    </svg>
		                    REMOVE
		                </button>
		                <button type="button" class="theme">
		                    REPORT...
		                </button>
		            </div>
		        </div>
		        <div class="one-post-cont">
		            <span class="contents-span">
		                if you can see this, the documents are working really well.
		                how lucky you are!
		                if you can see this, the documents are working really well.
		                how lucky you are!<br>
		                if you can see this, the documents are working really well.
		                how lucky you are!<br>
		                if you can see this, the documents are working really well.
		                how lucky you are!<br>
		            </span>
		        </div>
		        <div class="one-post-space"></div>
		        <div class="one-post-attach">
		            <div class="attach-div">
		                <button class="arrow-left">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
		                        class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
		                        <path fill-rule="evenodd"
		                            d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
		                    </svg>
		                </button>
		                <img src="/sns/resources/img/프로필.png">
		                <img src="../4297e3fa-661e-446c-81da-071cb32b8271.png">
		                <img src="../f4e02c40-da48-4722-b1e1-281820fa655c.jpg">
		                <button class="arrow-right">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
		                        class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
		                        <path fill-rule="evenodd"
		                            d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
		                    </svg>
		                </button>
		            </div>
		        </div>
		        <div class="one-post-reposted">
		            <div class="reposted-div">
		                <span class="reposted-mark-span">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
		                    	<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/>
		                	</svg>
		                    REPOSTED
		                </span>
		                <div class="reposted-container">
		                    <div class="reposted-attach">
		                        <div class="re-attach-div">
		                            <img src="../4262a568-2b47-4df4-b332-66fdf47ac9ac.png">
		                        </div>
		                    </div>
		                    <div class="reposted-photo">
		                        <div class="re-photo-div">
		                            <img src="../f4e02c40-da48-4722-b1e1-281820fa655c.jpg">
		                        </div>
		                    </div>
		                    <div class="reposted-names">
		                        <span class="re-nickname-span">bluewhale332</span>
		                        <span class="re-id-span">brian332</span>
		                    </div>
		                    <div class="reposted-cont">
		                        <span class="re-contents-span">
		                            and if you also can see this properly, this document is doing really good!
		                        </span>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="one-post-interactions">
		            <span class="interactions-span">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
		                    viewBox="0 0 16 16">
		                    <path
		                        d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
		                </svg>
		                <span class="like-cnt-span">100</span>
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
		                    class="bi bi-chat-right-dots" viewBox="0 0 16 16">
		                    <path
		                        d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z" />
		                    <path
		                        d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
		                </svg>
		                <span class="comm-cnt-span">100</span>
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
		                    <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/>
		                </svg>
		                <span class="repost-cnt-span">100</span>
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
		                    <path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1M8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5 5 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.6 2.6 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046zm2.094 2.025"/>
		                </svg>
		                <span class="show-cnt-span">100</span>
		            </span>
		        </div>
		    </div>
	    </div>
	</div>
</body>

<script>
	const allImg = $('.attach-div img');
	let imgIdx = 0;
	
	$(document).ready(function() {
	    adjustImgs();
	});
	
	$('.one-post-menu svg').on('click', function() {
	    $(this).css('pointer-events', 'none');
	    let status = $('.one-post-menu-box').css('display');
	    if (status.indexOf('block') == -1) {
	        $('.one-post-menu-box').css('display', 'block');
	    } else {
	        $('.one-post-menu-box').css('display', 'none');
	    }
	    $(this).css('pointer-events', 'auto');
	});
	
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

</script>



</html>