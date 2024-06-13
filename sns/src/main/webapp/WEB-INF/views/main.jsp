<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title");
	String body = request.getParameter("body");
	session.setAttribute("title",title);
	session.setAttribute("body",body);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

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
                <!-- root class에 게시물 들어옵니다 -->
                <div class="theme-font" id="root"></div>
                <!-- 시간나면 loading바 연출은 footer class에서 진행.. 이유는 게시물 최하단에 loading바를 만들 계획이므로.. -->
                <div class=footer></div>
            </main>
        </div>
        <!-- DB의 값을 attribute로 넘겨줄때 js로 바로 가져와서 넣지 않고 html body안에서 jstl을 통해 한번 받아준 후에
        	script단에서 innerText로 값을 사용했다.
        	attribute로 넘겨준 리스트를 바로 script에서 받아오는 것도 가능은 하나, attribute로 넘기는 값의 타입이 리스트기 때문에
        	리스트에서 값을 다시 꺼내야 하는데 이 과정이 복잡했다..
        	(promise가 실행되면 5개의 게시물값이 필요한데 script단에서 이때 반복문을 돌리면 소스가 너무 복잡해지는 문제가 생겼다..) 
        	그렇기 때문에 최종적으로 jstl을 통해 값을 받고 display:none 스타일을 적용시켜 화면에서 값을 숨겼다.
        	하지만 이 방식은 f12 개발자 도구를 통해 값을 모두 꺼내볼수 있으므로 취약점이 분명히 드러난다 / yoom 작성..-->
	    <div class="hiQuery theme-font" style="display:none;">
	        <c:forEach items="${mList}" var="post">
	        	<p class="follow">${post.followId}</p>
	        	<p class="no">${post.no}</p>
	        	<p class="cont">${post.cont}</p>
	        	<p class="filename">${post.filename}</p>
	        </c:forEach>
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
	
    //infinite scroll -start
   	
    const $root = document.querySelector('#root')
	const $footer = document.querySelector('.footer')
	// getList = 5개의 게시글을 비동기적으로 불러오는 함수
	const getList = (count) => {
	  return new Promise(resolve => {
		  //set Timeout 을 통해 1초후 실행되는 promise를 만듭니다
	    setTimeout(() => {
	      const data = Array.from({length:5}).map((_,idx)=>{
	        const no = (count*5)+idx+1
	        return {no, data: `${no}`}
	      })
	      resolve(data)
	    },1000)
	  })
	}
	//cnt변수는 게시물리스트가 순차적으로 새로운 DOM요소로 들어갈수 있게 인덱스의 역할을 해줌
	//body영역에 만들어진 className이 hiQuery인 div는 display:none으로 설정되어 화면에는 나타나지 않으나
	//model.attribute로 넘겨준 mList의 값을 c:forEach 반복문으로 저장함
	
	var cnt=0;
	//renderItem = 하나의 게시글을 DOM요소로 변경하는 함수
	const renderItem = ({id, data}) => {
		
	const div = document.createElement('div')
	if(document.getElementsByClassName("follow")[cnt]==undefined){
		//div class="hiQuery"에 저장된 값을 document.getElemetsByClassName("follow")[cnt]를 통해 
		//다음 게시물이 존재하는지 확인한다. undefined값이 나오면 div를 리턴해 바로 화면에 보여준다 예를들어 총 8개의 게시물이 존재할때
		//첫 5개는 한번에 화면에 보여지고 다시 5개의 게시물을 DOM에 저장하려고 할때 3개의 게시물이 저장된 이후 바로 return해 화면에 보여준다
    	return div
    }
	//게시물에 사진 파일이 존재하지 않는 상황을 알기 위해 "filename" 클래스명을 가진 리스트의 innerText값을 확인한다.
	//document.getElementsByClassName("filename")[cnt].innerText 값이 ''로 나오면 해당 값이 비어있다는 뜻
	//즉 사진이 업로드되지 않은 게시물 이라는 뜻 이므로 img태그를 넣지 않는다
	if(document.getElementsByClassName("filename")[cnt].innerText!=''){
														//사진이 업르드된 게시물
		div.innerHTML = 
			
			  '<div class="item-id"> <div class="item-arc"><img src="./resources/img/프로필.png"style="height:100%; object-fit: cover;"></div>프로필 사진 넣을까말까 | id : ' + document.getElementsByClassName("follow")[cnt].innerText + '</div>'
			  +'<div class="item-filename">'
			  +'<img src="download?filename='+ document.getElementsByClassName("filename")[cnt].innerText +'" width="100%" height="100%">'+ '</div>'
			  +'<div class="item-heart"> <p class="likeCount">♥ 좋아요테이블 select Count</p><p class="viewCount"> 조회수 : 0 </P></div>'
			  +'<div class="item-cont">' + document.getElementsByClassName("cont")[cnt].innerText + '</div>'
			  ;
			
		
	}else if(document.getElementsByClassName("filename")[cnt].innerText==''){
														//사진이 업로드되지 않은 게시물
		div.innerHTML = 
			
			  '<div class="item-id"><div class="item-arc"><img src="./resources/img/프로필.png"style="height:100%; object-fit: cover;"></div>프로필 사진 넣을까말까 | id : ' + document.getElementsByClassName("follow")[cnt].innerText + '</div>'
			  +'<div class="item-heart"> <p class="likeCount">♥ 좋아요테이블 select Count</p><p class="viewCount"> 조회수 : 0 </P></div>'
			  +'<div class="item-cont"> 글밖에 없는 게시물 : ' + document.getElementsByClassName("cont")[cnt].innerText + '</div>'
			  ;
		
	}
	//div를 return하게 되면 게시물을 5개 불러온 후가 되므로 innerHTML이 된 직후에 cnt값을 ++해줍니다.
	cnt++;
    
	
	return div
	//만약 return div 후에 cnt++를 하면 첫게시물이 5개, 두번째 게시물이 5개, 3번째 게시물이 5개... 인 화면이 만들어집니다.
	}
	
	let count = 0
	//fetchMore = $footer에 loading을 해준 후 비동기 방식으로 list를 불러온다
	
	//async는 항상 promise를 반환합니다 promis가 아닌 값을 반환 하더라도 이행 상태의 promise(resolved promise)로 값을 감싸 
	//이행된 promise가 반환 되도록 합니다
	const fetchMore = async () => {
	  $footer.classList.add("loading");
	  //await는 promis가 처리될때 까지 기다립니다
	  const list = await getList(count ++)
	//documentFragment를 이용하여 $app요소 까지 부착한다
	  const frag = document.createDocumentFragment()
	  list.forEach(item=> {
	    frag.appendChild(renderItem(item))
	  })
	  $root.appendChild(frag)
	  //loading표시를 제거해준다
	  $footer.classList.remove("loading");
	}
	
	const onScroll = (e) => {
		//clientHeight 는 element의 내부 높이.(내부여백인 padding을 포함, 수평 스크롤바의 높이와 경계선 외부margin을 포함하지 않음)
	  	//scrollTop은 element최상단과 보여지는 컨텐츠와의 거리를 의미합니다(세로스크롤이 없으면 scrollTop은 항상 0)
		//scrollHeight는 보이지 않는 부분까지 전체의 높이를 나타냅니다.
		
		const {clientHeight,scrollTop,scrollHeight} = e.target.scrollingElement;
		//scroll이 제일 바닥으로 내려온 상태가 되면 clientHeight + scrollTop = scrollHeight 이므로
	  if (clientHeight + scrollTop === scrollHeight) {
		 //게시물 5개를 더 불러옵니다
	    fetchMore()
	  }
	}
	//첫 5개의 게시물은 스크롤 여부와 상관없이 바로 불러옵니다.
	fetchMore()
	//window에서 scroll시 onScroll을 작동하게합니다
	window.addEventListener('scroll',onScroll)
    
    
    
</script>
</html>