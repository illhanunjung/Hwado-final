<%@page import="kr.smhrd.entity.Users"%>
<%@page import="kr.smhrd.entity.Portfolios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>포트폴리오</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">

    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    
    <!-- Favicon
    ================================================== -->
    <link rel="icon" type="image/png" sizes="15x15" href="resources/assets/img/logo.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
    <link href="resources/assets/css/bid_reason.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/responsive.css" rel="stylesheet">
    <link href="resources/assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/mypage.css">

    <style>
        @font-face {
    font-family: 'Giants-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Giants-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
 
 
}

@font-face{
font-family:'DNFForgedBlade';font-style:normal;font-weight:500;
src:url('//cdn.df.nexon.com/img/common/font/DNFForgedBlade-Medium.otf')format('opentype')}

@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.form-title{
 padding-top : 80px;
}
.sub-container{
	margin-bottom: 450px;
    width: 100%;
    max-width: 600px;
    padding: 24px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
#a_name{
    position: relative;
    top: 60px;
    padding-top : 10px;
}
body {
	font-family: 'Pretendard-Regular';
}
.portfolio-images img {
    display: block;
    margin-bottom: 10px; /* 이미지 간격 조절 */
    width: 100%; /* 이미지 너비를 부모 요소의 100%로 설정 (조절 가능) */
    max-width: 700px; /* 이미지의 최대 너비 설정 (조절 가능) */
    height: auto; /* 자동으로 높이 조절 */
}
    </style>
</head>

<body oncontextmenu="return false" oncopy="return false" ondragstart="return false" onselectstart="return false">

<%
 Users userLogin = (Users)session.getAttribute("userLogin");
%>

    <header id="masthead" class="site-header">
        <nav id="primary-navigation" class="site-navigation">
            <div class="container">

                <div class="collapse navbar-collapse" id="agency-navbar-collapse">
                    
                    <ul class="nav navbar-nav navbar-right">

                                          
                      
                      <% if(userLogin!= null){ %>
                      <li><a href="shoppingCart">장바구니</a></li>
                      	<% if(userLogin.getUser_role().equals("0")){ %>
                      <li><a href="user_management">회원관리</a></li>
                        <%} %>
                        <li><a href="myPage">마이페이지</a></li>
                      <%} %> 
                        <li><a href="artist">작가</a></li>
                        <li><a href="product_page">갤러리</a></li> 
                        <% if(userLogin!= null){ %>
                        <li><a href="logout">로그아웃</a></li>
                         <%} %>  
                         <% if(userLogin== null){ %>
                        <li><a href="signin">로그인</a></li>
                        <%} %>

                    </ul>

                </div>

        </div>   

    </nav><!-- /.site-navigation -->
</header><!-- /#mastheaed -->


<div class="flex-container">
    <div class="top-section">
        <a class="site-title" href="./">
            <img src="resources/assets/img/logo.png" class="logo">
        </a>
    </div>

    <div id="hero" class="hero overlay">
        <div class="hero-content">
            <div class="hero-text">             
                
            </div><!-- /.hero-text -->
        </div><!-- /.hero-content -->
    </div><!-- /.hero -->
</div>

<hr class="separator">


<main class="portfolio-container">
    <div class="sub-container">
<h1 class="form-title">포트폴리오</h1>

<!-- 작가 정보 -->

<div class="input-group">
    <label id="a_name" for="name" class="input-label">작가 이름: ${user.user_nick}</label>
</div>


<!-- 작품 정보 -->
<div class="input-group">
<h2>작품 정보</h2>

    <label for="name" class="input-label">작품 제목: ${portfolio.pf_title}</label>
    <label for="name" class="input-label">작품 설명: ${portfolio.pf_desc}</label>

</div>
<!-- 작품 이미지 -->
<div class="input-group">
<h2>작품 이미지</h2>
<div class="portfolio-images">
    <img src="./resources/portfolios/${portfolio.pf_file1}" >
    <img src="${portfolio.pf_file2}" alt="빈칸">
    <img src="${portfolio.pf_file3}" alt="빈칸">
</div>
</div>
</div>
</main>



<hr class="separator2">
   
         
<div class="row">
    <div class="col-md-3 col-sm-4 col-xs-6">
        <a class="site-title"><h2>화도</h2></a>
        <p>[畵道]예술의 길을 걷는 사람들을 <br>[花導]꽃길로 인도한다</p>      
    </div>
    <div class="col-lg-offset-4 col-md-3 col-sm-4 col-md-offset-2 col-sm-offset-0 col-xs-6 ">
        <ul class="list-unstyled contact-links">
            <li><span class="glyphicon glyphicon-envelope"></span><a href="mailto:info@agencyperfect.com">smhrd@smhrd.or.kr</a></li><br>
            <li><span class="glyphicon glyphicon-earphone"></span><a href="tel:+37400800000">062-655-3506</a></li><br>
            <li><span class="glyphicon glyphicon-print"></span><a href="+37400900000">062-655-3510</a></li><br>
            <li><span class="glyphicon glyphicon-map-marker"></span><a href="https://smhrd.or.kr/">광주 동구 예술길 31-15 3~4, 7층</a></li>
        </ul>
    </div>
    <div class="col-md-12">
        <hr> <!-- Optional: Add a line to separate -->
        <p style="text-align: center;">&copy; 2024 화도. All rights reserved.</p>
    </div>

</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<script src="resources/assets/js/bootstrap-select.min.js"></script>
<script src="resources/assets/js/jquery.slicknav.min.js"></script>
<script src="resources/assets/js/jquery.countTo.min.js"></script>
<script src="resources/assets/js/jquery.shuffle.min.js"></script>
<script src="resources/assets/js/script.js"></script>

</body>
</html>