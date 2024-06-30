<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<link rel="stylesheet" href="/sns/resources/css/manageDashboard.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<body>
    <div id="manage-allGrid">
        <div id="manage-menu">
            <h2><a href="/sns/main">SNS</a></h2>
            <h2><a href="/sns/manager">DashBoard</a></h2>
            <h2><a href="/sns/manager/user/">User Info</a></h2>
            <h2><a href="#">Report Info</a></h2>
        </div>
        <div id="manage-dashboard-container">
            <div id="dashboard-title">
                <h1>DashBoard</h1>
            </div>
            <div id="dashboard-info">
                <span id="dashboard-date-span"></span>
                <span id="dashboard-adminId-span">Admin : ${curId }</span>
            </div>            
            <div id="dashboard-data">
                <div class="dashboard-data-summary">
                    <div id="summary-member-cnt" class="go-user-member">
                        <h3>전체 회원 수</h3>
                        <h2>2000명</h2>
                    </div>
                </div>
                <div class="dashboard-data-summary">
                    <div id="summary-report-cnt" class="go-report">
                        <h3>오늘 신고 건수</h3>
                        <h2>500건</h2>
                    </div>
                </div>
                <div class="dashboard-data-summary">
                    <div id="summary-banned-cnt" class="go-user-banned">
                        <h3>현재 정지 계정</h3>
                        <h2>15개</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    const dt = new Date();
    let dtStr = `\${dt.getFullYear()}-\${dt.getMonth() + 1}-\${dt.getDate()} \${dt.getHours()}:\${dt.getMinutes()}:\${dt.getSeconds()}`
    $(document).ready(function() {
        $('#dashboard-date-span').text(dtStr);
    });
    $('div[class^=go-]').on('click', function() {
    	let identifier = $(this).attr('class').split(' ')[0].split('-');
    	let stId = identifier[1];
    	if (identifier.length > 1) {
    		let ndId = identifier[2];
    		location.href = `/sns/manager/\${stId}/\${ndId}`;
    	} else {
    		location.href = `/sns/manager/\${stId}/`;
    	}
    });
</script>
</html>