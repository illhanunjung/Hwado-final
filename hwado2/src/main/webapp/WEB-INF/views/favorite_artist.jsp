<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="icon" type="image/png" sizes="15x15" href="assets/img/logo.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/favorite_artists.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font_bold.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link href="assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/mypage.css">


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

    <header id="masthead" class="site-header">
        <nav id="primary-navigation" class="site-navigation">
            <div class="container">

                <div class="collapse navbar-collapse" id="agency-navbar-collapse">
                    
                    <ul class="nav navbar-nav navbar-right">

                                          
                        <li><button id="searchButton"><span class="glyphicon glyphicon-search" id="searchIcon"></span></button></li>
                        <li><a href="blog.html">장바구니</a></li>
                        <li><a href="blog.html">회원관리</a></li>
                        <li><a href="mypage.html">마이페이지</a></li>
                        <li><a href="blog.html">작가</a></li>
                        <li><a href="contact.html">갤러리</a></li>
                        <li><a href="signin.html">로그아웃</a></li>
                        <li><a href="signin.html">로그인</a></li>

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
            <a class="site-title" href="main.html">
                <img src="assets/img/logo.png" class="logo">
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
        <li><a href="favorite_artists.html" id="fv_at">관심작가</a></li>
        <li><a href="favorite_products.html">관심작품</a></li>
        <li><a href="purchase_history.html">구매내역</a></li>
        <li><a href="artist_registration.html" >예술가신청</a></li>
        <li><a href="product_registration.html" >작품등록</a></li>
        <li><a href="product_registration.html">경매등록</a></li>
        <li><a href="user_edit.html">개인정보수정</a></li>
    </ul>
</div>



<hr class="separator">
<p class="artistName1">❝ 함께 나아가는 여정에서 여러분과의 소중한 인연을 잊지 않겠습니다 ❞</p>

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



    
                </script>

<section class="site-section subpage-site-section section-related-projects">
    <div class="container">
        
       

        <div class="row">
           
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/1.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/2.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/3.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/4.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/5.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/6.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/7.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/8.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/9.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/10.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/11.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/12.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/13.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/14.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/15.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <div class="portfolio-item">
                  
                        <img src="assets/명화/16.jpg" class="img-res" alt="">
                       
                    
                    <h4 class="portfolio-item-title">홍길동<br><br>세상과 미술은 하나다 나는 미술 그 자체다 
                        <br><br><br><br><br><br><br><br><br>
                        <button class="heart-button filled"><i class="glyphicon glyphicon-heart"></i></button>

                    </h4>
                       
                    <a href="artist_profile.html"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div><!-- /.portfolio-item -->
            </div>
        </div>
    </div>
</section><!-- /.section-portfolio -->


























































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