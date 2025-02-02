# Apple Market

## 📱 앱 소개

<img src="https://user-images.githubusercontent.com/76909552/210501923-e6214805-5559-44a2-8333-efea03af9300.png" width="200" align ="left">
<img src="https://user-images.githubusercontent.com/76909552/210502128-2fc402f0-d6f9-442a-a7b4-0291846cb67c.png" width="200" >
<img src= "https://user-images.githubusercontent.com/41459466/227640896-ae3304a3-8342-48eb-8e27-792012f727cd.jpg" align = "center">

애플 디바이스 및 관련 제품을 쉽고 빠르게 구매 할 수 있는 앱입니다.

## ✅ 주요기능

1. 쇼핑하기

    - 프로모션 (배너 형식)
        - 할인 하는 것들
        - 연말연시 대폭할인
        - 신학기 할인 (아이패드)
    
    - 내 기기에 맞는 악세서리 쇼핑하기 
        - 내 기기에 맞는 악세서리 자동 추천 
        - 내 기기 등록하기 
        
    - 제품 별로 쇼핑하기
        - 신제품
        - 카테고리별 제품
        
2. 검색

    - 검색
        - 검색기능을 사용해서 원하는 상품 검색 (프론트 엔드 코드로 필터링)
        - 최근 검색 결과 저장 
        
    - 검색결과
        - 상품 리스트
            - 가격순 정렬
            - 상품 구매 페이지로 이동
    
3. 장바구니 (로그인 시 볼 수 있음)

    - 삭제
        - 제품 삭제
        
    - 개수 조절
        - 제품 갯수 조절
        
    - 선택 기능
        - 제품 선택하여 구매하기 
        
    - 최종 구매하기
        - 제품 구매하기 
        
    - 결제 예상 금액(프론트)
        - 제품 합계
        
4. 결제 프로세스
    - 주문단계 
        - 주문 가능 여부 확인
    - 배송 및 결제 정보
        - 배송 확인 가능
        - 결제 정보 확인 가능 
    - 최종 결제하기
        - 구매한 제품 결제하기

5. 마이페이지

    - 내정보
        - 이름
        - 내 기기
        - 내 기기를 추가 및 삭제하기
        
    - 주문 내역 및 현황
        - 주문 내역 
        - 상세 주문 보기 
        
    - 나의 기기 확인
        - 내 기기 추가 되어 있는 것 확인 가능 
        
    - 로그아웃버튼
        - 로그인 뷰
        - 최소 기능
        
    - 회원가입뷰
        - 이름
        - 주소
        - 전화번호

## 문서

### 폴더 컨벤션
```
📦 AppleMarket_customer
|
+ 🗂 Back 종류별 데이터모델, 서버통신 Store 관리
|
+------🗂 CatalougeProduct   // 판매 상품군 데이터모델, Store
│
+------🗂 Order  // 주문서 데이터모델, Store
│
+------🗂 Cart       // 장바구니 데이터모델, Store
│
+------🗂 UserAuth       // 사용자 데이터모델, Store 
│
+ 🗂 Front // 클라이언트에 표시되는 View, ViewModifier 관리
|
+------🗂 ViewModifier      // View에 사용되는 Custom Coponent ViewModifier 관리
│
+------🗂 Views       // 여러 View를 모음
│       |
│       +------🗂 Payment
│               │
│               +------🗂 Cart // 결제창 Cart SubView 관리
│
│       
│       +------🗂 Search
│       |
│       +------🗂 MyPage
|               |
|               +------🗂 MyProfile // Profile SubView 관리
|               |
|               +------🗂 MyMainPage // MyPage Main에 해당되는 SubView 관리
|               |
|               +------🗂 MyDevice // 내 기기 SubView 관리
|               |
|               +------🗂 MyOrder // 내가 주문한 상품 SubView 관리
|               |
|               +------🗂 Login&SignUp // 로그인, 회원가입 View 관리
|
│       +------🗂 Main
|               |
|               +------🗂 MyProduct // 내 기기 관련 상품 View 관리
|               |
|               +------🗂 Main // Main 페이지 View 관리
|               |
|               +------🗂 Detail // 선택 상품 View 관리
|
+------🗂 ViewModifier // View에 사용되는 Custom Component에 대한 ViewModifier 관리

```

### Troubleshooting

