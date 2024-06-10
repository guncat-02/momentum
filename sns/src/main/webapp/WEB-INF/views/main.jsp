<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
                
                
                <div class="theme-font" id="root" style="margin-left:30px;"></div>
                
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
	
    //infinite scroll -start
    
    //json fetch
    fetch('https://jsonplaceholder.typicode.com/posts/1')
		.then((response) => response.json())
		.then((json) => console.log(json));

    
    let currentPage = 1;
    let isFetching = false;
    let hasMore = true;
    
    let root = document.getElementById('root');
    
    async function fetchData() {
        isFetching = true;
        let response = await fetch(`https://jsonplaceholder.typicode.com/posts?_page=${currentPage}`);
        let data = await response.json();
        
        isFetching = false;
    
        if (data.length === 0) {
            hasMore = false;
            return
        }
    
        for(let post of data) {
            let div = document.createElement('div');
            root.appendChild(div);
            
            div.innerHTML = 
            	"<form action='myPost' method='post' name='myForm'>"
            	+"<img src='./resources/img/프로필.png'style='height:400px;'>"
            	+"<input type='text' name='title' style='visibility:hidden' value='"+post.title+"'>"
            	+"<h2 name='title'>"+post.title+"</h2>"
            	+"<input type='text' name='body' style='visibility:hidden' value='"+post.title+"'>"
            	+"<p>"+post.body+"</p>"
            	+"<input type='submit' value='자세히보기' style='background-Color:black; color: violet; border:none;'>";
            	+"</form>"
         
        }
        currentPage++;
    }
    


    window.addEventListener('scroll', () => {
        if (isFetching || !hasMore) {
            return
        }
    
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            fetchData();
        }
    })


    fetchData();
	//infinite scroll -end
	//root.addEventListener('click',()=>{
	//
	//	location.href="myPost";
	//})
</script>
</html>