<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>마이페이지</title>

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
    <!-- Bootstrap c    ore CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link href="assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/search_result.css">


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
    </style>
</head>

<body>

    <header id="masthead" class="site-header">
        <nav id="primary-navigation" class="site-navigation">
            <div class="container">

                <div class="collapse navbar-collapse" id="agency-navbar-collapse">

                    <ul class="nav navbar-nav navbar-right">


                        <li><button id="searchButton"><span class="glyphicon glyphicon-search"
                                    id="searchIcon"></span></button></li>
                        <li><a href="blog.html">회원관리</a></li>
                        <li><a href="#" onclick="openMypageModal()">마이페이지</a></li>
                        <li><a href="blog.html">작가</a></li>
                        <li><a href="contact.html">갤러리</a></li>
                        <li><a href="signin.html">로그아웃</a></li>
                        <li><a href="signin.html">로그인</a></li>

                    </ul>

                </div>




            </div>

        </nav><!-- /.site-navigation -->
    </header><!-- /#mastheaed -->

    <div class="flex-container">
        <div class="top-section">
            <a class="site-title" href="index.html">
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

    <div id="searchPopup" style="display:none;">
        <form action="/search" method="get">
            <input type="text" name="query" placeholder="작품/작가 검색...">
            <input type="submit" value="검색">
            <button type="button" onclick="closeSearchPopup()">X</button>
        </form>
    </div>

    <div class="flex-container">
        <div class="top-section">
            <a class="site-title">
                <img src="assets/img/logo.png" class="logo">
            </a>
        </div>

        <script>
            document.getElementById('searchButton').addEventListener('click', function () {
                document.getElementById('searchPopup').style.display = 'block';
            });

            function closeSearchPopup() {
                document.getElementById('searchPopup').style.display = 'none';
            }

        </script>







        <!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

        <!-- 아래 코드를 기존 코드 바로 아래에 추가해주세요 -->

        <!-- 메뉴 바 -->
        <div class="menu-bar">
            <ul class="menu-items">

                <li><a href="favorite_artists.html">관심작가</a></li>
                <li><a href="favorite_products.html">관심작품</a></li>
                <li><a href="shoppig_cart.html">장바구니</a></li>
                <li><a href="purchase_history.html">구매내역</a></li>
                <li><a href="artist_registration.html">예술가신청</a></li>
                <li><a href="user_edit.html">개인정보수정</a></li>
            </ul>
        </div>

        <hr class="separator">

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // 모든 하트 버튼을 선택
                var heartButtons = document.querySelectorAll('.heart-button');

                // 각 버튼에 대해 이벤트 리스너 추가
                heartButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        if (button.classList.contains('filled')) {
                            // 이미 채워진 하트라면 빈 하트로 변경
                            button.innerHTML = '<i class="glyphicon glyphicon-heart-empty"></i>';
                            button.classList.remove('filled');
                        } else {
                            // 빈 하트라면 채워진 하트로 변경
                            button.innerHTML = '<i class="glyphicon glyphicon-heart"></i>';
                            button.classList.add('filled');
                        }
                    });
                });
            });

        </script>



        <!-- 메인 컨테이너 시작 -->
        <div class="main-container">
            <!-- 콘텐츠 그리드 시작 -->
            <div class="content-grid">

                <!-- 카테고리 열 시작 -->
                <div class="category-column">
                    <!-- 카테고리 컨테이너 시작 -->
                    <div class="category-container">
                        <!-- 카테고리 제목 -->
                        <h1 class="category-title">카테고리</h1>
                        <!-- 카테고리 카드 시작 -->
                        <div class="category-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 카테고리 리스트 시작 -->
                                <ul class="category-list">
                                    <!-- 카테고리 항목: 전체 -->
                                    <li class="category-item">
                                        <a class="category-link" href="#">전체</a>
                                    </li>
                                    <!-- 카테고리 항목: 추상화 -->
                                    <li class="category-item">
                                        <a class="category-link" href="#">추상화</a>
                                    </li>
                                    <!-- 카테고리 항목: 풍경화 -->
                                    <li class="category-item">
                                        <a class="category-link" href="#">풍경화</a>
                                    </li>
                                    <!-- 카테고리 항목: 정물화 -->
                                    <li class="category-item">
                                        <a class="category-link" href="#">정물화</a>
                                    </li>
                                    <!-- 카테고리 항목: 기타 -->
                                    <li class="category-item">
                                        <a class="category-link" href="#">기타</a>
                                    </li>
                                </ul> <!-- 카테고리 리스트 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 카테고리 카드 종료 -->
                    </div> <!-- 카테고리 컨테이너 종료 -->
                </div> <!-- 카테고리 열 종료 -->

                <!-- 갤러리 열 시작 -->
                <div class="gallery-column">
                        <p class="search_result">"화도로고"에 관한 검색결과입니다</p>
                    <!-- 갤러리 헤더 시작 -->
                    <div class="gallery-header">
                        <!-- 갤러리 제목 -->
                        <h1 class="gallery-title">갤러리</h1>
                    </div> <!-- 갤러리 헤더 종료 -->
                    <!-- 아트워크 그리드 시작 -->
                    <div class="artwork-grid">
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 다른 아트워크 카드들도 같은 구조로 반복 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                        <!-- 아트워크 카드 시작 -->
                        <div class="artwork-card">
                            <!-- 카드 콘텐츠 시작 -->
                            <div class="card-content">
                                <!-- 아트워크 이미지 -->
                                <a href="" alt="상세페이지">
                                    <img src="./assets/명화/1.jpg" alt="Artwork Image" class="artwork-image" />
                                </a>
                                <!-- 아트워크 정보 시작 -->
                                <div class="artwork-info">
                                    <!-- 아트워크 제목 -->
                                    <h2 class="artwork-title">Artwork Title</h2>
                                    <!-- 아티스트 이름 -->
                                    <p class="artist-name">Artist Name</p>
                                    <p class="artwork-price">Price</p>
                                    <button class="heart-button"><i
                                            class="glyphicon glyphicon-heart-empty"></i></button>
                                </div> <!-- 아트워크 정보 종료 -->
                            </div> <!-- 카드 콘텐츠 종료 -->
                        </div> <!-- 아트워크 카드 종료 -->
                    </div> <!-- 아트워크 그리드 종료 -->
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