1. 메인
    - 초기에 페이지 뷰 적용시 데이터 연동이 되지 않은 문제가 있어 사용하지 못하는
    줄 알았지만 해결 방법을 찾아 적용에 성공함
    
        - 해결방법 : `.tabViewStyle(.page(indexDisplayMode: .never)) --> .tabViewStyle(.page)`
          
    - 화면 이동을 해야하는 뷰가 많아서 로직짜는데 시간이 소요가 많이 됨
    
  
    
    
2. 디테일 뷰 

    - 해당하는 기기의 가격 값을 뽑아오는데 계속해서 빈 값을 불러오는 문제 
        - 뷰의 흐름을 파악하여 어디서 해당 값을 불러와야하는지 찾아서 해결함


3. 검색
    - 검색어가 입력하면 결과가 중복으로 나옴
    
    
4. 장바구니
   - 로그아웃 후 비로그인 상태로 장바구니에 접속할 때 앱이 멈춤
        - 로그인상태일 때만 장바구니 데이터를 불러오게 수정
    - 로그인 했을 때 카트의 상품 존재 여부에 따라 빈 장바구니 화면 or 쌓여있는 장바구니 화면으로 이동해야하는데
        onAppear로 장바구니 데이터를 호출하기 전에 장바구니가 빈 데이터로 나타나 무조건 빈 장바구니 화면으로 이동함
    - navigationStack으로 이동 후 다시 데이터를 불러와서 상품의 존재 여부를 확인 후 뷰 이동 
     
    
5. 결제 프로세스
    - 장바구니에 담긴 상품 정보를 받아 해당 제품들만 결제하는 로직을 적용해야 하는데, 각 데이터별 연동이 되지 않아 초기에 개발이 지연되었음
    - 카트에 담긴 상품을 결제뷰로 가져오고, 배송 수신자 정보를 받아 주문최종확인 뷰로 넘기는 부분에서 이슈가 생겼으나 해결하였음
    
6. 마이페이지 
    - 처음 실행되고 마이 페이지 탭을 누르면 내 기기 데이터가 잘 로드가 되다가 다른 탭을 누른 후 마이 페이지 뷰로 돌아오면 기기 정보를 못 불러오는 이슈가 발생함
    - 유저 정보를 담는 변수가 옵셔널이고, 안에 배열로 저장한 내 기기 정보들을 불러오는 방식이었는데 비동기처리로 인해 유저 정보를 다시 가져올 때 뷰가 그리는 것 보다 늦게 데이터가 로드되는 현상이 발생함
    - 내 기기 정보들은 하위 컬렉션에 독립적으로 담겨있기 때문에 Published로  Device 정보를  직접적으로 담을 수 있는 변수를 만들어 데이터를 담고, 해당 데이터를 불러오는 것으로 해결함 


<details>
<summary>아쉬운 점</summary>
<div markdown="1">

1. 메인 뷰 
- 만들어야 되는 뷰가 많아서 디테일을 살리지 못했다.
- 데이터 구조를 확실히 이해하지 못한점이 아쉽다.
-  tabView, ScrollView, ForEach의 미숙한 활용으로 너무 많은 시간이 소요됐다.

2. 디테일 뷰 
- 최종 금액을 불러와 뷰에 나타내지 못했다.
- 장바구니, 구매하기 버튼 기능을 구현하지 못했다.

3. 검색 뷰
- 내 기기를 바탕으로 검색결과를 필터링을 하는  기능을 구현하려고 했으나 시간이 부족해 구현하지 못했다.
- 사진의 형식이 다 달라서 어떤 이미지는 정해진 규격에서 넘쳐서 아쉽다.

4. 장바구니 뷰
#없음

5. 결제 프로세스 뷰
- 주소 입력 부분에서 드롭다운으로 메뉴를 구현하고 싶었으나 시간 부족으로 구현하지 못했다.
- 애플 홈페이지 디자인을 참고하다 보니 너무 비슷하게 구현한 것 같아서 아쉽다.
- 배송받는사람 정보는 입력한대로 나열되는데, 주문자 정보 부분은 없음. 대부분 같겠지만, 아닌 경우에 주문자 정보를 볼 수가 없어서 아쉽다.

6. 마이페이지 뷰 
- 제일 최근 주문한 정보를 보여주고 싶었는데 시간이 부족해 구현하지 못했다.
- 마이 페이지에서도 기기별 액세서리 쇼핑하기 보여주고 싶었는데 시간이 부족해 구현하지 못했다.
- 주문취소, 반품, 환불 기능을 시간 부족으로 구현하지 못했다.

