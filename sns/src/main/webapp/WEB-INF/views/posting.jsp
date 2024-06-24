<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

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
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <form action="postingSave" method="post" encType="multipart/form-data">
            	<input type="hidden" name="id" value="<%=(String)session.getAttribute("userid") %>">
                <!--글 작성, 사진 등록 하는 회색 테두리 화면-->
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
                    </div>
                </div>
                <div id="bottom">
                    <span id="privacy-setting">
                        게시물 공개 여부
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="0">비공개
                        </label>
                        <label class="privacy-label">
                            <input type="radio" name="privacy" value="1" checked>공개
                        </label>
                    </span>
                    <button type="button" id="postbtn" class="theme theme-font">
                        <h1>POST ></h1>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>


<script>
	
	$('#postbtn').on('dblclick', function() {
		document.querySelector('#postbtn').setAttribute('disabled', '');
		if ($.trim($('#create-post-cont').val()) != '') {
			let fList = $('.attach-one-div .file');
			for (let f of fList) {
				if (f.files.length != 0) {
					f.removeAttribute('disabled');
				} else {
					f.setAttribute('disabled', '');
				}
			}
			$('form').submit();
		}
		document.querySelector('#postbtn').removeAttribute('disabled');
	});
	
	$('.privacy-label').on('click', function() {
	    $('.privacy-label').css('color','');
	    if ($('#theme-setting').prop('href').indexOf('dark') != -1){
	        $(this).css('color', '#00f7ff');
	    }
	});

    // input file 미리보기
    $('#create-post-attach').on('change', '.file', function (e) {
        if (attachValid(e)) {
            let thisFile = $(this);
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
                    thisFile.attr('disabled', '');
                    thisFile.closest('label').css('cursor', 'default');
                    let delBtn = '<button type="button" class="delAttach theme">X</button>';
                    thisFile.closest('label').append(delBtn);
    
                    if ($('#create-post-attach .attach-one-div').length != 5) {
                        let newDiv = '<div class="attach-one-div"><label>파일<input type="file" name="file" class="file" accept=".gif, .jpg, .png"></label></div>'
                        $('#create-post-attach').append(newDiv);
                    }
                }
            }
            reader.readAsDataURL(e.target.files[0]);
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

</script>

</html>