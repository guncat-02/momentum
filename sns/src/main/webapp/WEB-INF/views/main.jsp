<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<% request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

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


<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <main>
                <h1 class="theme-font">
                <c:if test="${userid != null }">
					<span> 사용자 정보 : ${userid } / ${username } / ${grade }</span>
				</c:if>
                </h1>
                <input type="button" value="themechange" id="btn">
                <div class="theme-font" id="root">
                <!-- root class에 게시물 들어옵니다 -->
	                <c:forEach items="${aList}" var="post" varStatus="postStat">
		                <div class="postS"  style="border:1px solid violet; display:none;">
		                 <input type="text" name="id" value="${post.id}" class="id cssid" >
		                 	<div id="carouselExample${postStat.count }" class="carousel slide num${postStat.count }" >
								<div class="carousel-inner">
								    <c:forEach items="${post.filename }" var="file" varStatus="status">
								    	<c:if test="${status.index == 0 }">
								    		<div class="carousel-item active">
										    	<img src="download?filename=${status.current}" class="d-block w-100" alt="...">
										    </div>
					        			</c:if>
					        			<c:if test="${status.index >= 1 }">
								    		<div class="carousel-item">
										    	<img src="download?filename=${status.current}" class="d-block w-100" alt="...">
										    </div>
					        			</c:if>
						        		<c:if test="${status.last == true && status.index != 0  }">
						        			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample${postStat.count }" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
										  	</button>
										  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExample${postStat.count }" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
									  		</button>
						        		</c:if>
				        			</c:forEach>
								</div>
							</div>
				        	<form action = "myPost" method = "post" name="form" class="postCss">
				        		<input type="hidden" name="no" value="${post.no}" class="no" style="background-color:black;">
				        		<input type="hidden" name="id" value="${post.id}" class="id cssid" >
				        		<textarea name="cont" class="cont" style="background-color:black;width:90%;height:200px;border:1px solid violet; color:violet;" readonly>${post.cont}</textarea>
				        		<div class="likeLine">
					        		<div class="likeCount">
										likeCount : 0
					        		</div>
					        		<div class="viewCount">	
										<input type="text" name="show" value="${post.show}" class="showCnt">
					        		</div>
				        		</div>
				        		<input type="hidden" name="privacy" value="${post.privacy}" class="privacy">
				        		<c:forEach items="${post.filename }" var="file" varStatus="status">
					        		<input type="hidden" name="filename" value="${status.current}" class="filename">
				        		</c:forEach>
				        		<c:if test="${userid != null }">
				        			<input type="hidden" name="myid" value="${userid}" class="myid" style="margin-top:100px; ">
				        			<input type="hidden" name="myname" value="${username}" class="myname">
				        			<input type="hidden" name="mygrade" value="${grade}" class="mygrade">
								</c:if>
					    	</form>
					    </div>
		        	</c:forEach>
                </div>
                <!-- 값이 비워져있으나 해당 div를 통해 무한스크롤의 바닥을 감지합니다 지우시면 스크롤시 문제가 발생합니다 -->
                <div class="footer"></div>
            </main>
        </div>
    </div>
</body>

<script>
	
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
    //첫 로드되는 게시물에 click이벤트 적용
   	window.onload=function(){
   		setTimeout(()=>{
   			var target =document.querySelectorAll(".postLoad");
   			target.forEach((post)=>post.addEventListener("click", function(e){
				var form = document.getElementsByName("form")[$(this).index()];
				$(this).find('form').on('click',()=>{
					form.submit();
				});
			})); 
   	   	},1000)
    }
    
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
	var cnt=0;
	//renderItem = 하나의 게시글을 DOM요소로 변경하는 함수
	const renderItem = ({id, data}) => {
		
	const div = document.createElement('div')
	div.className="postLoad"
		
	if(document.getElementsByClassName("postS")[cnt]==undefined){
		//div class="postS"에 저장된 값을 document.getElementsByClassName("postS")[cnt]를 통해 
		//다음 게시물이 존재하는지 확인한다. undefined값이 나오면 div를 리턴해 바로 화면에 보여준다 예를들어 총 8개의 게시물이 존재할때
		//첫 5개는 한번에 화면에 보여지고 다시 5개의 게시물을 DOM에 저장하려고 할때 3개의 게시물이 저장된 이후 바로 return해 화면에 보여준다
    	return div
    }
	div.innerHTML = 
			document.getElementsByClassName("postS")[cnt].innerHTML;
			$("#carouselExample"+cnt).removeAttr("id");
			//윗줄 반드시 있어야함.. 비동기 구현을 위해 미리 hidden 으로 숨겨놓은 캐러셀의 아이디를 지워주어야 뒤늦게 만든 캐러셀이 돌아감
	//div를 return하게 되면 게시물을 5개 불러온 후가 되므로 innerHTML이 된 직후에 cnt값을 ++해줍니다.
	cnt++;
			console.log(cnt);
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
	  
	  //documentFragment를 이용하여 $root요소 까지 부착한다
	  const frag = document.createDocumentFragment()
	  list.forEach(item=> {
	    frag.appendChild(renderItem(item))
	  })
	  $root.appendChild(frag)
	  //loading표시를 제거해준다
	  $footer.classList.remove("loading");
	  
	  if(count>=1){
		  var target =document.querySelectorAll(".postLoad");
 			target.forEach((post)=>post.addEventListener("click", function(e){
				var form = document.getElementsByName("form")[$(this).index()];

				$(this).find('form').on('click',()=>{
					form.submit();
				});
			})); 
		}
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