</div>
</details>

<details>
<summary>이 프로젝트를 처음부터 다시 시작한다면?</summary>
<div markdown="1">

- 시작 전 충분한 회의를 통해 프론트와 백엔드간의 소통이 있었으면 시간 절약이 되었을 것 같다.
    - 프론트와 백엔드가 함께 데이터 구조를 구성하는게 좋았을 것 같다.
    - 시작 전 변수명을 잡고 갔으면 좋겠다.
    
- 디자인 컨셉을 통일하고 진행했으면 전체적인 디자인을 구성하는데 효율적일거 같다.

- 클론코딩인지 다른 ADS인지 확실히 잡고 갔으면 좋겠다.
    - 의도가 "애플 상점을 만들자!" 인지 "애플 스토어를 기반으로 색다른 ADS를 설정해서 구현하자!"인지 헷갈렸습니다.

</div>
</details>

## 활용기술

#### Platforms

<img src="https://img.shields.io/badge/iOS-5A29E4?style=flat&logo=iOS&logoColor=white"/>  
    
#### Language & Tools

<img src="https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=Xcode&logoColor=white"/> <img src="https://img.shields.io/badge/SwiftUI-2396F3?style=flat&logo=Swift&logoColor=white"/> <img src="https://img.shields.io/badge/Swift-F05138?style=flat&logo=swift&logoColor=white"/> <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat&logo=Firebase&logoColor=white"/> <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>

## ⚙️  컨벤션
```swift
- [Feat] : 새로운 기능 추가 
- [Add]: 새로운 파일 추가 (json, img, asset, 목업데이터 등등) 
- [Fix] : 버그 수정 
- [Docs] : 문서 수정 
- [Style] : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우 
- [Refactor] : 코드 리펙토링 
- [Test] : 테스트 코드, 리펙토링 테스트 코드 추가 
- [Chore] : 빌드 업무 수정, 패키지 매니저 수정
```

## 👥 팀원소개

| 최현종 | 
| :--: |
|   <img src = "https://avatars.githubusercontent.com/u/108848166?v=4  " width = "150">   |
| PM |


| 김영서 | 장종환 | 이석준 | 한승수 | 봉혜미 
| :-: | :-: | :-: | :-: | :-: | 
| <img src = "https://avatars.githubusercontent.com/u/114224237?v=4  " width = "100"> | <img src = "https://avatars.githubusercontent.com/u/98254580?v=4" width = "100"> | <img src = "https://avatars.githubusercontent.com/u/76909552?v=4  " width = "100"> | <img src = "https://avatars.githubusercontent.com/u/113982605?v=4 " width = "100"> | <img src = "https://avatars.githubusercontent.com/u/98953443?v=4" width = "100"> |
| 메인 | 장바구니, 메인 | 검색, 팀장 | 검색 | 장바구니 | 



| 신미지 | 이지연 | 홍수만 | 이소영 | 염성필 | 
| :-: | :-: | :-: | :-: | :-: |
|  <img src = "https://avatars.githubusercontent.com/u/62836016?v=4" width = "100"> | <img src = "https://avatars.githubusercontent.com/u/105197393?v=4" width = "100"> | <img src = "https://avatars.githubusercontent.com/u/18048754?v=4" width = "100"> | <img src = "https://avatars.githubusercontent.com/u/114223237?v=4" width = "100"> | <img src = "https://avatars.githubusercontent.com/u/101084872?v=4" width = "100"> | 
| 마이페이지 | 디테일 | 디테일 | 주문관리 | 유저 | 


| 한주희 | 진태영  | 정예슬 | 홍진표 | 윤현기 |
|  :-: |  :--: | :--: | :--: | :--: | 
|<img src = "https://avatars.githubusercontent.com/u/107897929?v=4" width = "100"> |   <img src = "https://avatars.githubusercontent.com/u/41459466?v=4" width = "100">   | <img src = "https://avatars.githubusercontent.com/u/71593182?v=4 " width = "100">  | <img src = "https://avatars.githubusercontent.com/u/52193695?v=4" width = "100">  | <img src = "https://avatars.githubusercontent.com/u/84693317?v=4" width = "100"> 
| 장바구니, 유저 | 유저, 상품, 팀장 |  유저, 상품 |  주문관리 | 결제, 주문 |

* 각 역할은 유동적으로 조정되었음
