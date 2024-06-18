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
<style>
    #display-info-table {
        display: block;
        width: auto;
        height: fit-content;
        border-radius: 15px;
        padding: 10px;
        border: 1px solid grey;
    }

    #display-info-table table {
        width: 100%;
        height: fit-content;
        border-collapse: collapse;
    }


    #display-info-table thead tr td {
        font-size: 25px;
        font-weight: bolder;
        padding-bottom: 30px;
    }

    #display-info-table tr {
        height: 30px;
    }

    #display-info-table .cont-title {
        font-size: 20px;
        padding-top: 15px;
    }

    /* 라이트, 다크 토글 스위치 */
    .display-info-btns {
        width: 15%;
    }

    .display-info-btns label {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
        position: relative;
    }

    #light-dark-switch {
        appearance: none;
        position: relative;
        border: max(1px, 0.1em) solid black;
        border-radius: 1.25em;
        width: 10em;
        height: 2.5em;
    }

    #light-dark-switch:hover {
        cursor: pointer;
    }

    #light-dark-switch::before {
        content: "";
        position: absolute;
        left: 0.2em;
        top: 0.17em;
        width: 2em;
        height: 2em;
        border-radius: 50%;
        transform: scale(0.8);
        background-image: url('./resources/svg/sun-fill.svg');
        background-size: cover;
        transition: left 500ms ease-in-out;
    }

    #light-dark-switch:checked::before {
        background-image: url('./resources/svg/moon-fill.svg');
        background-size: cover;
        left: 7.5em;
    }

    #light-dark-switch:checked {
        background-color: black;
        border-color: white;
    }

    #current-theme {
        position: absolute;
        left: 3em;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    }
</style>
<body class="theme">
    <div id="display-info-table">
        <table>
            <thead>
                <tr>
                    <td colspan="3">
                        화면
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="3" class="cont-title">라이트 / 다크</td>
                </tr>
                <tr>
                    <td colspan="2">
                        다크 모드는 더 나은 경험을 제공 할 수 있습니다.
                    </td>
                    <td class="display-info-btns">
                        <label>
                            <input type="checkbox" role="switch" id="light-dark-switch">
                            <span id="current-theme">LIGHT</span>
                        </label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

<script>
    // 로컬 스토리지가 다크 모드를 저장하고 있을 경우 토글 스위치 디자인 변경
    $(document).ready(function() {
        if (localStorage.getItem('curTheme') == './resources/css/dark_theme.css') {
            $('#light-dark-switch').prop('checked', 'true');
            $('#current-theme').text('DARK');
        }
    });
    // 토글 스위치 누를 때 로컬 스토리지 값 변경, 화면 테마 변경
    $('#light-dark-switch').on('click', function () {
        $('#current-theme').text('');
        if ($(this).prop('checked')) {
            localStorage.setItem('curTheme', './resources/css/dark_theme.css');
            setTimeout(function () {
                $('#current-theme').text('DARK');
            }, 500);
        } else {
            localStorage.setItem('curTheme', './resources/css/light_theme.css');
            setTimeout(function () {
                $('#current-theme').text('LIGHT');
            }, 500);
        }
        $('#theme-setting').prop('href', localStorage.getItem('curTheme'));
    });
</script>
</html>