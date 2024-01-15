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
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
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
                      <li><a href="shoppig_cart.html">장바구니</a></li>
                      <li><a href="blog.html">회원관리</a></li>
                        <li><a href="mypage.html">마이페이지</a></li>
                        <li><a href="artists.html">작가</a></li>
                        <li><a href="contact.html">갤러리</a></li>
                        <li><a href="signin.html">로그아웃</a></li>
                        <li><a href="userSelect">로그인</a></li>

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

   
            <a class="site-title">
                <img src="assets/img/logo.png" class="logo">
            </a>
        
    






        <div id="hero" class="hero overlay">
            <div class="hero-content">
                <div class="hero-text">            
                    <p class="hero-text">❝ [畵道]예술의 길을 걷는 사람들을 [花導]꽃길로 인도한다 ❞</p>
                </div><!-- /.hero-text -->
            </div><!-- /.hero-content -->
        </div><!-- /.hero -->
    </div>

    <hr class="separator">

    <img class="mainback" src="/assets/img/land3.jpg">
    
    <hr class="separator">
    
    <div class="slider-container">
      <div class="image-slider">
          <img src="/assets/명화/11.jpg" alt="이미지 1">
          <img src="/assets/명화/12.jpg" alt="이미지 2">
          <img src="/assets/명화/13.jpg" alt="이미지 3">
          <img src="/assets/명화/14.jpg" alt="이미지 1">
          <img src="/assets/명화/15.jpg" alt="이미지 1">
          <img src="/assets/명화/16.jpg" alt="이미지 1">
          <img src="/assets/명화/17.jpg" alt="이미지 1">
          <img src="/assets/명화/18.jpg" alt="이미지 1">
          <img src="/assets/명화/1.jpg" alt="이미지 1">
          <img src="/assets/명화/2.jpg" alt="이미지 1">
          <img src="/assets/명화/3.jpg" alt="이미지 1">
          <img src="/assets/명화/4.jpg" alt="이미지 1">
          <img src="/assets/명화/5.jpg" alt="이미지 1">
          <img src="/assets/명화/6.jpg" alt="이미지 1">
          <img src="/assets/명화/7.jpg" alt="이미지 1">
          <!-- 더 많은 이미지를 추가할 수 있습니다 -->
      </div>
  </div>
  <hr class="separator">
    <p class="artistName">❝ 이 달의 작가 ❞</p>
    <main id="main" class="site-main">


         <div class="list2">
            <a href="/product/detail.html?product_no=9289&amp;cate_no=42&amp;display_group=1">
              <div class="list2-item1">
                <img class="list2-item-img" src="/assets/명화/1.jpg" alt="best 상품 이미지">
                
                <div class="list2-item-text-box">
                  <span class="list2-item-desc">
                    Lilly Butler(1896)
                  </span><br>
                  <span class="list2-item-name">Theodore Earl Butler </span>
                  
                </div>
              </div>
            </a>
              
            <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
              <div class="list2-item2">
               
                <img class="list2-item-img" src="/assets/명화/2.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                  <span class="list2-item-desc">
                    Woman with a Parasol
                  </span><br>
                  <span class="list2-item-name">Claude Monet</span>
                 
                </div>
              </div>
            </a>
              
            <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item3">
                    
                  <img class="list2-item-img" src="/assets/명화/6.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      La Victoire(1918-1919)
                    </span><br>
                    <span class="list2-item-name">Maurice Denis</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item4">
                    
                  <img class="list2-item-img" src="/assets/명화/7.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Study for a Composition(1940-1941)
                    </span><br>
                    <span class="list2-item-name">Piet Mondrian</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item5">
                   
                  <img class="list2-item-img" src="/assets/명화/5.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Help Your Country
                    </span><br>
                    <span class="list2-item-name">Anonymous</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/8.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Portret van Benedictus
                    </span><br>
                    <span class="list2-item-name">Peter Paul Rubens</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                    
                  <img class="list2-item-img" src="/assets/명화/9.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Heavy red
                    </span><br>
                    <span class="list2-item-name">Wassily Kandinsky</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/10.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Fishing Boats
                    </span><br>
                    <span class="list2-item-name">Mikulas Galanda</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                    
                  <img class="list2-item-img" src="/assets/명화/11.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Self-Portrait
                    </span><br>
                    <span class="list2-item-name">Emst Ludwig Kirchner</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                    
                  <img class="list2-item-img" src="/assets/명화/12.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                     Joseph's Coat
                    </span><br>
                    <span class="list2-item-name">Horace Vemet</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                    
                  <img class="list2-item-img" src="/assets/명화/13.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Rouget
                    </span><br>
                    <span class="list2-item-name">Maurice Pillard Verneuil</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/14.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      A Visit To Lvov
                    </span><br>
                    <span class="list2-item-name">Vincent Stiepevich</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                    
                  <img class="list2-item-img" src="/assets/명화/15.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      A lady at her toilette
                    </span><br>
                    <span class="list2-item-name">Jean-Frederic Schall</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/16.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      The Mole And Her Son
                    </span><br>
                    <span class="list2-item-name">Charies Henny Bennett</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/17.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                     Geometric and wavy lines
                    </span><br>
                    <span class="list2-item-name">Myriam Thyes</span>
                   
                  </div>
                </div>
              </a>   
              <a href="/product/detail.html?product_no=10670&amp;cate_no=628&amp;display_group=1">
                <div class="list2-item">
                   
                  <img class="list2-item-img" src="/assets/명화/18.jpg" alt="best 상품 이미지"><div class="list2-item-text-box">                
                    <span class="list2-item-desc">
                      Marie Bizard & Roger
                    </span><br>
                    <span class="list2-item-name">Leonetto Cappiello</span>
                   
                  </div>
                </div>
              </a>


          </div> 
          














    </main><!-- /#main -->





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