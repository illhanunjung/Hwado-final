# :pushpin: Hwado
>무명 예술가들을 위한 C2C 플렛폼

</br>

## 1. 제작 기간 & 참여 인원
- 2024년 1월 8일 ~ 1월 24일
- 팀 프로젝트
- 팀장 송세림
- 팀원 이건학
- 팀원 박지뉴
- 팀원 지수빈

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 1.6
  - Spring FrameWork
  - MySQL 8.5.26
  - Python 3.9
  - Flask
  - Tomcat
  - Mybatis
#### `Front-end`
  - HTML
  - CSS
  - Javascript
  - Ajax
#### `API`
  - Kakao Login API
  - PortOne API
  - Kakao Map API
  - 스마트택배 API
#### `Model`
  - VGG16
</br>

## 3. ERD 설계
![화도 (2)](https://github.com/illhanunjung/Hwado-final/assets/114290412/141390c4-34de-4fca-b073-440f5d357c99)


## 4. 핵심 기능
- 추천 알고리즘 ( VGG16 )
- 메이슨리 라이브러리 ( 자유 레이아웃 )
- Kakao Login API
- PortOne API
- 스마트택배 API
- Kakao Map API
- 좋아요 기능
- 경매 기능


<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![시스템 아키텍쳐](https://github.com/illhanunjung/Hwado-final/assets/153901490/bae78183-b86a-4ac2-b16a-053209b4b2a2)
<br>

### 4.2. 추천 알고리즘
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/fd7b2699-2010-40b8-8987-bf0517e65e41)
<br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/resources/py/RecommendationAlgorithm.py)
- VGG16은 이미지 분류에 널리 사용되는 심층 학습 모델입니다. 여기서는 이미지의 특징을 추출하기 위해 VGG16의 weights='imagenet'와 include_top=False 옵션을 사용하여 모델을 로드합니다.
- extract_features 함수는 주어진 이미지 경로에서 이미지를 로드하고, VGG16 모델을 사용하여 이미지의 특징 벡터를 추출합니다. 이 벡터는 이미지의 시각적 콘텐츠를 수치화한 것입니다.
- extract_all_features 함수는 지정된 디렉토리 내의 모든 이미지에 대해 extract_features 함수를 호출하고, 각 이미지의 특징 벡터와 파일 이름을 저장합니다.
- find_similar_images 함수는 쿼리 이미지의 특징 벡터와 다른 모든 이미지의 특징 벡터 사이의 코사인 유사도를 계산하고, 가장 유사한 이미지들의 인덱스를 반환합니다.
- Flask를 사용하여 웹 서버를 구성하고, /get_similar_images 엔드포인트를 통해 이미지 추천 기능을 제공합니다. 클라이언트가 이 엔드포인트로 POST 요청을 보내면, 요청된 이미지와 유사한 이미지를 찾아 반환합니다.
- 서버 측에서 예외가 발생하면, 이를 클라이언트에 전달하여 에러 메시지를 표시할 수 있도록 합니다.
- 마지막으로, 스크립트는 지정된 IP 주소와 포트에서 Flask 애플리케이션을 실행합니다.
<br>

### 4.3. 메이슨리 라이브러리 ( 자유 레이아웃 )
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/d0da0406-2050-43a1-9cf9-d3f005046244)
<br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/main.jsp)
- 메이슨리와 관련된 JavaScript 라이브러리와 의존성들이 추가되어 있습니다. 예를 들어, masonry.pkgd.min.js와 imagesloaded.pkgd.min.js 스크립트가 HTML 헤더 부분에 포함되어 있습니다.
- HTML에서 메이슨리를 적용할 요소들을 정의합니다. 이 경우, div 태그와 클래스 list2를 사용하여 메이슨리 레이아웃이 적용될 영역을 지정하고 있습니다. 각 아이템은 list2-item 클래스를 사용하여 정의됩니다.
- 메이슨리 레이아웃의 각 아이템에 대한 스타일을 CSS를 통해 정의합니다. 여기서는 .list2-item에 대한 스타일을 지정하여 각 항목의 너비, 여백 등을 설정합니다.
- 페이지의 JavaScript 부분에서 메이슨리 라이브러리를 초기화하고 설정합니다. $(window).on('load', function(){ ... }); 코드 블록 내에서 메이슨리를 초기화하고, 각 항목(itemSelector)의 선택자와 열(columnWidth)의 너비 등을 지정합니다.
<br>

