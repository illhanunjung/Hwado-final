<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.entity.WISHLIST"%>
<%@page import="kr.smhrd.entity.Users"%>
<%@page import="kr.smhrd.entity.AUCTIONS"%>
<%@page import="kr.smhrd.entity.IMAGES"%>
<%@page import="kr.smhrd.entity.Artworks"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- 부트스트랩 아이콘 사용하기 위한 링크 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>경매페이지</title>

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
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/responsive.css" rel="stylesheet">
    <link href="resources/assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/auction.css">


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

        @font-face {
            font-family: 'DNFForgedBlade';
            font-style: normal;
            font-weight: 500;
            src: url('//cdn.df.nexon.com/img/common/font/DNFForgedBlade-Medium.otf')format('opentype')
        }

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
        .main-container {
 
  background-color: white !important; /* 회색 배경색 */

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

    <div id="searchPopup" style="display:none;">
     <form action="search" method="get">
          <input type="text" name="searchAw" placeholder="작품/작가 검색..." >
          <input type="submit" value="검색" >
          <button type="button" onclick="closeSearchPopup()" >X</button>
      </form>
  </div>


        <script>
            document.getElementById('searchButton').addEventListener('click', function () {
                document.getElementById('searchPopup').style.display = 'block';
            });

            function closeSearchPopup() {
                document.getElementById('searchPopup').style.display = 'none';
            }

        </script>

        <script>
           
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
               
               console.log("countDownDate : "+timer.getAttribute('data-countdown'));

                if (distance > 0) {
                	let day = Math.floor((distance / (1000 * 60 * 60 * 24)));
                	let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                	let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                	let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    timer.innerHTML =day + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 ";
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
        <!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

        <!-- 아래 코드를 기존 코드 바로 아래에 추가해주세요 -->
         <!-- 데이터 가져오기 -->
          <%
          
        // 유저정보, 관심 작품 불러오기
       	List<WISHLIST> wishList = (List<WISHLIST>)session.getAttribute("wishList");
          
           List<Artworks> artList = (List<Artworks>) request.getAttribute("auctionList");
       	List<IMAGES> imgList = (List<IMAGES>) request.getAttribute("auctionImgList");
       	List<AUCTIONS> auctioninfo = (List<AUCTIONS>) request.getAttribute("auctioninfo");
       	ArrayList<Users> artistList = (ArrayList<Users>) request.getAttribute("artistList");
       	
     // 아티스트 정보
      	String artist_email =(String)request.getAttribute("artist_email");
       	
       	// 저장소 위치
       	String savePath = "./resources/artworks";
       	
       	// 페이지
       	int pageN = (int)request.getAttribute("pageN");
       	int item = 16;
       	
       	int start = pageN * item;
       	int end = start+item;
       	
       	if(end > imgList.size()){
       		end = imgList.size();
       	} else if (end < item){
       		end = imgList.size();
       	}
       	
       	System.out.println("start : " + start);
       	System.out.println("end : " + end);
          
          %>

        <!-- 메뉴 바 -->
        <div class="menu-bar">
            <ul class="menu-items">

                <li><a href="product_userEmail?artist_email=<%=artist_email %>">작품</a></li>
                <li><a href="auction_userEmail?artist_email=<%=artist_email %>" id="fv_at">경매작품</a></li>
            </ul>
        </div>

        <hr class="separator">

        <!-- 메인 컨테이너 시작 -->
        <div class="main-container">
            <!-- 콘텐츠 그리드 시작 -->
            <div class="content-grid">

                <!-- 갤러리 열 시작 -->
                <div class="gallery-column2">
                    <!-- 갤러리 헤더 시작 -->
                    <div class="gallery-header">
                        <!-- 갤러리 제목 -->
                        <h1 class="gallery-title">경매작품</h1>
                    </div> <!-- 갤러리 헤더 종료 -->
                    <!-- 아트워크 그리드 시작 -->
                    <div class="artwork-grid">
                    
                   
                    
                    <% if(end > 0){
                    for(int i = start; i < end; i++){ %>
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <h2 class="countdown-title">경매 남은 시간</h2>
                                <!-- 경매 남은 시간 -->
                                <div id="countdown" class="countdown-timer" data-countdown="<%=auctioninfo.get(i).getAuc_ended_at()%>"></div>
                                <!-- 아트워크 이미지 -->
                                <%if(userLogin != null ){%>
                                <a href="auction_detail?aw_seq=<%=artList.get(i).getAw_seq() %>" alt="상세페이지">
                                    <img src="<%=savePath+"/"+imgList.get(i).getImg_filename() %>" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <%} else{ %>
                                <a href="signin" alt="상세페이지">
                                    <img src="<%=savePath+"/"+imgList.get(i).getImg_filename() %>" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <%} %>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title"><%=artList.get(i).getAw_name() %></h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name"><%=artistList.get(i).getUser_nick() %></p>
                                    <p class="artwork-price"><%=artList.get(i).getAw_price() %></p>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        
                    <%} }%>
                    </div> <!-- 아트워크 그리드 종료 -->
                    <div class="navigation-buttons">
                        <!-- 이전 페이지로 이동하는 버튼 -->
                        <a href="auction_page?page=<%=pageN-1 %>"><button class="nav-button"><i class="bi bi-caret-left"></i></button></a>
                        <!-- 다음 페이지로 이동하는 버튼 -->
                        <a href="auction_page?page=<%=pageN+1 %>"><button class="nav-button"><i class="bi bi-caret-right"></i></button></a>
                    </div>
                </div> <!-- 갤러리 열 종료 -->
            </div> <!-- 콘텐츠 그리드 종료 -->
        </div> <!-- 메인 컨테이너 종료 -->

























































        <!-- -------------------------------------------------------------하단---------------------------------------------------------- -->


        <hr class="separator2">


        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-6">
                <a class="site-title">
                    <h2>화도</h2>
                </a>
                <p>[畵道]예술의 길을 걷는 사람들을 <br>[花導]꽃길로 인도한다</p>
            </div>
            <div class="col-lg-offset-4 col-md-3 col-sm-4 col-md-offset-2 col-sm-offset-0 col-xs-6 ">
                <ul class="list-unstyled contact-links">
                    <li><span class="glyphicon glyphicon-envelope"></span><a
                            href="mailto:info@agencyperfect.com">smhrd@smhrd.or.kr</a></li><br>
                    <li><span class="glyphicon glyphicon-earphone"></span><a href="tel:+37400800000">062-655-3506</a>
                    </li><br>
                    <li><span class="glyphicon glyphicon-print"></span><a href="+37400900000">062-655-3510</a></li><br>
                    <li><span class="glyphicon glyphicon-map-marker"></span><a href="https://smhrd.or.kr/">광주 동구 예술길
                            31-15 3~4, 7층</a></li>
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