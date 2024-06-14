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
    #member-info-table {
        display: block;
        width: auto;
        height: fit-content;
    }

    #member-info-table table {
        width: 100%;
        height: fit-content;
        border: 1px solid grey;
        border-radius: 15px;
        padding: 10px;
        margin-bottom: 50px;
    }

    #member-info-table thead tr td {
        font-size: 25px;
        font-weight: bolder;
        padding-bottom: 30px;
    }

    #member-info-table tr {
        height: 30px;
    }

    #pass-certified>td:first-child {
        width: 50%;
    }

    #member-info-table .cont-title {
        font-size: 20px;
        padding-top: 15px;
    }

    .member-info-btns {
        width: 15%;
    }

    .member-info-btns button {
        width: 100%;
        height: 30px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
    }

    .member-info-btns button:not([class="delete-account"]):hover {
        transition-duration: 250ms;
        filter: invert(100%);
    }

    input[type=text],input[type=password] {
        width: 98.5%;
        height: 25px;
        border-radius: 8px;
    }

    input[type=text]:-webkit-autofill,
    input[type=text]:-webkit-autofill:hover,
    input[type=text]:-webkit-autofill:focus,
    input[type=text]:-webkit-autofill:active,
    input[type=password]:-webkit-autofill,
    input[type=password]:-webkit-autofill:hover,
    input[type=password]:-webkit-autofill:focus,
    input[type=password]:-webkit-autofill:active {
        -webkit-text-fill-color: #00f7ff;
        -webkit-box-shadow: 0 0 0 1000px transparent inset;
        box-shadow: 0 0 0 1000px transparent inset;
        transition: background-color 5000s ease-in-out 0s;
    }

    .delete-account {
        border: 1px solid red;
        background-color: transparent;
        color: rgb(255, 50, 50);
    }

    .delete-account:hover {
        transition-duration: 250ms;
        background-color: red;
        color: black;
    }

    /* 계정 삭제 시 화면 가운데에 뜨는 팝업 */
    #b {
        height: 100vh;
        width: 100vw;
        position: fixed;
        top: 0;
        left: 0;
        background-color: rgba(128, 128, 128, 0.527);
        display: none;
    }
    #popup {
        position: absolute;
        width: 500px;
        height: 300px;
        top: 50%;
        margin-top: -150px;
        left: 50%;
        margin-left: -250px;
        border-radius: 15px;
    }
    #popup table {
        width: 90%;
        height: 100%;
        border-radius: 15px;
        padding: 10px;
        border-collapse: collapse;
        margin: auto;
    }

    /* caution */
    #popup table thead {
        font-size: 25px;
        color: red;
        height: 25%;
    }

    #popup table td {
        text-align: center;
    }

    #popup table .delete-btns td {
        height: 15%;
    }

</style>

<body class="theme">
    <div id="member-info-table">
        <table>
            <thead>
                <tr>
                    <td colspan="3">
                        정보 수정
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="3" class="cont-title">비밀번호 변경</td>
                </tr>
                <tr>
                    <td colspan="2">
                        비밀번호 변경은 이메일 인증 절차를 필요로 합니다.
                    </td>
                    <td class="member-info-btns">
                        <button type="button" class="theme theme-border" id="change-pass">비밀번호 변경</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="cont-title">
                        이름 변경
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;">
                        이름 변경은 비밀번호 인증 절차를 필요로 합니다.
                    </td>
                    <td>
                        <input type="password" name="pass" id="passtext" class="theme theme-border"
                            placeholder="여기에 비밀번호 입력">
                    </td>
                    <td class="member-info-btns">
                        <button type="button" class="theme theme-border" id="change-name">비밀번호 확인</button>
                    </td>
                </tr>
                <tr id="pass-certified" style="display: none;">
                    <td>
                        변경할 이름을 작성한 후 '이름 변경' 버튼을 누르세요.
                    </td>
                    <td>
                        <input type="text" name="name" id="nametext" class="theme theme-border" placeholder="여기에 이름 입력">
                    </td>
                    <td class="member-info-btns">
                        <button type="button" id="change-name-complete" class="theme theme-border">이름 변경</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <table id="danger-zone" style="border: 1px solid red;">
            <thead>
                <tr>
                    <td colspan="3" style="color: rgb(255, 50, 50);">
                        DANGER ZONE
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="3" class="cont-title">
                        계정 삭제
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="color: rgb(255, 50, 50);">
                        프로필을 포함한 모든 정보를 삭제합니다.
                    </td>
                    <td class="member-info-btns">
                        <button type="button" id="want-deletion" class="delete-account">계정 삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="b">
        <div id="popup" class="theme">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">
                            CAUTION
                        </th>
                    </tr>
                </thead>
                <tbody class="before-deletion">
                    <tr>
                        <td colspan="2" style="height: 50%;">
                            계정 삭제 시, 프로필과 게시물을 포함한 계정의 모든 정보가<br>
                            <span style="color: red;"><u>즉시 삭제</u>되며, 다시 복구 할 수 없습니다.</span><br>
                            또한 MomentumSNS의 모든 기능을 이용 할 수 없게 됩니다.<br><br>
                            <b>정말 계정을 삭제하시겠습니까?</b>
                        </td>
                    </tr>
                    <tr class="delete-btns">
                        <td class="member-info-btns">
                            <button type="button" id="before-deletion-confirm-btn" class="delete-account">삭제</button>
                        </td>
                        <td class="member-info-btns">
                            <button type="button" id="before-deletion-cancel-btn" class="theme theme-border">취소</button>
                        </td>
                    </tr>
                </tbody>
                <%
                // Session의 id 및 nickname 값 저장.
                String id = (String)session.getAttribute("userid");
                String nickName = (String)session.getAttribute("nickName");
                %>
                <tbody class="on-deletion">
                    <tr>
                        <td style="height: 30%;" colspan="2">
                            아래의 문구를 정확히 따라 입력하여 삭제를 완료합니다.<br><br>
                            <!-- Session에서 가져온 값 활용 -->
                            <!-- <span id="idAndNick"><%=id %>/<%=nickName %> 계정을 삭제합니다.</span> -->
                            <span id="idAndNick">brian332/brian332 의 계정을 삭제합니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20%;" colspan="2">
                            <input type="text" id="idnicktext" class="theme theme-border">
                        </td>
                    </tr>
                    <tr class="delete-btns">
                        <td class="member-info-btns">
                            <button type="button" id="deletion-confirm-btn" class="delete-account">삭제</button>
                        </td>
                        <td class="member-info-btns">
                            <button type="button" id="deletion-cancel-btn" class="theme theme-border">취소</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

