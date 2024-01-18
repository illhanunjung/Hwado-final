<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="kr.smhrd.entity.IMAGES"%>
<%@page import="kr.smhrd.entity.Users"%>
<%@page import="kr.smhrd.entity.Artworks"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.entity.WISHLIST"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Profile"%>
<%@page import="kr.smhrd.entity.Interests"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>관심작가</title>

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="resources/assets/css/favorite_artists.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
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
<div class="menu-bar">
    <ul class="menu-items">
      <li><a href="wishArtistsPage" id="fv_at">관심작가</a></li>
        <li><a href="wishPage">관심작품</a></li>
        <li><a href="purchase_history">구매내역</a></li>
        <% if(userLogin.getUser_role().equals("1")){ %>
        <li><a href=artist_registration >예술가신청</a></li>
         <%} %>
         <% if(userLogin.getUser_role().equals("2")){ %>
        <li><a href="prd_regi_page" >작품등록</a></li>
        <li><a href="auction_regi_page">경매등록</a></li>
        <li><a href="auction_management">경매관리</a></li>
         <%} %>
        <li><a href="user_edit">개인정보수정</a></li>
    </ul>
</div>



<hr class="separator">
<p class="artistName1">❝ 함께 나아가는 여정에서 여러분과의 소중한 인연을 잊지 않겠습니다 ❞</p>

<%

	List<Interests> wishArtist = (List<Interests>)session.getAttribute("wishArtist");

	ArrayList<Profile> wishProfile = (ArrayList<Profile>)request.getAttribute("wishProfile");
	ArrayList<Users> artistList = (ArrayList<Users>)request.getAttribute("artistList");
	
	String savePath = "./resources/artist_profile";
	
	//페이지
	int pageN = (int)request.getAttribute("pageN");
	int item = 16;
	
	int start = pageN * item;
	int end = start+item;
	
	if(wishProfile != null){
		if(end > wishProfile.size()){
			end = wishProfile.size();
		} else if (end < item){
			end = wishProfile.size();
		}
	}
	
	
	System.out.println("start : " + start);
	System.out.println("end : " + end);
%>

  

<section class="site-section subpage-site-section section-related-projects">
    <div class="container">
        
       

        <div class="row">
           
            <% if(wishProfile.size() != 0){ 
                    for(int i = start; i < end; i++){ %>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">                 
                        <img src="<%=savePath+"/"+wishProfile.get(i).getAp_title() %>" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title"><%=artistList.get(i).getUser_nick() %><br><br><%=wishProfile.get(i).getAp_desc() %>
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled" onclick="likeTF(this)" data-user_email="<%=userLogin.getUser_email() %>" data-ap_seq="<%=wishProfile.get(i).getAp_seq() %>"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="goArtist_profile?user_email=<%=wishProfile.get(i).getUser_email()%>"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>     
           <%}}else{%>
 				<h3>관심작가가 없습니다.</h3>     	   
           <% } %>
  	
           	
        </div>
       
        <div class="navigation-buttons">
                        <a href="wishArtistsPage?page=<%=pageN-1 %>"><button class="nav-button" ><i class="bi bi-caret-left"></i></button></a>
                    		<a href="wishArtistsPage?page=<%=pageN+1 %>"><button class="nav-button" onclick="loadPage('nextPageUrl')"><i class="bi bi-caret-right"></i></button></a>
           	</div>          	
    </div>
    
</section><!-- /.section-portfolio -->




<script>
            function loadPage(url) {
                fetch(url)
                    .then(response => response.text())
                    .then(data => {
                        // 여기서 'content'는 업데이트하고자 하는 페이지의 부분의 ID입니다.
                        document.getElementById('content').innerHTML = data;
                    })
                    .catch(error => console.error('Error:', error));
            }
        </script>

<script>

document.addEventListener('DOMContentLoaded', function () {
    var heartButtons = document.querySelectorAll('.heart-button');

    heartButtons.forEach(function(heartButton) {
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
});


function likeTF(buttonElement) {
    var user_email = buttonElement.getAttribute('data-user_email');
    var ap_seq = buttonElement.getAttribute('data-ap_seq');

    console.log('user_email:', user_email);
    console.log('ap_seq:', ap_seq);

    $.ajax({ //json 형식 -> {key : value, key : value}
			// 어디로 요청할 것인지(요청 url)
			url : 'whishArtist',
			
			// 요청 데이터
			data : { 'user_email' : user_email, 'ap_seq' : ap_seq },
			
			// 요청 방식
			type : 'get',
			
			// 요청-응답 성공
			success : function(data){
				if(data){
					window.location.href = "wishArtistsPage";
				} else{
					console.log(data)
				}
				
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