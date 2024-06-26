<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<link rel="stylesheet" href="./resources/css/start.css">
   <style>
    body {
      opacity: 1;
      transition-duration: 1s;
      transition-property: opacity;
    }

    body.fade {
      opacity: 0;
    }

  </style>
</head>

<body class="fade">
    <div id="logoPage">
        <span id="logo">M</span>
    </div>
</body>
</html>
<script>
    window.onload = function() {
        window.setTimeout(function() {
            location.href = "/sns/loginpage";
        }, 3000)
    }
    
    document.addEventListener('DOMContentLoaded', () => {
        window.setTimeout(() => {
          document.body.classList.remove('fade');
        });
      });
</script>