### 4.4. Kakao Login API
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/e9123860-feb2-4a9b-bc4a-f0ea868fd70d)
 <br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/signin.jsp)
- 웹 페이지에는 카카오 SDK를 초기화하기 위한 스크립트가 포함되어 있습니다.
window.Kakao.init('사용자 키'); 코드를 사용하여 카카오 SDK를 초기화합니다. 여기서 제공된 문자열은 카카오 앱의 JavaScript 키입니다.
- 회원가입 폼에는 "카카오 본인인증" 버튼(<button type="button" id="verifyButton" class="btn btn-primary" onclick="kakaoLogin()"> 카카오 본인인증 </a></button>)이 있습니다.
이 버튼을 클릭하면 kakaoLogin 함수가 호출됩니다.
- kakaoLogin 함수는 카카오 로그인을 통해 사용자의 이름, 생일, 출생년도에 접근합니다. 이를 위해 scope에 'name', 'birthday', 'birthyear'를 요청합니다.
사용자가 로그인에 성공하면, window.Kakao.API.request 함수를 사용하여 사용자 정보를 요청합니다.
- 사용자 정보 요청이 성공하면, 반환된 데이터에서 사용자의 이름, 생일, 출생년도를 추출합니다.
이 정보는 숨겨진 입력 필드(<input type="hidden" name="user_name" id="kakaoUserName" />, <input type="hidden" name="user_birthdate" id="kakaoUserBirthdate" />)에 저장됩니다.
- 회원가입 버튼 클릭 시, isVerified 변수를 확인하여 본인인증이 완료되었는지 검사합니다.
본인인증이 완료되지 않았다면, 폼 제출을 중단하고 사용자에게 본인인증을 요청하는 알림을 표시합니다.
<br>

### 4.5. PortOne API
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/7d7e7429-ad75-4b6e-8520-07bc7a709319)
 <br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/purchase.jsp)
- 페이지에는 Iamport 결제 관련 JavaScript 라이브러리가 포함되어 있어 API 기능을 사용할 수 있습니다.
- var IMP = window.IMP; IMP.init("imp85467522");: 이 코드를 통해 Iamport를 초기화합니다. 여기서 "imp85467522"는 Iamport에서 제공한 고유한 가맹점 식별자입니다.
- function requestPay() { ... }: 사용자가 '구매' 버튼을 클릭하면 이 함수가 실행됩니다. 이 함수는 사용자의 입력 데이터와 함께 Iamport 결제 요청을 처리합니다.
- 사용자로부터 이름, 전화번호, 주소 등의 정보를 입력 받습니다. 이 데이터는 결제 요청에 포함됩니다.
- 서버에 Ajax 요청을 보내 결제에 필요한 데이터(예: 상품명, 가격)를 받아옵니다. 받아온 데이터는 response 변수에 저장되며, 이후 Iamport 결제 요청에 사용됩니다.
- IMP.request_pay({...}): 이 함수를 통해 실제 결제 창을 호출합니다. 여기에는 결제 관련 상세 정보(결제 수단, 상품명, 가격, 구매자 정보 등)가 포함됩니다.
- 결제 정보에는 pg, pay_method, merchant_uid, name, amount, buyer_email, buyer_name, buyer_tel, buyer_addr, buyer_postcode 등의 필드가 포함되어, 이를 통해 결제 과정에서 필요한 모든 정보를 Iamport에 전달합니다.
<br>

### 4.6. 스마트 택배 API
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/722f9784-e801-4422-8493-724d88998e89)
 <br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/delivery.jsp)
-  먼저, 스마트택배 서비스에서 API 키를 발급받습니다. 이 키는 웹 페이지나 애플리케이션의 코드 내에서 보안상의 이유로 숨겨져야 합니다.
이를 위해 HTML의 input 요소에 type="hidden" 속성을 사용하여 API 키를 숨겼습니다.
- 사용자가 다양한 택배 회사 중에서 선택할 수 있는 드롭다운 메뉴를 제공했습니다. 이를 통해 사용자는 자신이 이용하는 택배 서비스를 쉽게 선택할 수 있습니다.
- 사용자가 자신의 운송장 번호를 입력할 수 있는 입력란을 제공합니다. 이 번호는 배송 조회를 위해 필요합니다. 사용자가 운송장 번호를 입력하고 나면, '조회' 버튼을 클릭하여 배송 상태를 확인할 수 있습니다.
- 조회 버튼을 클릭하면, 시스템은 선택된 택배 회사와 입력된 운송장 번호를 사용하여 스마트택배 API에 요청을 보냅니다. 이때 숨겨진 API 키도 함께 전송됩니다.
- 스마트택배 API로부터 반환된 배송 상태 정보는 사용자에게 표시됩니다. 이 정보에는 상품의 현재 위치, 배송 단계, 예상 도착 시간 등이 포함될 수 있습니다.
<br>

