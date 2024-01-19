<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>구매</title>

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
    <link href="resources/assets/css/purchase.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">
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

<%

String awSeq = (String)request.getAttribute("awSeq");
System.out.println(awSeq+"들어왔음");

%>


<main class="portfolio-container">
    <!-- <form class="portfolio-form"> -->
        <h1 class="form-title">작품 구매</h1>
        <p class="form-description">
            
        </p>
        <div class="form-section">
            <!-- 이름 입력 필드 -->
            <div class="input-group">
                <label for="name" class="input-label">이름</label>
                <input type="text" id="name" class="input-field" placeholder="이름을 입력하세요" required />
            </div>

            <!-- 전화번호 입력 필드 -->
            <div class="input-group">
                <label for="phone" class="input-label">전화번호</label>
                <input type="text" id="phone" class="input-field" placeholder="번호를 입력하세요" required />
            </div>

            <div class="input-group">
                <label for="detailAddress" class="input-label">주소</label>
            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample6_address" placeholder="주소"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            <input type="text" id="sample6_extraAddress" placeholder="참고항목">
            </div>




            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

            <div class="input-group">
                <label for="bio" class="input-label">요청사항</label>
                <textarea id="bio" class="input-field3" placeholder="요청사항을 입력해주세요" required></textarea>
            </div>



            <!-- 폼 제출 및 초기화 버튼 -->
            <div class="form-buttons">
                <button type="submit" class="submit-button" onclick="requestPay(<%=awSeq %>)">구매</button>
            </div>
        </div>
    <!-- </form> -->
</main>



<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
    <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
   		 
   		 
        var IMP = window.IMP; 
        IMP.init("imp85467522"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        
        
        
        function requestPay(awSeq) {
        	
        	// 이름 입력 필드의 값을 가져오기
            var name = document.getElementById("name").value;

            // 전화번호 입력 필드의 값을 가져오기
            var phone = document.getElementById("phone").value;


            // 주소 입력 필드의 값을 가져오기
            var postcode = document.getElementById("sample6_postcode").value;
            var address = document.getElementById("sample6_address").value;
            var detailAddress = document.getElementById("sample6_detailAddress").value;
            var extraAddress = document.getElementById("sample6_extraAddress").value;
            
            var addr = postcode + " " + address + " "+ detailAddress + " "+ extraAddress;

            // 요청사항 입력 필드의 값을 가져오기
            var bio = document.getElementById("bio").value;

            
            // 예시: 가져온 값을 콘솔에 출력
            console.log("이름:"+ name);
            console.log("전화번호:"+ phone);
            console.log("주소:"+ addr);
            console.log("요청사항:"+ bio);
        	
        	$.ajax({ 
    			url : 'payment',
    			
    			// 요청 데이터
    			data : { 'awSeq' : awSeq, 'name':name, 'phone':phone, 'addr':addr,'bio': bio },
    			
    			// 요청 방식
    			type : 'get',
    			
    			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    			
    			// 요청-응답 성공
    			success : function(response) {
    		        console.log("통신 성공");
    		        
    		        let data = response.split("/")
    		        console.log(data);
    		        
    		            IMP.request_pay({
    	                pg : 'html5_inicis',
    	                pay_method : 'card',
    	                merchant_uid: "IMP"+makeMerchantUid, 
    	                name : data[0],
    	                amount : parseInt(data[1]),
    	                buyer_email : 'smhrd@smhrd.or.kr',
    	                buyer_name : '아임포트 기술지원팀',
    	                buyer_tel : '062-655-3506',
    	                buyer_addr : '광주 동구 예술길 31-15 3~4, 7층',
    	                buyer_postcode : '123-456',
    	                display: {
    	                    card_quota: [3]  // 할부개월 3개월까지 활성화
    	                }
    	            }, function (rsp) { // callback
    	                if (rsp.success) {
    	                    console.log(rsp);
    	                } else {
    	                    console.log(rsp);
    	                }
    	            }); 
    				
    				
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