<%@page import="kr.smhrd.entity.ArtworkImage"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>구매내역</title>

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
    <link href="resources/assets/css/purchase_history.css" rel="stylesheet">
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
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

.purchase-history {
    width: 30% !important;
    }
    
.btn {
    line-height: 50px;
    min-width: 200px;
    font-size: 16px;
    font-weight: 300;
    border: 0;
    border-radius: 50px;
    color: white;
    background-color: black;
    padding: 0;
    transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out;
    -moz-transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out;
    -webkit-transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out;
    -o-transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out;
    -ms-transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out;
}

.move{
padding-left:850px;
padding-bottom:250px;
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

    <!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

<!-- 메뉴 바 -->
<div class="menu-bar">
    <ul class="menu-items">
    	<li><a href="wishArtistsPage">관심작가</a></li>
        <li><a href="wishPage">관심작품</a></li>
        <li><a href="purchase_history" id="fv_at">구매내역</a></li>
        <% if(userLogin.getUser_role().equals("1")){ %>
        <li><a href=artist_registration >예술가신청</a></li>
         <%} %>
         <% if(userLogin.getUser_role().equals("2")){ %>
        <li><a href="prd_regi_page" >작품등록</a></li>
        <li><a href="auction_regi_page">경매등록</a></li>
        <li><a href="auction_management">경매관리</a></li>
        <li><a href="goArtist_profile?user_email=<%=userLogin.getUser_email()%>">작가프로필</a></li>
         <%} %>
        <li><a href="user_edit">개인정보수정</a></li>
    </ul>
</div>

<hr class="separator">




<section class="purchase-history">
    <h1 class="page-title">배송 조회</h1>
   <form action="http://info.sweettracker.co.kr/tracking/1" method="post" target="_blank">
            <div class="form-group">
              <input type="hidden" name="t_key" value="UBsTDYEgPhuOH6hJqiMqbg">
            </div>
            <div class="form-group">
        <label for="t_code">택배사 선택</label>
        <select class="form-control" name="t_code" id="t_code">
            <option value="01">우체국택배</option>
            <option value="04">CJ대한통운</option>
            <option value="05">한진택배</option>
            <option value="08">롯데택배</option>
            <option value="11">일양로지스</option>
            <option value="12">한의사랑택배</option>
            <option value="23">경동택배</option>
            <option value="24">대신택배</option>
            <option value="36">건영택배</option>
            <option value="44">한덱스</option>
            <option value="46">천일택배</option>
            <!-- 다른 택배사도 추가 가능 -->
        </select>
    </div>
            <div class="form-group">
              <label for="t_invoice">운송장 번호</label>
              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
            </div>
           
                </section>
                <div class="move">
          <button type="submit" class="btn btn-default">조회하기</button>
          </div>
        </form>
            
          
    
<script>
function openPopup() {
    var popupWidth = 500; // 원하는 폭으로 조절
    var popupHeight = 750; // 원하는 높이로 조절
    var left = (window.innerWidth - popupWidth) / 2;
    var top = (window.innerHeight - popupHeight) / 2;

    var popup = window.open('http://info.sweettracker.co.kr/tracking/1', 'myWindow', 'resizable=yes, top=' + top + ', left=' + left + ', width=' + popupWidth + ', height=' + popupHeight + ', scrollbars=no');
    
    if (popup == null) {
        alert('팝업이 차단되었습니다. 팝업 차단을 해제해 주세요.');
    }
}
</script>


 


          


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
<script src="resources/assets/js/bootstrap.min.js"></script>
<script src="resources/assets/js/bootstrap-select.min.js"></script>
<script src="resources/assets/js/jquery.slicknav.min.js"></script>
<script src="resources/assets/js/jquery.countTo.min.js"></script>
<script src="resources/assets/js/jquery.shuffle.min.js"></script>
<script src="resources/assets/js/script.js"></script>


</body>
</html>