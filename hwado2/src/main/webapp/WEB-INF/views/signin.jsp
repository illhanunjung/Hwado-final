<%@page import="kr.smhrd.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
<meta charset="UTF-8">
<title>로그인/회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/assets/css/signin.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- External JavaScript -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.5/angular.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<style>
.login-page {
    background-image: url('resources/assets/img/land5.jpg');
    background-size: cover; /* 이미지를 화면에 맞게 조절 */
    background-repeat: no-repeat; /* 이미지 반복 없이 한 번만 표시 */
    background-position: center;
}
</style>


</head>
<body>




<div class="login-page" ng-app="">
   <div class="login-content login-content-signin" ng-hide="showSignIn">
      <div>
        <a href="./"> <img src="resources/assets/img/logo.png" alt="로그인 이미지" width="160" height="140"
            style="display: block; margin: 0 auto;"></a>
        <form class="wrapper-box" role="form" ng-submit="login()" action="userSelect" method="post">
               <input type="text" ng-model="email" class="form-control form-control-email"
               name="user_email" placeholder="이메일 주소" required>
                <input type="password" ng-model="password" class="form-control form-control-password"
               name="user_pw" placeholder="비밀번호" required>

<!--             <a class="outer-link pull-left" onclick="openModal()"
               style="margin-right: 10px;">비밀번호 찾기</a> -->
 
                  <button type="submit" class="btn btn-submit btn-default pull-right" >로그인</button>

         </form>
   
        
      </div>
   </div>
   
   
