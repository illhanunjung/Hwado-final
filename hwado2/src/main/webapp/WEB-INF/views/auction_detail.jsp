<%@page import="kr.smhrd.entity.WISHLIST"%>
<%@page import="kr.smhrd.entity.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.entity.IMAGES"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Artworks"%>
<%@page import="kr.smhrd.entity.AUCTIONS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>경매상세페이지</title>

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
    <link rel="icon" type="image/png" sizes="15x15" href="assets/img/logo.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/assets/css/auction_detail.css" rel="stylesheet">
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
     <form action="search" method="get">
          <input type="text" name="searchAw" placeholder="작품/작가 검색..." >
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

<!-- 아래 코드를 기존 코드 바로 아래에 추가해주세요 -->

<!-- 메뉴 바 -->

<p class="cart_name">작품 상세</p>

<script>

    document.addEventListener('DOMContentLoaded', function () {
        var heartButton = document.querySelector('.heart-button');
    
        heartButton.addEventListener('click', function () {
            if (heartButton.classList.contains('filled')) {
                // 이미 채워진 하트라면 빈 하트로 변경
                heartButton.innerHTML = '<i class="glyphicon glyphicon-heart-empty"></i>';
                heartButton.classList.remove('filled');
            } else {
                // 빈 하트라면 채워진 하트로 변경
                heartButton.innerHTML = '<i class="glyphicon glyphicon-heart"></i>';
                heartButton.classList.add('filled');
            }
        });
    });
    
                </script>

<!-- 데이터 가져오기 -->
<%

//유저정보, 관심 작품 불러오기
List<WISHLIST> wishList = (List<WISHLIST>)session.getAttribute("wishList");

	Artworks art = (Artworks)request.getAttribute("art");
	List<IMAGES> images = (List<IMAGES>)request.getAttribute("images");
	AUCTIONS auction = (AUCTIONS)request.getAttribute("auction");
	ArrayList<String> similar_img_list = (ArrayList<String>)request.getAttribute("similar_img_list");
	ArrayList<Artworks> similar_art = (ArrayList<Artworks>)request.getAttribute("similar_art");
	String savePath= "./resources/artworks";
	
	System.out.println(images.size());
	System.out.println(similar_art.size());
	
	Users artist = (Users) request.getAttribute("artist");
	
%>

	<script>
		// 타이머 선언

            function parseDate(dateStr) {
                let parts = dateStr.split(" ");
                let dateParts = parts[0].split("-");
                let timeParts = parts[1].split(":");

                // Date의 월은 0부터 시작하므로 1을 빼줍니다.
                let year = parseInt(dateParts[0], 10);
                let month = parseInt(dateParts[1], 10) - 1;
                let day = parseInt(dateParts[2], 10);

                let hour = parseInt(timeParts[0], 10);
                let minute = parseInt(timeParts[1], 10);
                let second = parseInt(timeParts[2], 10);

                return new Date(year, month, day, hour, minute, second);
            }
  
            function updateTimer(timer) {
               let countDownDate = parseDate(timer.getAttribute('data-countdown'));
               let now = new Date().getTime();
               let distance = countDownDate - now;

                if (distance > 0) {
                	let day = Math.floor((distance / (1000 * 60 * 60 * 24)));
                	let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                	let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                	let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    timer.innerHTML ="종료 남은 시간: " + day + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 ";
                } else {
                    timer.innerHTML = "타이머 종료";
                }
            }

            function updateAllTimers() {
            	let timers = document.getElementsByClassName("countdown-timer");
                for (let i = 0; i < timers.length; i++) {
                    updateTimer(timers[i]);
                }
            }

            // 1초마다 모든 타이머 업데이트
            setInterval(updateAllTimers, 1000);

           
        </script>

<div class="centered-container">
    <section class="product-detail">
        <div class="product-grid">
            <div class="product-image" style="display: flex; align-items: center;">
                <img src="<%=savePath+"/"+images.get(0).getImg_filename() %>" alt="상품 이미지" style="vertical-align: middle;">
            </div>
            <div class="product-info">
                
    
    <h1><%=art.getAw_name() %></h1>
    

                <h2>작가 - <%=artist.getUser_nick() %></h2><br><br>
                <p class="description"><%=images.get(0).getAw_desc() %></p>
                <p class="price countdown-timer" data-countdown="<%=auction.getAuc_ended_at()%>"></p>
                <p class="price">가격: ₩<%=art.getAw_price() %></p><br>
                <a href=""><button class="buy-button"><a href="auction_bid?auc_seq=<%= auction.getAuc_seq() %>">입찰하기</a></button></a>
            </div>
        </div>
        <hr class="separator">
        <p class="cart_name" style="font-size: 20px;">❝ <%=art.getAw_name() %> ❞ 와 유사한 작품들</p>
        <div class="works-gallery">
        	<% for(int i = 0; i< similar_img_list.size(); i++){  	%>
            <div class="artwork-container">
                <a onclick="goPdAc(<%=similar_art.get(i).getAw_seq() %>)">
                <img src="<%=savePath+"/"+similar_img_list.get(i) %>" alt="Work 1" class="artwork"></a>
                <div class="artwork-title"><%=similar_art.get(i).getAw_name() %></div>
            </div>
            <%} %>
           
            </div>
        <hr class="separator">
        <p class="cart_name">상세 이미지</p>
        <div class="detailed-images">
        
         <% if(images.size()>1){
        	for(int i = 1; i<images.size(); i++){ 	%>
        	
            <div class="image-desc-container">
                <img src="<%=savePath+"/"+images.get(i).getImg_filename() %>" alt="상세이미지">
                <h3 class="desc"><%=images.get(i).getAw_desc() %></h3>
                    </div>
    		<%  }}  %>
                    
        </div>
    </section>
</div>


<script type="text/javascript">

function goPdAc(awSeq) {
	
	$.ajax({ //json 형식 -> {key : value, key : value}
		// 어디로 요청할 것인지(요청 url)
		url : 'selectPdAc',
		
		// 요청 데이터
		data : { 'awSeq' : awSeq },
		
		// 요청 방식
		type : 'get',
		
		// 요청-응답 성공
		success : function(response) {
		        console.log("통신 성공");
		        window.location.href = response+"?aw_seq="+awSeq;
				
				
			},
		
		// 요청-응답 실패
		error : function(){
			console.log("통신실패")
		}
	})
	
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
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/jquery.slicknav.min.js"></script>
<script src="assets/js/jquery.countTo.min.js"></script>
<script src="assets/js/jquery.shuffle.min.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>