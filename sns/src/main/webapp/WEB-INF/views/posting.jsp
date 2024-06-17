<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>momentum</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>

<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/posting.css">

<body class="theme">
<div>
		<c:if test="${userid != null }">
			<span> 사용자 정보 : ${userid } / ${username } / ${nickName }</span>
			<span><a href="/sns/logout">로그아웃</a></span>
		</c:if>
	</div>
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <form action="postingSave" method="post" encType="multipart/form-data">
                <!--글 작성, 사진 등록 하는 회색 테두리 화면-->
                <div id="create-post">
                    <!--글 작성 부분-->
                    <textarea id="create-post-cont" name="cont" class="theme" rows="8" placeholder="여기에 글 작성"
                        maxlength="100" required></textarea>
                    <!--사진 등록 부분-->
                    <div id="create-post-attach">
                        <!--사진 추가 영역-->
                        <div id="attach-add">
                            <label>
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
                                <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3"/>
                                <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2M14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1M2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1z"/>
                              </svg>
                                <input type="file" name="file" id="file" multiple>
                            </label>
                        </div>
                    </div>
                </div>
                <div id="bottom">
                    <span id="privacy-setting">
                        게시물 공개 여부
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="0">비공개
                        </label>
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="1" required>공개
                        </label>
                    </span>
                    <button type="submit" id="postbtn" class="theme theme-font">
                        <h1>POST ></h1>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>


<script>

	$('.privacy-label').on('click', function() {
	    $('.privacy-label').css('color','');
	    console.log($('#theme-setting').prop('href').indexOf('light'));
	    if ($('#theme-setting').prop('href').indexOf('dark') != -1){
	        $(this).css('color', '#00f7ff');
	    }
	});

    // 사진 등록 했을 때 사진 미리 보기
    $('#create-post-attach').on('change', '#attach-add', function (e) {
        if (attachValid(e)) { // 유효성 검사 함수 호출. true return 할 시 유효성 통과.
            // 사진 미리 보기
            for (let image of e.target.files) {
                let reader = new FileReader();
                reader.onload = function (ev) {
                    let div = '<div class="create-post-attach-one"><button type="button" class="delAttach theme">X</button><img src="'+ev.target.result+'" /></div>'
                    $('#attach-add').before(div);
                    // 총 사진 개수 5개일 때 '사진 추가' 라벨 안보이게
                    if ($('.create-post-attach-one').length == 5) {
                        $('#attach-add').css('display', 'none');
                    }
                }
                reader.readAsDataURL(image);
            }

        }
    });

	// 글 등록 시 사진 유효성.
    function attachValid(e) {
        if ($('.create-post-attach-one').length + e.target.files.length > 5) { // 사진 개수 5개 이하 제한.
            alert('사진은 최대 5개까지 업로드 할 수 있습니다.');
            return false;
        } else { // 사진 용량 개당 2MB 제한.
            let maxSize = 2 * (1024 ** 2); // 2MB 용량 제한.
            for (let file of e.target.files) {
                if (file.size > maxSize) {
                    alert('최대 2MB의 사진만 업로드 할 수 있습니다.');
                    return false;
                }
            }
        }
        return true;
    }
    // 사진 오른쪽 위 버튼 누를 시 해당 사진 삭제.
    $('#create-post-attach').on('click', '.delAttach', function () {
        $(this).closest('.create-post-attach-one').remove();
        $('#attach-add').css('display', 'inline-block');
    });

</script>
</html>