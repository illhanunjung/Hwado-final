<%@page import="kr.smhrd.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>경매등록</title>

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
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="15x15" href="resources/assets/img/logo.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/assets/css/auction_registration.css" rel="stylesheet">
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/responsive.css" rel="stylesheet">
    <link href="resources/assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/mypage.css">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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

    </style>
</head>
<body>

<%
Users userLogin = (Users)session.getAttribute("userLogin");

%>
    <header id="masthead" class="site-header">
        <nav id="primary-navigation" class="site-navigation">
            <div class="container">

                <div class="collapse navbar-collapse" id="agency-navbar-collapse">
                    
                    <ul class="nav navbar-nav navbar-right">

                                          
                      <li><button id="searchButton"><span class="glyphicon glyphicon-search" id="searchIcon"></span></button></li>
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

    <div id="searchPopup" style="display:none;">
        <form action="/search" method="get">
            <input type="text" name="query" placeholder="작품/작가 검색..." >
            <input type="submit" value="검색" >
            <button type="button" onclick="closeSearchPopup()" >X</button>
        </form>
    </div>
  
  <script>
    document.getElementById('searchButton').addEventListener('click', function() {
      document.getElementById('searchPopup').style.display = 'block';
  });
  
  function closeSearchPopup() {
      document.getElementById('searchPopup').style.display = 'none';
  }
  
  </script>


    <div class="flex-container">
        <div class="top-section">
            <a class="site-title" href="index.html">
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

    <!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

<!-- 아래 코드를 기존 코드 바로 아래에 추가해주세요 -->
<div class="menu-bar">
    <ul class="menu-items">
    	
        <li><a href="wishArtistsPage">관심작가</a></li>
        <li><a href="wishPage">관심작품</a></li>
        <li><a href="purchase_history">구매내역</a></li>
        <li><a href="prd_regi_page" >작품등록</a></li>
        <li><a href="auction_regi_page" id="fv_at">경매등록</a></li>
        <li><a href="auction_management">경매관리</a></li>
        <li><a href="goArtist_profile?user_email=<%=userLogin.getUser_email()%>">작가프로필</a></li>
        <li><a href="user_edit">개인정보수정</a></li>
    </ul>
</div>


<hr class="separator">



   
<main class="auction-container">
    <form class="auction-form" action="auction_regi" method="post" enctype="multipart/form-data">
        <h1 class="form-title">경매등록</h1>
        <p class="form-description">
            한 작품만 등록 가능합니다
        </p>
        <div class="form-section">
        
        	<!-- 예술가 이메일 히든 속성 -->
        	<input type="hidden" value="<%=userLogin.getUser_email() %>" name="user_email">
        	
            <!-- 작품 파일 입력 필드 -->
            <div class="input-group">
                <label for="main-image" class="input-label">메인 작품</label>
                <input type="file" name="file1" id="image-1" class="input-field" required />
                <label for="description-1" class="input-label"></label>
                <textarea name="desc1" id="description-3" class="input-field2" placeholder="작품에 대해 설명하세요" required></textarea>
            </div>
            
            <!-- 작품명 입력 필드 -->
            <div class="input-group">
                <label for="name" class="input-label">작품 명</label>
                <input type="text" name="aw_name" id="name" class="input-field" placeholder="작품 이름을 입력하세요" required />
            </div>

            <!-- 시작 가격 입력 필드 -->
            <div class="input-group">
                <label for="cost" class="input-label">시작가격</label>
                <input type="text" name="aw_price" id="cost" class="input-field" placeholder="시작가격을 입력하세요" required />
                <span class="currency-unit">원</span>
            </div>

			<!-- 종료 날짜 입력 필드 -->
            <div class="input-group">
                <label for="date" class="input-label">종료날짜</label>
                <input type="date" name="auc_ended_at" id="end_date" class="input-field" required />
            </div>

     

            <!-- 이미지 1 입력 필드 -->
            <div class="input-group">
                <label for="image-1" class="input-label">상세 이미지 1</label>
                <input type="file" name="file2" id="image-1" class="input-field"  />
                <label for="description-1" class="input-label"></label>
                <textarea name="desc2" id="description-1" class="input-field2" placeholder="상세 이미지에 대해 설명하세요" ></textarea>
            </div>

            <!-- 이미지 2 입력 필드 -->
            <div class="input-group">
                <label for="image-2" class="input-label">상세 이미지 2</label>
                <input type="file" name="file3" id="image-2" class="input-field"  />
                <label for="description-2" class="input-label"></label>
                <textarea name="desc3" id="description-2" class="input-field2" placeholder="상세 이미지에 대해 설명하세요" ></textarea>
            </div>

            <!-- 이미지 3 입력 필드 -->
            <div class="input-group">
                <label for="image-3" class="input-label">상세 이미지 3</label>
                <input type="file" name="file4" id="image-3" class="input-field"  />
                <label for="description-3" class="input-label"></label>
                <textarea name="desc4" id="description-3" class="input-field2" placeholder="상세 이미지에 대해 설명하세요" ></textarea>
            </div>

   



            <!-- 폼 제출 및 초기화 버튼 -->
            <div class="form-buttons">
                <button type="submit" class="submit-button">제출</button>
                <button type="reset" class="reset-button">초기화</button>
            </div>
        </div>
    </form>
</main>
















    <!-- -------------------------------------------------------------하단---------------------------------------------------------- -->


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
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/jquery.slicknav.min.js"></script>
<script src="assets/js/jquery.countTo.min.js"></script>
<script src="assets/js/jquery.shuffle.min.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>