<script>

	// 두번째 계정 삭제 팝업 창 페이지 숨김
	$(document).ready(function() {
	    $('.on-deletion').css('display', 'none');
	});

	// 비밀번호 변경 클릭 시 이메일 인증 화면 이동
    $('#change-pass').on('click', function () {
        location.href = "/sns/loginFindId"
    });

	// 비밀번호 확인 클릭 시 비밀번호 확인, 이름 변경 input 드러냄
    $('#change-name').on('click', function () {
    	let passTr = $(this).closest('tr');
        $.ajax({
            url: 'settings_certifyPass',
            type: 'post',
            data: {
                id: 'brian332',
                pass: $('#passtext').val()
            },
            success: function (result) {
            	if (result == 1) {
            		passTr.css('display','none');
                    $('#pass-certified').css('display', '');
            	} else {
            		alert('잘못된 비밀번호입니다.');
            	}
            }
        });
    });
	// 이름 변경 클릭 시 이름 변경 및 css 변경
    $('#change-name-complete').on('click', function () {
    	let nameTr = $(this);
        $.ajax({
            url: 'settings_change_name',
            type: 'post',
            data: {
                id: 'brian332',
                name: $('#nametext').val()
            },
            success: function (result) {
                if (result == 1) {
                	nameTr.text('완료');
                	nameTr.css('border', '1px solid rgb(0, 255, 0)');
                	nameTr.css('color', 'rgb(0, 255, 0)');
                    $('#nametext').prop('disabled', 'true');
                    $('#nametext').css('border', '1px solid rgb(0, 255, 0)');
                    nameTr.closest('tr').find('td:first-child').text('완료되었습니다.');
                    nameTr.closest('tr').find('td:first-child').css('color', 'rgb(0, 255, 0)');
                } else {
                    alert('잠시 후 다시 시도해주세요.');
                    location.reload();
                }
            },
            error: function() {
            	alert('잠시 후 다시 시도해주세요.');
                location.reload();
            }
        });
    });
    
	// 계정 삭제 관련 코드
	// danger zone의 계정 삭제 버튼 클릭 시 팝업 창 띄운다
    $('#want-deletion').on('click', function () {
        $('#b').css('display', 'block');
    });
	// 팝업 창 첫번째 페이지의 삭제 버튼 클릭 시 두번째 페이지로 바꾼다
    $('#before-deletion-confirm-btn').on('click', function () {
        $('.before-deletion').css('display', 'none');
        $('.on-deletion').css('display', '');
    });
	// 팝업 창 첫번째 페이지의 취소 버튼 클릭 시 팝업 창 닫는다
    $('#before-deletion-cancel-btn').on('click', function () {
        $('#b').css('display', 'none');
    });
	// 팝업 창 두번째 페이지의 삭제 버튼 클릭 시
	$('#deletion-confirm-btn').on('click', function() {
		let input = $('#idnicktext').val();
		if ($.trim($('#idAndNick').text()) == input) {
			$.ajax({
				url: 'settings_delete_account',
				type: post,
				data: {
					id : 'brian332'
				},
				success: function(result) {
					if(result == 1) {
						alert('삭제되었습니다.');
						location.href='/sns';
					} else {
						alert('잠시 후 다시 시도해주세요.');
						location.reload();
					}
				},
				error: function() {
					alert('잠시 후 다시 시도해주세요.');
					location.reload();
				}
			});
		} else {
			alert('잘못 입력되었습니다.\n삭제 취소를 원할 경우 \'취소\' 버튼을 눌러주세요.');
		}
	});
	// 팝업 창 두번째 화면의 취소 버튼 클릭 시 input:text 값 지우고 팝업 창 닫는다
    $('#deletion-cancel-btn').on('click', function () {
        $('.before-deletion').css('display', '');
        $('.on-deletion').css('display', 'none');
        $('#idnicktext').text('');
        $('#b').css('display', 'none');
    });

</script>

</html>