<!--    <div id="forgotPasswordModal" class="modal">
      <div class="modal-content">
         <span class="close" onclick="closeModal()">&times;</span>
         비밀번호 찾기에 관련된 폼 요소들을 추가하세요
         <a href="./"><img src="resources/assets/img/logo.png" alt="로그인 이미지" width="160" height="140"
            style="display: block; margin: 0 auto;"></a>
         <form>
            비밀번호 찾기에 필요한 입력 필드들을 추가하세요
            예: 이메일 주소 입력 등
            <div class="form-group">
               <label for="nickname">이메일</label> <input type="email"
                  ng-model="email" class="form-control form-control-email"
                  name="email" placeholder="Email address" required>
            </div>
            <div class="form-group">
               <label for="nickname">닉네임</label> <input type="text"
                  ng-model="username" class="form-control form-control-username"
                  name="id" placeholder="Nick" required>
            </div>
            
            <button type="submit" class="find">비밀번호 재설정 링크 요청</button>
         </form>
      </div>
   </div>
 -->
   <div id="forgotIdModal" class="modal">
      <div class="modal-content">
         <span class="close" onclick="closeIdModal()">&times;</span> <img
            src="resources/assets/img/logo.png" alt="로그인 이미지" width="160" height="140"
            style="display: block; margin: 0 auto;">
         <form>
            <div class="form-group">
               <label for="nickname">닉네임</label> <input type="text"
                  ng-model="nickname" class="form-control form-control-nickname"
                  name="nick" placeholder="닉네임을 입력해주세요" required>
            </div>
            <div class="form-group">
               <label for="email">이메일 주소</label> <input type="email"
                  ng-model="email" class="form-control form-control-email"
                  name="email" placeholder="이메일 주소를 입력해주세요" required>
            </div>
            <button type="submit" class="find">아이디 찾기 요청</button>
         </form>
      </div>
   </div>


   <script>
      // 모달 열기 함수
      function openModal() {
         var modal = document.getElementById('forgotPasswordModal');
         modal.style.display = 'flex'; // display 속성 변경
      }

      // 모달 닫기 함수
      function closeModal() {
         var modal = document.getElementById('forgotPasswordModal');
         modal.style.display = 'none';
      }

      // 비밀번호 찾기 버튼에 모달 열기 함수 연결
      document.querySelector('.outer-link-find-password')
            .addEventListener('click', function(event) {
               event.preventDefault();
               openModal();
            });

      document.querySelector('.outer-link-find-id').addEventListener(
            'click', function(event) {
               event.preventDefault();
               openIdModal();
            });

      // 아이디 찾기 모달 열기 함수
      function openIdModal() {
         var modal = document.getElementById('forgotIdModal');
         modal.style.display = 'flex';
      }

      // 아이디 찾기 모달 닫기 함수
      function closeIdModal() {
         var modal = document.getElementById('forgotIdModal');
         modal.style.display = 'none';
      }
   </script>


 <div class="login-content login-content-signup ng-hide"
         ng-show="showSignIn">
         <div>
            <a href="./">
            <img src="resources/assets/img/logo.png" alt="로그인 이미지" width="160" height="140"
               style="display: block; margin: 0 auto;"></a>
               
            <form class="wrapper-box" role="form" ng-submit="register()"
               action="usersInsert" method="post"
               style="margin: 0; padding: 0;">
                <input type="email" id ="inputE"
                  ng-model="email" class="form-control form-control-email"
                  name="user_email" placeholder="이메일 주소"  required> 
                  <button type="submit" value="중복체크" onclick="checkE()" class="dupliy"
               style="margin: 10; padding: 20;">중복확인</button>
               <span id="resultCheck"></span>

                 <input type="password" ng-model="password" id="password" class="form-control" name="user_pw"  placeholder="비밀번호" required>
                 <span name ="pw_check"></span>
		    	<input type="password" id="passwordCheck" class="form-control" name="pwcheck" placeholder="비밀번호 확인" onkeyup="checkPasswordMatch()" required>
		    	<div id="passwordMatchFeedback"></div>

                 <input type="text" ng-model="nickname" class="form-control form-control-nickname"
                  name="user_nick" placeholder="닉네임을 입력해주세요" required>
             
			    <!-- 카카오 API로부터 받은 데이터 필드 추가 -->
			    <input type="hidden" name="user_name" id="kakaoUserName" />
			    <input type="hidden" name="user_birthdate" id="kakaoUserBirthdate" />
       	 	<button type="button" id="verifyButton" class="btn btn-primary" onclick="kakaoLogin()"> 카카오 본인인증 </a></button>
               <button type="submit" class="btn btn-submit btn-default pull-right"
                  style="margin: 10; padding: 20;">회원가입</button>
           
             <script type="text/javascript"> 
               function checkE(){ 
			var inputE = $('#inputE').val()
			console.log(inputE)
			
			$.ajax({ //json 형식 -> {key : value, key:value}
				//어디로 요청할 것인지(요청url)
				url: 'emailCheck',
				//요청데이터
				data : {'inputE':inputE},
				//요청방식
				type : 'get',				
				//요청-응답 성공
				success : function(data){
					//alert(data)
					if(data ==0){
						$('#resultCheck').text('이미 있는 이메일')
					}else{
						$('#resultCheck').text('사용 가능한 이메일!')
					}
				},
				//요청-응답 실패
				error : function(){
					alert("통신 실패!")
				}
			})
			}
            </script>
            
            <script type="text/javascript">
            window.Kakao.init('d09b93f458cbb1adee5843b034ac37f4'); // js 앱키
            var isVerified = false; // 본인인증 완료 여부

            function kakaoLogin() {
                window.Kakao.Auth.login({
                    scope: 'name, birthday, birthyear', //개인정보 활성화된 ID값
                    success: function(a) {
                    	isVerified = true;
                        console.log(a) // 로그인 성공하면 받아오는 데이터
                        window.Kakao.API.request({ // 사용자 정보 가져오기 
                            url: '/v2/user/me',
                            success:res => {
                                const kakao_account = res.kakao_account;
                                console.log(kakao_account);
                                var user_name = res.kakao_account.name;
                               	var birthday = res.kakao_account.birthday;
                               	var birthyear = res.kakao_account.birthyear;
                               	var user_birthdate = birthyear + birthday;
                               	
                                console.log("이름",user_name,"생년월일",user_birthdate);
                                
                                // 숨겨진 폼 필드에 데이터 설정
                                document.getElementById('kakaoUserName').value = user_name;
                                document.getElementById('kakaoUserBirthdate').value = user_birthdate;
                            },
                            fail: function(error) {
                                console.log(error);
                            }
                        });
                    }
                document.querySelector('.btn-submit').addEventListener('click', function(event) {
                    if (!isVerified) {
                        event.preventDefault();
                        alert('본인인증을 해주세요.');
                    }
                });
            </script>
			<script>
			   function checkPasswordMatch() {
			       var password = document.getElementById("password").value;
			       var confirmPassword = document.getElementById("passwordCheck").value;
			       var feedback = document.getElementById("passwordMatchFeedback");
			   
			       if (password != confirmPassword) {
			           feedback.textContent = "비밀번호가 일치하지 않습니다.";
			           feedback.style.color = "red";
			       } else {
			           feedback.textContent = "비밀번호가 일치합니다.";
			           feedback.style.color = "green";
			       }
			   }
			   </script>
 
         </form>
      </div>
   </div>



   <div class="login-switcher">
      <div class="login-switcher-signin" ng-show="showSignIn">
         <h3>반갑습니다!</h3>
         <button ng-click="showSignIn=false">로그인</button>
      </div>
      <div class="login-switcher-signup" ng-hide="showSignIn">
         <h3>저희와 함께 하시겠습니까?</h3>
         <button ng-click="showSignIn=true">회원가입</button>
      </div>
   </div>
   
   
</div>
<script type="text/javascript"> 
    document.getElementById("goLogin").addEventListener("click", function() {
       window.location.href = "userLogin";
  });
    
    </script>

</body>
</html>