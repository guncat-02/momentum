<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./resources/css/searchList.css">
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <!--메인 컨텐츠는 여기에 작성 부탁합니당-->
            <form>
                <div id="searchBar">
                    <div id="searIcon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-search-heart" viewBox="0 0 16 16">
                            <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018" />
                            <path
                                d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11" />
                        </svg>
                    </div>
                    <input type="search" id="search" placeholder="SEARCH" name="keyWord">
                </div>
            </form>
            <div id="searMenuBar">
                <ul id="searMenu">
                    <li>
                        <span class="keyType" id="nowKeyType">인기</span>
                    </li>
                    <li>
                        <span class="keyType">최신</span>
                    </li>
                    <li>
                        <span class="keyType">마음</span>
                    </li>
                    <li>
                        <span class="keyType">리포스트</span>
                    </li>
                    <li>
                        <span class="keyType">사용자</span>
                    </li>
                </ul>
            </div>
            <div id="searList">

            </div>
        </div>
    </div>
</body>
</html>