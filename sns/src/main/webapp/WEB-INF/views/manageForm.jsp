<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>


<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/manage.css">

<body class="theme">
    <div id="all">
        <div id="main">
            <main>
                <h1 class="theme-font">MANAGE PAGE</h1>
            </main>
            <div class = "container">
               <div class = "item">메뉴바</div>
               <div class = "item">회원관리</div>
               <div class = "item">검색 바</div>
               <div class = "item">결과값 테이블
                <div class="modal">
                    <div class="modal_popup">
                        <h3>모달 회원이 쓴 글</h3>
                        <p>이거 모달이거 써서 글 내용들 띄우기</p>
                        <button type="button" class="close_btn">닫기</button>
                    </div>
                </div>
                <!--end 모달 팝업-->
                <main>
                    <section>
                        <h2>모달 팝업</h2>
                        <button type="button" class="modal_btn">모달</button>
                    </section>
                </main>
               </div>
            </div>
        </div>
    </div>
    
</body>
</html>
<script>


//열기 버튼을 눌렀을 때 모달팝업이 열림
$(".modal_btn").click(function() {
    $(".modal").css("display","block");
});


//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
$(".close_btn").click(function() {
    $(".modal").css("display","none");
});

</script>