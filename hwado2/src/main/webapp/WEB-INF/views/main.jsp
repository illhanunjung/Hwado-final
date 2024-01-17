<%@page import="kr.smhrd.entity.IMAGES"%>
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

    <title>화 도 [畵:道]</title>

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
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/responsive.css" rel="stylesheet">
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
                      	<% if(userLogin.getUser_email().equals("admin")){ %>
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

   
            <a class="site-title" href="">
                <img src="resources/assets/img/logo.png" class="logo">
            </a>
        
    






        <div id="hero" class="hero overlay">
            <div class="hero-content">
                <div class="hero-text">            
                    <p class="hero-text">❝ [畵道]예술의 길을 걷는 사람들을 [花導]꽃길로 인도하다 ❞</p>
                </div><!-- /.hero-text -->
            </div><!-- /.hero-content -->
        </div><!-- /.hero -->
    </div>

    <hr class="separator">

	<img class="mainback" src="resources/assets/img/land3.jpg">

	<hr class="separator">

	<div class="slider-container">
		<%
		String savePath = "./resources/artworks";
		List<IMAGES> recentImages = (List<IMAGES>) request.getAttribute("recentImages");
		%>
		<div class="image-slider">
			<%
	        if (recentImages != null) {
			for (int i = 0; i < recentImages.size(); i++) {
			%>
			<img src="<%=savePath + "/" + recentImages.get(i).getImg_filename()%>" />
			<%
			}
			}
			%>
		</div>
		</div>
		<hr class="separator">
		<p class="artistName">❝ 이 달의 작가 ❞</p>
		<main id="main" class="site-main">

			<%
			List<ArtworkImage> monthArtworks = (List<ArtworkImage>) request.getAttribute("monthArtworks");
			%>

			<div class="list2">
				<%
		        if (monthArtworks != null) {
				for (int i = 0; i < monthArtworks.size(); i++) {
				%>
				<a
					href="/product/detail.html?product_no=9289&amp;cate_no=42&amp;display_group=1">
					<div class="list2-item<%=i + 1%>">
						<img class="list2-item-img"
							src="<%=savePath + "/" + monthArtworks.get(i).getImg_filename()%>"
							alt="best 상품 이미지">

						<div class="list2-item-text-box">
							<span class="list2-item-desc"> <%=monthArtworks.get(i).getAw_name()%>
							</span><br> <span class="list2-item-name"><%=monthArtworks.get(i).getUser_email()%>
							</span>

						</div>
					</div>
				</a>
				<%
				}
				}
				%>
			</div>















		</main>
		<!-- /#main -->





		<hr class="separator2">



		<div class="row">
			<div class="col-md-3 col-sm-4 col-xs-6">
				<a class="site-title"><h2>화도</h2></a>
				<p>
					[畵道]예술의 길을 걷는 사람들을 <br>[花導]꽃길로 인도한다
				</p>
			</div>
			<div
				class="col-lg-offset-4 col-md-3 col-sm-4 col-md-offset-2 col-sm-offset-0 col-xs-6 ">
				<ul class="list-unstyled contact-links">
					<li><span class="glyphicon glyphicon-envelope"></span><a
						href="mailto:info@agencyperfect.com">smhrd@smhrd.or.kr</a></li>
					<br>
					<li><span class="glyphicon glyphicon-earphone"></span><a
						href="tel:+37400800000">062-655-3506</a></li>
					<br>
					<li><span class="glyphicon glyphicon-print"></span><a
						href="+37400900000">062-655-3510</a></li>
					<br>
					<li><span class="glyphicon glyphicon-map-marker"></span><a
						href="https://smhrd.or.kr/">광주 동구 예술길 31-15 3~4, 7층</a></li>
				</ul>
			</div>
			<div class="col-md-12">
				<hr>
				<!-- Optional: Add a line to separate -->
				<p style="text-align: center;">&copy; 2024 화도. All rights
					reserved.</p>
			</div>






			<!-- Bootstrap core JavaScript
    ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/js/bootstrap-select.min.js"></script>
			<script src="assets/js/jquery.slicknav.min.js"></script>
			<script src="assets/js/jquery.countTo.min.js"></script>
			<script src="assets/js/jquery.shuffle.min.js"></script>
			<script src="assets/js/script.js"></script>
</body>
</html>