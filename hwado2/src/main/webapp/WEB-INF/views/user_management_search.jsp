<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 부트스트랩 아이콘 사용하기 위한 링크 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link href="./assets/css/user_management.css" rel="stylesheet">
<!-- Basic Page Needs
    ================================================== -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>회원관리페이지</title>

<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="">

<!-- Mobile Specific Metas
    ================================================== -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,600,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Favicon
    ================================================== -->
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="15x15"
	href="resources/assets/img/logo.png">

<!-- Stylesheets
    ================================================== -->
<!-- Bootstrap core CSS -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/assets/css/style.css" rel="stylesheet">
<link href="resources/assets/css/responsive.css" rel="stylesheet">
<link href="resources/assets/css/mypage1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/mypage.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/user_management.css">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
@font-face {
	font-family: 'Giants-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Giants-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'DNFForgedBlade';
	font-style: normal;
	font-weight: 500;
	src: url('//cdn.df.nexon.com/img/common/font/DNFForgedBlade-Medium.otf')
		format('opentype')
}

@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

#fv_at {
	color: black;
}
</style>
</head>

<body>

	<header id="masthead" class="site-header">
		<nav id="primary-navigation" class="site-navigation">
			<div class="container">

				<div class="collapse navbar-collapse" id="agency-navbar-collapse">

					<ul class="nav navbar-nav navbar-right">


						<li><a href="blog.html">회원관리</a></li>
						<li><a href="#" onclick="openMypageModal()">마이페이지</a></li>
						<li><a href="blog.html">작가</a></li>
						<li><a href="contact.html">갤러리</a></li>
						<li><a href="signin.html">로그아웃</a></li>
						<li><a href="signin.html">로그인</a></li>

					</ul>

				</div>




			</div>

		</nav>
		<!-- /.site-navigation -->
	</header>
	<!-- /#mastheaed -->

	<div class="flex-container">
		<div class="top-section">
			<a class="site-title" href="index.html"> <img
				src="resources/assets/img/logo.png" class="logo">
			</a>
		</div>

		<div id="hero" class="hero overlay">
			<div class="hero-content">
				<div class="hero-text"></div>
				<!-- /.hero-text -->
			</div>
			<!-- /.hero-content -->
		</div>
		<!-- /.hero -->
	</div>

	<hr class="separator">

	<div id="searchPopup" style="display: none;">
		<form action="user_management_search" method="get">
			<input type="text" name="query" placeholder="회원 검색..."> <input
				type="submit" value="검색">
			<button type="button" onclick="closeSearchPopup()">X</button>
		</form>
	</div>

	<div class="flex-container">
		<div class="top-section">
			<a class="site-title"> <img src="resources/assets/img/logo.png"
				class="logo">
			</a>
		</div>






		<!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

		<!-- 아래 코드를 기존 코드 바로 아래에 추가해주세요 -->

		<!-- 메뉴 바 -->
		<div class="menu-bar">
			<ul class="menu-items">

				<li><a href="user_management.html" id="fv_at">회원관리</a></li>
				<li><a href="artwork_management.html">작품관리</a></li>
				<li><a href="artist_approval.html">예술가 승인</a></li>
			</ul>
		</div>

		<hr class="separator">


		<!-- 메인 레이아웃: 전체 페이지의 메인 컨테이너 -->
		<main class="main-layout">
			<!-- 콘텐츠 박스: 페이지 내용을 담는 주요 박스 -->
			<div class="content-box">
				<!-- 헤더 섹션: 페이지의 상단 헤더 부분 -->
				<div class="header-section">
					<h2 class="title">회원관리</h2>
					<button id="searchButton">
						<span class="glyphicon glyphicon-search" id="searchIcon"></span>
					</button>
				</div>
				<!-- 테이블 컨테이너: 테이블을 담는 부분 -->
				<div class="table-container">
					<!-- 멤버 테이블: 회원 목록을 보여주는 테이블 -->
					<table class="member-table">
						<!-- 테이블 헤드: 테이블의 열 제목을 나타냄 -->
						<thead>
							<tr class="table-header">
								<th id="count" class="header-cell">번호</th>
								<th id="name" class="header-cell">이름</th>
								<th id="phone" class="header-cell">닉네임</th>
								<th id="email" class="header-cell">이메일</th>
							</tr>
						</thead>
						<!-- 테이블 바디: 실제 데이터가 들어가는 부분 -->


						<tbody class="table-body">
							<!-- 테이블 행: 각 회원의 데이터를 나타내는 행 -->
							<%
							List<Users> users = (List<Users>) request.getAttribute("users");
							  if (users != null && !users.isEmpty()) {
							%>
							<tr class="table-row">
								<td class="data-cell"><p><%=1%></p></td>
								<td class="data-cell"><p><%=users.get(0).getUser_name()%></p></td>
								<td class="data-cell"><p><%=users.get(0).getUser_nick()%></p></td>
								<td class="data-cell"><p><%=users.get(0).getUser_email()%></p></td>
								<td class="data-cell">
									<!-- 로직에 따른 버튼 표시 --> <%
								 if (users.get(0).getUser_role().equals("3")) {
								 %> <a href="unfreezeUser?email=<%=users.get(0).getUser_email()%>"><button
																			class="button">정지해제</button></a> <%
								 } else {
								 %> <a href="stopUser?email=<%=users.get(0).getUser_email()%>"><button
																			class="button">영구정지</button></a> <%
								 }
								 %>
								 
								 <% } else { %>
								 
								<tr>
								<td colspan="4" class="data-cell" style="padding-top: 50px;">검색 결과가 없습니다.</td></tr>

								 <% 
                        }
                        %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="navigation-buttons">
				<!-- 이전 페이지로 이동하는 버튼 -->
				<%-- <a href="user_management?page=<%=pageN - 1%>"><button
						class="nav-button">
						<i class="bi bi-caret-left"></i>
					</button></a> <a href="user_management?page=<%=pageN + 1%>"><button
						class="nav-button">
						<i class="bi bi-caret-right"></i>
					</button></a> --%>
			</div>

		</main>



		<script>
            document.getElementById('searchButton').addEventListener('click', function () {
                document.getElementById('searchPopup').style.display = 'block';
            });

            function closeSearchPopup() {
                document.getElementById('searchPopup').style.display = 'none';
            }

        </script>

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





































		<!-- -------------------------------------------------------------하단---------------------------------------------------------- -->


		<hr class="separator2">


		<div class="row">
			<div class="col-md-3 col-sm-4 col-xs-6">
				<a class="site-title">
					<h2>화도</h2>
				</a>
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