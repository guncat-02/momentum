<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!--다크 테마 기본 값-->
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<!--현재 테마 여부. 0 : 다크, 1 : 라이트-->
<input type="hidden" id="cur-theme" value="0">
<link rel="stylesheet" href="./resources/css/main.css">

<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <main>
                <h1 class="theme-font">HELLO WORLD</h1>
                <!--테마 변경은 추후 설정 화면에서 제어-->
                <input type="button" value="themechange" id="btn">
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


</script>
</html>