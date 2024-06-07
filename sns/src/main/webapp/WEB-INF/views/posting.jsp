<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<input type="hidden" id="cur-theme" value="0">
<link rel="stylesheet" href="./resources/css/posting.css">

<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <form action="postingSave" method="post" encType="multipart/form-data">
                <div id="cur-title">
                    <h1 class="theme-font">CREATE</h1>
                </div>
                <!--글 작성, 사진 등록 하는 회색 테두리 화면-->
                <div id="create-post" class="theme-border">
                    <!--글 작성 부분-->
                    <textarea id="create-post-cont" name="cont" class="theme" rows="8" placeholder="여기에 글 작성"
                        maxlength="100" required></textarea>
                    <hr>
                    <!--사진 등록 부분-->
                    <div id="create-post-attach">
                        <!--사진 추가 영역-->
                        <div id="attach-add">
                            <label>
                                사진 추가
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                    class="bi bi-plus-square" viewBox="0 0 16 16">
                                    <path
                                        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
                                    <path
                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                                </svg>
                                <input type="file" name="file" id="file" multiple>
                            </label>
                        </div>
                    </div>
                </div>
                <div id="btn">
                    <button type="submit" id="postbtn" class="theme theme-font">
                        <h1>CREATE ></h1>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>


<script>

    // 사진 등록 했을 때 사진 미리 보기
    $('#create-post-attach').on('change', '#attach-add', function (e) {
        if (attachMax(e)) { // 유효성 검사 함수 호출. true return 할 시 유효성 통과.
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

    // 글 등록 시 사진 개수 유효성.
    function attachMax(e) {
        if ($('.create-post-attach-one').length + e.target.files.length > 5) { // 사진 개수 5개 이하 제한.
            alert('사진은 최대 5개까지 업로드 할 수 있습니다.');
            return false;
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