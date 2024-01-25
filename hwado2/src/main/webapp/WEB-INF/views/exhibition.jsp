<%@page import="kr.smhrd.entity.Users"%>
<%@page import="kr.smhrd.entity.ArtworkImage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>전시회</title>

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
	<link rel="icon" type="image/png" sizes="15x15" href="resources/assets/img/logo.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/assets/css/exhibition.css" rel="stylesheet">
    <link href="resources/assets/css/font_bold.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/responsive.css" rel="stylesheet">
    <link href="resources/assets/css/mypage1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/mypage.css">

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

.artwork-image {
    display: flex;
    justify-content: center;
    align-items: center;

}
.artwork-description{
	max-width: 50%;
    margin: 0 auto;
    line-height: 29px;
}
.image-slider {
	justify-content: center;
}

    </style>
</head>
<body oncontextmenu="return false" oncopy="return false" ondragstart="return false" onselectstart="return false">
	<% String savePath = "./resources/profile"; 
    	List<ArtworkImage> exhibition = (List<ArtworkImage>)request.getAttribute("exhibition");%>

    
                                 <a href="artist"><p class="back_returns">뒤로가기</p></a>           
                       <p class="artist_info">❝ <%= exhibition.get(0).getUser_nick() %>의 갤러리 ❞</p>
                     

                 

          


    
       
    <!-- -------------------------------------------------------------상단---------------------------------------------------------- -->

<!-- 메뉴 바 -->
<div class="slider-container">
    <div class="image-slider">
    <% if (exhibition != null) { 
    for(int i = 0; i < exhibition.size(); i++){%>
        <img src="<%=savePath + "/" + exhibition.get(i).getAp_title()%>" alt="이미지">
        <%} 
        	}%>
        <!-- 더 많은 이미지를 추가할 수 있습니다 -->
    </div>
</div>

<div class="exhibition-container">
    
    <div class="exhibition-content">
        <div class="artwork-image">
            <button id="prevButton" class="glyphicon glyphicon-menu-left" ></button>
            <img src="<%=savePath + "/" + exhibition.get(0).getAp_title()%>" alt="Artwork Image" class="exhibit-img">
            <button id="nextButton" class="glyphicon glyphicon-menu-right" ></button>
        </div>
        <div class="artwork-info">
            <h2 class="artwork-title"><%=exhibition.get(0).getAw_title()%></h2>
            <p class="artwork-description"><%=exhibition.get(0).getAp_desc()%></p>
        </div>
        </div>
    </div>


    <!-- -------------------------------------------------------------하단---------------------------------------------------------- -->



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

<script>

    $(document).ready(function(){
    
    const artworks = [];

    <% if (exhibition != null) { 
        for (ArtworkImage artworkImage : exhibition) { %>
            artworks.push({
                imgFilename: `<%= savePath + "/" + artworkImage.getAp_title() %>`,
                awName: `<%= artworkImage.getAw_title() %>`,
                awDesc: `<%= artworkImage.getAp_desc() %>`
            });
        <% } 
    } %>

    let currentImageIndex = 0;
    const img = document.querySelector(".exhibit-img");
    const title = document.querySelector(".artwork-title");
    const description = document.querySelector(".artwork-description");
    
  

    function updateArtworkDisplay() {
        if (artworks.length > 0) {
            const artwork = artworks[currentImageIndex];
            img.src = artwork.imgFilename;
            title.innerHTML = artwork.awName;
            description.textContent = artwork.awDesc;
        }
    }

    function prev() {
    	console.log("prev")
        if(currentImageIndex == 0) {
            currentImageIndex = artworks.length - 1;
        } else {
            currentImageIndex -= 1;
        }
        updateArtworkDisplay();
    }

    function next() {
        if (currentImageIndex == artworks.length - 1) {
            currentImageIndex = 0;
        } else {
            currentImageIndex += 1;
        }
        updateArtworkDisplay();
    }
    
    document.getElementById("prevButton").addEventListener("click", prev);
    document.getElementById("nextButton").addEventListener("click", next);

    })
</script>

</body>
</html>