### 4.7. Kakao Map API
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/46ae747f-a572-4d8f-9507-293436c26605)
<br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/purchase.jsp)
- 주소 검색 필드 제공: 사용자는 '주소', '상세주소', '참고항목'을 입력할 수 있는 입력 필드를 사용합니다. 이 중 '주소' 필드는 카카오주소 API와 직접 연동됩니다.
- 사용자는 '우편번호 찾기' 버튼을 클릭하여 주소 검색을 시작할 수 있습니다. 이 버튼은 카카오주소 API의 기능을 호출합니다.
- 페이지에는 카카오주소 API를 사용하기 위한 JavaScript 스크립트(<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>)가 포함되어 있습니다.
- sample6_execDaumPostcode 함수는 카카오주소 API를 사용하여 주소 검색을 실행합니다. 이 함수는 사용자가 주소를 검색할 때 실행됩니다.
- 사용자가 검색 결과 중 하나를 선택하면, 선택된 주소 정보는 '우편번호', '주소', '참고항목' 필드에 자동으로 채워집니다. 이를 위해 카카오주소 API에서 반환된 데이터(data)를 활용합니다.
<br>

### 4.8. 좋아요 기능
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/3461431b-5a98-4be8-be9e-d92d928d68d3)
<br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/artist.jsp)
- 각 작가의 프로필이나 작품 옆에는 '좋아요' 버튼(<button class="heart-button">)이 있습니다. 이 버튼에는 하트 아이콘이 (glyphicon-heart 또는 glyphicon-heart-empty) 포함되어 있으며, 사용자가 좋아하는 작가나 작품을 표시하는 데 사용됩니다.
- 좋아요 버튼의 클래스(filled 또는 빈 상태)는 사용자가 해당 작가나 작품을 이미 '좋아요' 했는지 여부를 나타냅니다. 사용자가 이미 '좋아요'를 했다면 glyphicon-heart와 filled 클래스가 사용되고, 그렇지 않으면 glyphicon-heart-empty 아이콘이 사용됩니다.
- 사용자가 좋아요 버튼을 클릭하면 likeTF 함수가 호출됩니다. 이 함수는 AJAX를 사용하여 서버에 좋아요 상태 변경을 요청합니다.
- likeTF 함수는 좋아요 버튼의 데이터 속성에서 사용자 이메일(data-user_email), 작가 페이지 시퀀스(data-ap_seq), 작가 이메일(data-artist_email)을 가져옵니다.
이 정보는 서버에 보내지며, 서버는 이를 바탕으로 사용자의 좋아요 목록을 업데이트합니다.
- AJAX 요청이 성공적으로 처리되면 페이지가 새로고침되어 좋아요 상태가 최신 상태로 반영됩니다.
<br>

