<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Momentum</title>
<link rel="stylesheet" href="./resources/css/Join.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">

</head>

<body>
	<form action="joinMember" method="post" id="form" onsubmit="return chk()">
		<div id="Joinbox">
			<label id="wel">MOMENTUM</label> <label id="joinwel">회원가입</label>
			<div class="intext">
				<span class="loginlabel idlebel">아이디</span>
				<p class="arrow_box">영문, 숫자 조합 ,3글자 이상 10글자 이하</p> <!-- 우효성 -->
				<span class="essential">*</span><br> <input type="text" name="id" placeholder="아이디를 입력하세요" class="logintxt tt" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{3,10}$" title="영문, 숫자 조합 ,3글자 이상 10글자 이하" id="idinput">
				<input type="button" value="중복체크" id="duplication"> <input type="hidden" value="false" id="chkdup">
			</div>
			<div class="intext">
				<span class="loginlabel pwlabel">비밀번호</span>
				<p class="arrow_box">
					영문, 숫자, 특수기호 1개 이상 포함 조합<br>8자 글자 이상 16글자 이하
				</p>
				<span class="essential">*</span><br> <input type="password" name="pass" placeholder="비밀번호를 입력하세요" class="logintxt tt upw" id="pw" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" title="영문, 숫자, 특수기호 1개 이상 포함 조합 ,8자 글자 이상 16글자 이하">
			</div>
			<div class="intext">
				<span class="loginlabel">비밀번호 확인 </span><span class="essential">*</span><br> <input type="password" name="pwchk" placeholder="비밀번호를 한번 더 입력하세요" class="logintxt tt upwchk" id="pwchk">
			</div>
			<div class="intext">
				<span class="loginlabel namelabel">사용자명 </span><span class="essential">*</span><br> <input type="text" name="name" placeholder="이름을 입력하세요" class="logintxt tt" id="uninput">
			</div>
			<div class="intext">
				<span class="loginlabel">이메일 </span><span class="essential">*</span><br> <input type="text" placeholder="이메일 입력" class="emailInput"><span id="em">@</span> <input class="box" id="domain-txt" type="text"> <select class="box" id="domain-list">
					<option value="type">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="kakao.com">kakao.com</option>
				</select> <input type="text" name="certify" class="cerInput" placeholder="인증번호 6자리"><input type="button" value="인증번호 받기" id="certifybut"><input type="button" value="이메일 인증" id="chknumbut"> 
				<input type="hidden" id="emailDoubleChk" />
				<input type = hidden value = "" name = email id = "emailhid">
			</div>
			<div class="intext">
				<span class="loginlabel">생년월일 </span><span class="essential">*</span><br> <select name="year" class="box" id="birth-year" class="tt">
					<option disabled selected>출생 연도</option>
				</select> <select name="month" class="box" id="birth-month" class="tt">
					<option disabled selected>월</option>
				</select> <select name="day" class="box" id="birth-day" class="tt">
					<option disabled selected>일</option>
				</select>
				<input type="hidden" value="" name="b_date" id = "bdate"/>
			</div>
			<div class="intext" id="joinbottom">
				<input type=submit value="회원가입" id="loginbut">
			</div>
			<div class="intext">
				<span style="color: #00f7ff">계정이 있으신가요? </span><a href="/sns/loginpage" class="alink"><span id="joinlink">로그인하기</span></a>
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
    
    
    const birthYearEl = document.querySelector('#birth-year')
    const birthMonthEl = document.querySelector('#birth-month')
    const birthDayEl = document.querySelector('#birth-day')
    
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	isMonthOptionExisted = false;
	isDayOptionExisted = false;
	
	
	birthYearEl.addEventListener('focus', function () {
  	// year 목록 생성되지 않았을 때 (최초 클릭 시)
  	if(!isYearOptionExisted) {
    	isYearOptionExisted = true;
    	for(var i = 1940; i <= 2024; i++) {
      	// option element 생성
      	const YearOption = document.createElement('option')
      	YearOption.setAttribute('value', i)
      	YearOption.innerText = i
      	// birthYearEl의 자식 요소로 추가
      	this.appendChild(YearOption);
    	}
  		} 
	});
	
	
	
	$("select[name=year]").change(function(){
		
		if(!isMonthOptionExisted) {
			let nowYear;
			let nowMonth;
			nowYear = $("select[name=year] option:selected").text();
			birthMonthEl.addEventListener('focus', function () {
		    	if(!isMonthOptionExisted) {
		      		isMonthOptionExisted = true
		      		for(var i = 1; i <= 12; i++) {
		        	const MonthOption = document.createElement('option')
		        	MonthOption.setAttribute('value', i)
		        	MonthOption.innerText = i
		       		this.appendChild(MonthOption);
		        	$("select[name=month]").change(function(){
		    			nowMonth = $("select[name=month] option:selected").text();
		    			const lastDay = new Date(nowYear, nowMonth, 0).getDate();
		    			birthDayEl.addEventListener('focus', function () {
		    			    if(!isDayOptionExisted) {
		    			     	 isDayOptionExisted = true
		    			     	 for(var i = 1; i <= lastDay; i++) {
		    			        	const DayOption = document.createElement('option')
		    			        	DayOption.setAttribute('value', i)
		    			        	DayOption.innerText = i
		    			        	this.appendChild(DayOption);
		    			      	}
		    			    	}
		    			    
		    			  	});
		    		})
		      		}
		    	}else if(isMonthOptionExisted) {
		        	$("select[name=month]").change(function(){
		    			nowMonth = $("select[name=month] option:selected").text();
		    			const lastDay = new Date(nowYear, nowMonth, 0).getDate();
		    			birthDayEl.addEventListener('focus', function () {
		    			    if(isDayOptionExisted) {
		    			    	$("select[name=day]").empty();
		    			     	 for(var i = 1; i <= lastDay; i++) {
		    			        	const DayOption = document.createElement('option')
		    			        	DayOption.setAttribute('value', i)
		    			        	DayOption.innerText = i
		    			        	this.appendChild(DayOption);
		    			      	}
		    			    	}
		    			    
		    			  	});
		    		})
		      		}
		    	
		 	 });
		}
	});
	// 비밀번호 일치체크
	function chkpw() {
		let pw = $('#pw').val();
		let pwchk = $('#pwchk').val();
		console.log(pw);
		console.log(pwchk);
		
		if(pw!=pwchk) {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		return true;
	}
	// submit 전 유효성 체크
	function chk() {
	    var a =  document.querySelectorAll('.tt');
	    let month;
	    let day;
	    if($("#birth-month").val()<10) {
	    	month = "0"+$("#birth-month").val();
	    } else {
	    	month = $("#birth-month").val();
	    }
	    if($("#birth-day").val()<10) {
	    	day = "0"+$("#birth-day").val();
	    } else {
	    	day = $("#birth-day").val();
	    }
	    if($("#chkdup").val()=="false") {
	    	console.log($("#chkdup").val());
	    	alert("아이디 중복체크를 해주세요");
	    	return false;
	    };
	    let bdate = $("#birth-year").val() + month + day; 
	    console.log(bdate);
	    $("#bdate").val(bdate);
	    console.log($("#emailDoubleChk").val());
	    if($("#emailDoubleChk").val()==false) {
	    	alert("이메일 인증이 필요합니다.")
	    	return false;
	    }
	    for(let i =0; i < a.length; i++) {
	    	if(a[i].value.trim() == '') {
	    		alert("필수 입력하세요")
	        	return false;
	        }
	    }
	    return chkpw();
	    
	}
	

	 // 이메일 인증
	var code = "";
	 $("#certifybut").click(function() {
		
		let address = $('.emailInput').val();
		let domain = $('#domain-txt').val();
		let email = address + "@" + domain;
		if(address=="" || domain=="") {
			alert("이메일을 입력하세요")
			return false;
		}
		 $.ajax({
			type:"GET",
			url:"sendMail.do?email="+email,
			cache : false,
			success:function(data) {
				if(data == email) {
					console.log(data);
					alert("인증번호 발송이 완료되었습니다. 입력한 이메일에서 확인 해주십시오.");
					code = data;
					$("#emailhid").val(email);	
				}else {
					alert("중복된 이메일입니다.");
				}
				
				}
		 })
	 });
	 
	 // 이메일 인증 확인 메소드
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
	 
	 // 아이디 중복체크하고 아이디 변경하면 중복체크 다시 하게 만드는 메소드
	 $("#idinput").change(function() {
		 $("#chkdup").val("false");
		 console.log($("#chkdup").val());
	 });
	 
	 // ajax 사용 아이디 중콕 체크
	$("#duplication").click(function() {
		let nowid = $('#idinput').val();
		if(nowid=="") {
			alert("아이디를 입력해주세요");
			return false;
		}
		 $.ajax({
			type:"GET",
			url:"chkid?nowid="+nowid,
			cache : false,
			success:function(data) {
				if(data=="true") {
					$("#chkdup").val("true");
					console.log($("#chkdup").val());
					alert("중복되지않은 아이디입니다.")
				}else {
					alert("중복된 아이디입니다.")
				}
				}
		 })
	 });
	 

</script>

</html>