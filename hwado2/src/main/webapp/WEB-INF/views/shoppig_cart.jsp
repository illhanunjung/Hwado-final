<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>장바구니</title>

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
    <link href="assets/css/shopping_cart.css" rel="stylesheet">
    <link href="assets/css/font_bold.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
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
                        <li><a href="shoppig_cart.html">장바구니</a></li>
                        <li><a href="blog.html">회원관리</a></li>
                        <li><a href="mypage.html">마이페이지</a></li>
                        <li><a href="artists.html">작가</a></li>
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


<script>
    document.addEventListener('DOMContentLoaded', function () {
        var checkAll = document.getElementById('checkAll');
        var checkboxes = document.querySelectorAll('.itemCheckbox');

        checkAll.addEventListener('change', function () {
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = checkAll.checked;
            });
        });
    });
</script>


<p class="cart_name">장바구니</p>

<section class="cart">
    <div class="cart__information">
        <ul>
            <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
            <li>모든 작품은 환불이 불가하오니 유의하여 주문해주시기 바랍니다.</li>
        </ul>
    </div>
    <table class="cart__list">
        <form>
            <thead>
                <tr>
                    <td class="checkbutton"><input type="checkbox" id="checkAll"></td>
                    <td>작품</td>
                    <td >작가</td>
                    <td>작품 명</td>
                    <td>상품금액</td>
                    <td>배송비</td>
                </tr>
            </thead>
            <tbody>
                <tr class="cart__list__detail">
                    <td><input type="checkbox" class="itemCheckbox"></td>
                    <td><img src="/assets/명화/12.jpg" ></td>
                    <td>
                        <p>홍길동</p>
                        
                    </td>
                    <td class="cart__list__option">
                        <p>내가 바로 예수다</p>
                        
                    </td>
                    <td><span class="price">116,620</span><span>원</span><br>
                      
                    </td>
                    <td>무료</td>
                </tr>
                <tr class="cart__list__detail">
                    <td style="width: 2%;"><input type="checkbox" class="itemCheckbox"></td>
                    <td style="width: 13%;">
                        <img src="assets/명화/18.jpg" >
                    </td>
                    <td style="width: 17%;">
                        <p>김말똥</p>
                       
                    </td>
                    <td class="cart__list__option" style="width: 30%;">
                        <p>뒤에 곰돌이 푸가 있네!</p>
                        
                    </td>
                    <td style="width: 15%;"><span class="price">88,900</span><span>원</span><br>
                        
                    </td>
                    <td style="width: 15%;">무료</td>
                </tr>
                <tr class="cart__list__detail">
                    <td><input type="checkbox" class="itemCheckbox"></td>
                    <td><img src="/assets/명화/12.jpg" ></td>
                    <td>
                        <p>홍길동</p>
                        
                    </td>
                    <td class="cart__list__option">
                        <p>내가 바로 예수다</p>
                        
                    </td>
                    <td><span class="price">116,620</span><span>원</span><br>
                      
                    </td>
                    <td>무료</td>
                </tr>
                <tr class="cart__list__detail">
                    <td style="width: 2%;"><input type="checkbox" class="itemCheckbox"></td>
                    <td style="width: 13%;">
                        <img src="assets/명화/18.jpg" >
                    </td>
                    <td style="width: 17%;">
                        <p>김말똥</p>
                       
                    </td>
                    <td class="cart__list__option" style="width: 30%;">
                        <p>뒤에 곰돌이 푸가 있네!</p>
                        
                    </td>
                    <td style="width: 15%;"><span class="price">88,900</span><span>원</span><br>
                        
                    </td>
                    <td style="width: 15%;">무료</td>
                </tr>
                <tr class="cart__list__detail">
                    <td><input type="checkbox" class="itemCheckbox"></td>
                    <td><img src="/assets/명화/12.jpg" ></td>
                    <td>
                        <p>홍길동</p>
                        
                    </td>
                    <td class="cart__list__option">
                        <p>내가 바로 예수다</p>
                        
                    </td>
                    <td><span class="price">116,620</span><span>원</span><br>
                      
                    </td>
                    <td>무료</td>
                </tr>
                <tr class="cart__list__detail">
                    <td style="width: 2%;"><input type="checkbox" class="itemCheckbox"></td>
                    <td style="width: 13%;">
                        <img src="assets/명화/18.jpg" >
                    </td>
                    <td style="width: 17%;">
                        <p>김말똥</p>
                       
                    </td>
                    <td class="cart__list__option" style="width: 30%;">
                        <p>뒤에 곰돌이 푸가 있네!</p>
                        
                    </td>
                    <td style="width: 15%;"><span class="price">88,900</span><span>원</span><br>
                        
                    </td>
                    <td style="width: 15%;">무료</td>
                </tr>
            </tbody>







            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var checkAll = document.getElementById('checkAll');
                    var checkboxes = document.querySelectorAll('.itemCheckbox');
                    var totalAmount = document.getElementById('totalAmount');
            
                    function updateTotalAmount() {
                        var total = 0;
                        checkboxes.forEach(function(checkbox) {
                            if (checkbox.checked) {
                                var row = checkbox.closest('tr');
                                var price = row.querySelector('.price').textContent;
                                price = parseInt(price.replace(/[^0-9]/g, ''));
                                total += price;
                            }
                        });
                        totalAmount.textContent = '총 결제 금액: ' + total.toLocaleString() + '원';
                    }
            
                    checkboxes.forEach(function(checkbox) {
                        checkbox.addEventListener('change', updateTotalAmount);
                    });
            
                    // 전체 선택 체크박스에도 이벤트 리스너 추가
                    checkAll.addEventListener('change', function () {
                        checkboxes.forEach(function(checkbox) {
                            checkbox.checked = checkAll.checked;
                        });
                        updateTotalAmount(); // 전체 선택 상태 변경 시 총 금액 업데이트
                    });
            
                    // 초기 총 금액 업데이트
                    updateTotalAmount();
                });
            </script>
            
            
            <tfoot>
                <tr>
                    <td><button class="cart__bigorderbtn left">선택상품 삭제</button></td>
                    <td id="totalAmount" style="text-align: center;">
                  <td colspan="2"></td>
                    <td><button class="cart__bigorderbtn right">쇼핑 계속하기</button></td>
                    <td><button class="cart__bigorderbtn right">주문하기</button></td>
                </tr>
            </tfoot>
        </form>
    </table>
    <div class="cart__mainbtns">
        
    </div>
</section>






















































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