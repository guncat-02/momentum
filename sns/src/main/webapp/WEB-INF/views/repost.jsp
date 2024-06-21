<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
<script src="/sns/resources/JS/setTheme.js"></script>
<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<link rel="stylesheet" href="/sns/resources/css/repost.css">
<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <form action="repostingSave" method="post" encType="multipart/form-data" onsubmit="return test()">
            	<input type="hidden" name="id" value="<%=(String)session.getAttribute("userid") %>">
                <!--글 작성, 사진 등록 하는 영역-->
                <div id="create-post">
                    <!--글 작성 부분-->
                    <textarea id="create-post-cont" name="cont" class="theme" rows="8" placeholder="여기에 글 작성"
                        maxlength="100" required></textarea>
                    <!--사진 등록 부분-->
                    <div id="create-post-attach">
                        <div class="attach-one-div">
                            <label>
                                <span>파일</span>
                                <input type="file" name="file" class="file" accept=".gif, .jpg, .png">
                            </label>
                        </div>
                        <!--여기에 사진 추가된다.-->
                    </div>

                    <!--여기부터 리포스트 되는 게시물 정보 띄운다-->
                    <div id="repost-grid-cont">
                        <div class="repost-grid-item">
                        	<input type="hidden" name="re_no" value="${map.rePVO.no }">
                            <div id="reposted-photo">
                                <div id="left-arrow">&lang;</div>
                                <c:if test="${not empty map.rePVO.filename }">
                                	<c:forEach items="${map.rePVO.filename }" var="file">
                                		<img src="download?filename=${file }">
                                	</c:forEach>
                                </c:if>
                                <div id="right-arrow">&rang;</div>
                            </div>
                        </div>
                        <div class="repost-grid-item" id="reposted-user">
                            <div id="reposted-user-photo">
                            	<c:choose>
	                            	<c:when test="${empty map.reProVO.photo }">
	                                	<img src="/sns/resources/img/프로필.png">
	                                </c:when>
	                                <c:otherwise>
	                                	<img src="download?filename=${map.reProVO.photo }">
	                                </c:otherwise>
                                </c:choose>
                            </div>
                            <div id="reposted-user-names">
                                <span id="reposted-user-nickname">${map.reProVO.nickName }</span>
                                (<span id="reposted-user-id">${map.reProVO.id }</span>)
                            </div>
                        </div>
                        <div class="repost-grid-item" id="reposted-cont">
                        	${map.rePVO.cont }
                        </div>
                    </div>
                </div>

                <!--분홍색 외부 영역-->
                <div id="bottom">
                    <span id="privacy-setting">
                        게시물 공개 여부
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="0" required>비공개
                        </label>
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="1">공개
                        </label>
                    </span>
                    <button type="submit" id="postbtn" class="theme theme-font">
                        <h1>REPOST ></h1>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
<script>

    const allImg = $('#reposted-photo img');
    let imgIdx = 0;

    // 메뉴 바 로드
    $(document).ready(function () {
        imgTest();
    });

    function imgTest() {
        allImg.css('display', 'none');
        console.log(allImg);
        if (allImg.length == 0) { // 리포스트 글에 사진 없을 경우
            $('.repost-grid-item:nth-child(1)').css('display', 'none');
            $('#repost-grid-cont').css('grid-template-columns', 'none');
        } else { // 리포스트 글에 사진 있을 경우
            for (let one of allImg) {
                let imgObj = new Image();
                imgObj.src = one.getAttribute('src');
                imgObj.onload = function() {
                    let width = this.width;
                    let height = this.height;
                    if (width >= height) {
                        one.style.width = 'auto';
                        one.style.height = '100%';
                    } else {
                        one.style.width = '100%';
                        one.style.height = 'auto';
                    }
                }
            }
            allImg.eq(0).css('display', '');
        }
    }

    // 화살표 눌러서 다른 사진 보기
    $('div[id$=-arrow]').on('click', function() {
        for (let img of allImg) {
            img.style.display = 'none';
        }
        if ($(this).attr('id').indexOf('left') != -1) {
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



    function test() {
        let fList = $('.attach-one-div .file');
        for (let f of fList) {
            if (f.files.length != 0) {
                f.removeAttribute('disabled');
            } else {
                f.setAttribute('disabled', '');
            }
        }
        return true;
    }

    $('.privacy-label').on('click', function () {
        $('.privacy-label').css('color', '');
        if ($('#theme-setting').prop('href').indexOf('dark') != -1) {
            $(this).css('color', '#00f7ff');
        }
    });

    // input file 미리보기
    $('#create-post-attach').on('change', '.file', function (e) {
        if (attachValid(e)) {
            let thisFile = $(this)
            let reader = new FileReader();
            reader.onload = function () {
                let im = document.createElement('img');
                im.setAttribute('src', reader.result);

                let img = new Image();
                img.src = reader.result;
                img.onload = function () {
                    let width = this.width;
                    let height = this.height;
                    if (width >= height) {
                        im.style.width = 'auto';
                        im.style.height = '100%';
                    } else {
                        im.style.width = '100%';
                        im.style.height = 'auto';
                    }
                    thisFile.closest('label').append(im);
                    thisFile.attr('disabled', 'true');
                    thisFile.closest('label').css('cursor', 'default');
                    let delBtn = `<button type="button" class="delAttach theme">X</button>`
                    thisFile.closest('label').append(delBtn);

                    if ($('#create-post-attach .attach-one-div').length != 5) {
                        let newDiv = `<div class="attach-one-div">
                            <label>
                                파일
                                <input type="file" name="file" class="file" accept=".gif, .jpg, .png">
                            </label>
                        </div>`;
                        $('#create-post-attach').append(newDiv);
                    }
                }
            }
            reader.readAsDataURL(e.target.files[0]);
        }
    });

    // 사진 삭제
    $('#create-post-attach').on('click', '.delAttach', function () {
        $(this).closest('.attach-one-div').remove();

        if ($('.attach-one-div:has(img)').length == 4) {
            let newDiv = `<div class="attach-one-div">
                <label>
                    파일
                    <input type="file" name="file" class="file">
                </label>
            </div>`;
            $('#create-post-attach').append(newDiv);
        }
    });

    // 글 등록 시 사진 유효성.
    function attachValid(e) {
        if ($('.attach-one-div').length > 5) { // 사진 개수 5개 이하 제한.
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

</script>
</html>