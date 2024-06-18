<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/css/findPw.css">
</head>
<body>
    
    <div id = "loginbox">
        <label id ="wel">MOMENTUM</label> <label id="findPW">비밀번호 찾기</label>
        <div id = "id"><span class = "loginlabel">아이디</span><span class="essential">*</span><br>
            <input type="text" name="id" placeholder="아이디를 입력하세요" class = "logintxt" id="inid">
        </div>
        <div class="intext" id = "emaildiv">
            <span class="loginlabel">이메일 </span><span class="essential">*</span><br> <input type="text" name="email" placeholder="이메일 입력" class="emailInput"><span id="em">@</span> <input class="box" id="domain-txt" type="text"> <select class="box" id="domain-list">
                <option value="type">직접 입력</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="nate.com">nate.com</option>
                <option value="kakao.com">kakao.com</option>
            </select> <input type="text" name="certify" class="cerInput" placeholder="인증번호 6자리"><input type="button" value="인증번호 받기" id="certifybut"><input type="button" value="이메일 인증" id="chknumbut"> <input type="hidden" id="emailDoubleChk" />
        </div>
        <div id = "findbut">
            <input type =button value ="비밀번호 찾기" id = "loginbut" onclick = "chk()">
        </div>
        <div id = "jointext">
            <span style="color: #00f7ff;">계정이 있으신가요? </span>&nbsp<a href = "join" class="alink"><span id = "spanlink">로그인하기</span></a>
        </div>
    </div>



<form action="loginpwupdate" method = "post" onsubmit="return chkpw()">

    <div id = "resetbox">
    <input type = hidden value="" id = "changeid" name = "id">
        <label id ="wel">MOMENTUM</label><label id="resetPW">비밀번호재설정</label>
        <div id = "repw"><span class = "loginlabel">새 비밀번호</span>
        <p class="arrow_box">
					영문, 숫자, 특수기호 1개 이상 포함 조합<br>8자 글자 이상 16글자 이하
		</p><span class="essential">*</span><br>
            <input type="password" placeholder="비밀번호를 재설정하세요" class = "logintxt" id="reinpw" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" title="영문, 숫자, 특수기호 1개 이상 포함 조합 ,8자 글자 이상 16글자 이하" name = "pass">
        </div>
        <div id = "rerepw"><span class = "loginlabel">새 비밀번호 확인</span><span class="essential">*</span><br>
            <input type="password" placeholder="비밀번호를 다시한번 입력하세요" class = "logintxt" id="rechkpw">
        </div>
        <div id = "resetpwbut">
            <input type ="submit" value ="비밀번호 바꾸기" id = "changebut">
        </div>
        <div id = "jointext">
            <span style="color: #00f7ff;">계정이 있으신가요? </span>&nbsp<a href = "join" class="alink"><span id = "spanlink">로그인하기</span></a>
        </div>
    </div>
    </form>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
</body>
<script>

//도메인 직접 입력 or domain option 선택
		const domainListEl = document.querySelector('#domain-list')
		const domainInputEl = document.querySelector('#domain-txt')
	// select 옵션 변경 시
		domainListEl.addEventListener('change', (event) => {
		// option에 있는 도메인 선택 시
		if(event.target.value !== "type") {
	// 선택한 도메인을 input에 입력하고 disabled
		 domainInputEl.value = event.target.value
		 domainInputEl.disabled = true
	 	} else { // 직접 입력 시
	 	// input 내용 초기화 & 입력 가능하도록 변경
		domainInputEl.value = ""
		domainInputEl.disabled = false
		}
	})
	// 비번 일치 체크
    function chkpw() {
		let pw = $('#reinpw').val();
		let pwchk = $('#rechkpw').val();
		
		if(pw!=pwchk) {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		return true;
	}
	// submit시 유효성 체크
	function chk() {
	    
	    let id = $('#inid').val();
	    if($("#emailDoubleChk").val()==false) {
	    	alert("이메일 인증이 필요합니다.")
	    	return 0;
	    }
	    	if(id.trim() == '') {
	    		alert("필수 입력하세요")
	        	return 0;
	        }
	    
	    $.ajax({
			type:"GET",
			url:"loginidchk?id="+id,
			cache : false,
			success:function(data) {
				if(data=="empty") {
					alert("존재하지않는 아이디입니다.");
				}
				else if(data != "empty") {
			    	$("#resetbox").css("display", "block");	
			    	$("#changeid").val(id);
			    }
		        
				}
		 })
		 
		
	    
	    return true;
	    
	}
	
	
	 // 이메일 인증
	var code = "";
	 $("#certifybut").click(function() {
		
		let id = $('#inid').val();
		let address = $('.emailInput').val();
		let domain = $('#domain-txt').val();
		let email = address + "@" + domain;
		if(address=="" || domain=="") {
			alert("이메일을 입력하세요")
			return false;
		}
		 $.ajax({
			type:"GET",
			url:"sendMail.do?email="+email+"&id="+id,
			cache : false,
			success:function(data) {
				if(data != "null") {
					alert("인증번호 발송이 완료되었습니다. 입력한 이메일에서 확인 해주십시오.");
					code = data;
					$("#emailhid").val(email);	
				}else {
					alert("아이디/이메일이 알맞지 않습니다.");
				}
				
				}
		 })
	 });
	 // 이메일 인증 체크
	 $("#chknumbut").click(function() {
		 if($(".cerInput").val()== "") {
			 alert("인증번호를 입력해주세요.");
		 }else if($(".cerInput").val() == code) {
			 alert("인증되었습니다.");
			 $("#emailDoubleChk").val("true");
			 document.querySelector('.cerInput').setAttribute('readonly',true);
		 }
		 else {
			 alert("인증번호가 일치하지 않습니다.");
		 }
	 })
</script>   
</html>