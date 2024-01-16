<%@page import="kr.smhrd.entity.Users"%>
<%@page import="kr.smhrd.entity.Portfolios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예술가 포트폴리오</title>
</head> 

<h1>예술가 포트폴리오</h1>

<!-- 작가 정보 -->
<p>작가 이름: ${user.user_name}</p>

<!-- 작품 정보 -->
<h2>작품 정보</h2>
<ul>
    <li>작품 제목: ${portfolio.pf_title}</li>
    <li>작품 설명: ${portfolio.pf_desc}</li>
</ul>

<!-- 작품 이미지 -->
<h2>작품 이미지</h2>
<div class="portfolio-images">
    <img src="./resources/portfolios/${portfolio.pf_file1}" >
    <img src="${portfolio.pf_file2}" alt="빈칸">
    <img src="${portfolio.pf_file3}" alt="빈칸">
</div>

</body>
</html>