### 4.9. 경매 기능
![image](https://github.com/illhanunjung/Hwado-final/assets/153901490/9011793f-93b0-4136-b32e-2fc075322ca8)
<br>
[코드 확인](https://github.com/illhanunjung/Hwado-final/blob/master/hwado2/src/main/webapp/WEB-INF/views/auction_detail.jsp)
- 페이지 상단에서 다양한 클래스(Artworks, AUCTIONS, IMAGES 등)를 임포트하여, 경매에 필요한 데이터(작품 정보, 이미지, 경매 상세 등)를 불러옵니다. 이러한 데이터는 서버에서 제공되며, JSP 페이지에서 사용됩니다.
- JavaScript를 사용하여 경매 종료 시간까지 남은 시간을 표시하는 타이머 기능이 구현되어 있습니다. updateTimer 함수는 현재 시간과 경매 종료 시간을 비교하여 남은 시간을 계산하고, 이를 페이지에 표시합니다.
- 경매에 참여할 작품의 상세 정보(이미지, 설명, 시작 가격 등)가 표시됩니다. 이 정보는 서버로부터 받은 데이터를 기반으로 하며, 사용자에게 작품에 대한 충분한 정보를 제공합니다.
- 사용자가 입찰을 할 수 있는 버튼이 제공됩니다. 이 버튼을 클릭하면 auction_bid 페이지로 이동하여 사용자가 입찰을 할 수 있습니다.


</div>
</details>

</br>

## 5. 트러블 슈팅
<details>
<summary></summary>
<div markdown="1">

- 
- `

</div>
</details>

<details>
<summary></summary>
<div markdown="1">

- 
- `

</div>
</details>

<details>
<summary></summary>
<div markdown="1">

- 
- `

</div>
</details>

<details>
<summary></summary>
<div markdown="1">

- 
- `

</div>
</details>
<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>

<details>
<summary>ElementUI input 박스에서 `v-on:keyup.enter="메소드명"`이 정상 작동 안하는 문제</summary>
<div markdown="1">
  
  - `v-on:keyup.enter.native=""` 와 같이 .native 추가로 해결
  
</div>
</details>

<details>
<summary> Post 목록 출력시에 Member 객체 출력 에러 </summary>
<div markdown="1">
  
  - 에러 메세지(500에러)
    - No serializer found for class org.hibernate.proxy.pojo.javassist.JavassistLazyInitializer and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.SerializationFeature.FAIL_ON_EMPTY_BEANS)
  - 해결
    - Post 엔티티에 @ManyToOne 연관관계 매핑을 LAZY 옵션에서 기본(EAGER)옵션으로 수정
  
</div>
</details>
    
<details>
<summary> 프로젝트를 git init으로 생성 후 발생하는 npm run dev/build 오류 문제 </summary>
<div markdown="1">
  
  ```jsx
    $ npm run dev
    npm ERR! path C:\Users\integer\IdeaProjects\pilot\package.json
    npm ERR! code ENOENT
    npm ERR! errno -4058
    npm ERR! syscall open
    npm ERR! enoent ENOENT: no such file or directory, open 'C:\Users\integer\IdeaProjects\pilot\package.json'
    npm ERR! enoent This is related to npm not being able to find a file.
    npm ERR! enoent

    npm ERR! A complete log of this run can be found in:
    npm ERR!     C:\Users\integer\AppData\Roaming\npm-cache\_logs\2019-02-25T01_23_19_131Z-debug.log
  ```
  
  - 단순히 npm run dev/build 명령을 입력한 경로가 문제였다.
   
</div>
</details>    

<details>
<summary> 태그 선택후 등록하기 누를 때 `object references an unsaved transient instance - save the transient instance before flushing` 오류</summary>
<div markdown="1">
  
  - Post 엔티티의 @ManyToMany에 영속성 전이(cascade=CascadeType.ALL) 추가
    - JPA에서 Entity를 저장할 때 연관된 모든 Entity는 영속상태여야 한다.
    - CascadeType.PERSIST 옵션으로 부모와 자식 Enitity를 한 번에 영속화할 수 있다.
    - 참고
        - [https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218](https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218)
   
</div>
</details>    

<details>
<summary> JSON: Infinite recursion (StackOverflowError)</summary>
<div markdown="1">
  
  - @JsonIgnoreProperties 사용으로 해결
    - 참고
        - [http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html](http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html)
        - [https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue](https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue)
        
</div>
</details>  
    
<details>
<summary> H2 접속문제</summary>
<div markdown="1">
  
  - H2의 JDBC URL이 jdbc:h2:~/test 으로 되어있으면 jdbc:h2:mem:testdb 으로 변경해서 접속해야 한다.
        
</div>
</details> 
    
<details>
<summary> 컨텐츠수정 모달창에서 태그 셀렉트박스 드랍다운이 뒤쪽에 보이는 문제</summary>
<div markdown="1">
  
   - ElementUI의 Global Config에 옵션 추가하면 해결
     - main.js 파일에 `Vue.us(ElementUI, { zIndex: 9999 });` 옵션 추가(9999 이하면 안됌)
   - 참고
     - [https://element.eleme.io/#/en-US/component/quickstart#global-config](https://element.eleme.io/#/en-US/component/quickstart#global-config)
        
</div>
</details> 

<details>
<summary> HTTP delete Request시 개발자도구의 XHR(XMLHttpRequest )에서 delete요청이 2번씩 찍히는 이유</summary>
<div markdown="1">
  
  - When you try to send a XMLHttpRequest to a different domain than the page is hosted, you are violating the same-origin policy. However, this situation became somewhat common, many technics are introduced. CORS is one of them.

        In short, server that you are sending the DELETE request allows cross domain requests. In the process, there should be a **preflight** call and that is the **HTTP OPTION** call.

        So, you are having two responses for the **OPTION** and **DELETE** call.

        see [MDN page for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

    - 출처 : [https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o](https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o)
        
</div>
</details> 

<details>
<summary> 이미지 파싱 시 og:image 경로가 달라서 제대로 파싱이 안되는 경우</summary>
<div markdown="1">
  
  - UserAgent 설정으로 해결
        - [https://www.javacodeexamples.com/jsoup-set-user-agent-example/760](https://www.javacodeexamples.com/jsoup-set-user-agent-example/760)
        - [http://www.useragentstring.com/](http://www.useragentstring.com/)
        
</div>
</details> 
    
<details>
<summary> 구글 로그인으로 로그인한 사용자의 정보를 가져오는 방법이 스프링 2.0대 버전에서 달라진 것</summary>
<div markdown="1">
  
  - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

    ```jsx
    @RequestMapping("/sso/user")
    @SuppressWarnings("unchecked")
    public Map<String, String> user(Principal principal) {
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            logger.info("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            map.put("email", details.get("email"));
            return map;
        }
        return null;
    }
    ```

    - 2.0대 버전에서는
    - 아래와 같이 principal 객체의 내용을 꺼내 쓸 수 있다.

    ```jsx
    UsernamePasswordAuthenticationToken token =
                    (UsernamePasswordAuthenticationToken) SecurityContextHolder
                            .getContext().getAuthentication();
            Map<String, Object> map = (Map<String, Object>) token.getPrincipal();

            String email = String.valueOf(map.get("email"));
            post.setMember(memberRepository.findByEmail(email));
    ```
        
</div>
</details> 
    
<details>
<summary> 랭킹 동점자 처리 문제</summary>
<div markdown="1">
  
  - PageRequest의 Sort부분에서 properties를 "rankPoint"를 주고 "likeCnt"를 줘서 댓글수보다 좋아요수가 우선순위 갖도록 설정.
  - 좋아요 수도 똑같다면..........
        
</div>
</details> 
    
</br>

  
## 6. 팀원 소개 및 느낀점

<details>
<summary><b>팀원 소개 펼치기</b></summary>
<div markdown="1">
  
#### 팀장 송세림
- 포트폴리오 페이지
- 포트폴리오 기능 
- 예술가 신청 기능
- 로그인 기능
- 회원가입 기능
- Kakao login API
- 시스템 아키텍쳐 
- 유스케이스
- 테이블 명세
- 서비스 흐름도
- 페이지 연동
- DB관리
- 데이터 등록
- PPT제작
- 일정관리
#### 팀원 이건학
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div>
#### `Front-End`
- 예술가 승인 페이지
- 작품관리 페이지
- 경매 페이지
- 경매입찰 페이지
- 전시 페이지
- 메인 페이지
- 관심작품 페이지
- 작품페이지
- 회원가입 페이지
- 회원관리 페이지
#### `Back-end`
- 메인 페이지
- 전시 페이지
- 구매내역 페이지
- 작가 페이지
- 마이 페이지
#### `기타`
- 데이터 크롤링
- 화면설계서
- 시연페이퍼
- ppt제작
</div>
#### 팀원 박지뉴
-
-
-
-
#### 팀원 지수빈
프론트엔드
- 경매 결과 확인 페이지 제작

백엔드
- VGG16 모델과 코사인 유사도를 활용한 추천 알고리즘 구현
- 일반 상품 등록 페이지 기능 구현
- 일반 상품 출력 페이지 기능 구현
- 일반 상품 상세 페이지 기능 구현
- 경매 등록 페이지 기능 구현
- 경매 출력 페이지 기능 구현
- 경매 상세 페이지 기능 구현
- 관심 상품 등록 기능 구현
- 관심 상품 출력 페이지 기능 구현
- 메인 페이지 상품 상세 페이지 이동 기능 구현
- 장바구니 등록 기능 구현
- 장바구니 출력 페이지 기능 구현
- 구매 페이지 기능 구현
- 포트원 API를 활용한 결제 기능 구현
- 작가 개인 페이지 기능 구현
- 작가 프로필 등록 기능 구현
- 경매 확인 페이지 기능 구현
- 경매 마감 기능 구현
- 카테고리 검색 기능 구현
- 플라스크 서버 연동
- DB 설계
