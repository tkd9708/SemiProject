<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/image/favicon.ico">
<%
String url=request.getContextPath();
System.out.println(url);
%>
<link rel="stylesheet" type="text/css" href="<%=url%>/member/css/loginform.css">
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
</head>
<body>
	<!-- 헤더시작 -->
	<header>
		<div id="wrapper">
			<!-- 네비게이션 -->
			<nav>
				<ul class="mainList">
					<li class="mainMenu">
						<a href="">관광지</a>
						<ul>
							<li><a>전체</a></li>
							<li><a>자연</a></li>
							<li><a>문화관광</a></li>
							<li><a>테마관광지</a></li>
							<li><a>도보</a></li>
							<li><a>레저/체험</a></li>
							<li><a>섬 속의 섬</a></li>
							<li><a>웰니스</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">음식점</a>
						<ul>
							<li><a>전체</a></li>
							<li><a>향토음식</a></li>
							<li><a>한식</a></li>
							<li><a>양식</a></li>
							<li><a>일식</a></li>
							<li><a>중식</a></li>
							<li><a>동남아식</a></li>
							<li><a>무슬림프렌들리</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">숙박</a>
						<ul>
							<li><a>전체</a></li>
							<li><a>안전인증민박</a></li>
							<li><a>관광호텔</a></li>
							<li><a>전통/가족호텔</a></li>
							<li><a>호스텔/소형호텔</a></li>
							<li><a>휴양펜션</a></li>
							<li><a>휴양콘도</a></li>
							<li><a>일반숙박</a></li>
							<li><a>생활숙박</a></li>
							<li><a>농어촌민박</a></li>
							<li><a>유스호스텔</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">쇼핑</a>
						<ul>
							<li><a>전체</a></li>
							<li><a>전통시장</a></li>
							<li><a>플리마켓</a></li>
							<li><a>면세점</a></li>
							<li><a>상점/상가</a></li>
							<li><a>특산품</a></li>
							<li><a>관광기념품</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">제주이야기</a>
						<ul>
							<li><a>전체</a></li>
							<li><a>문화와역사</a></li>
							<li><a>유네스코</a></li>
							<li><a>영상속제주</a></li>
							<li><a>제주명품42</a></li>
							<li><a>우수관광사업체</a></li>
							<li><a>지오브랜드</a></li>
							<li><a>착한가격업소</a></li>
							<li><a>템플스테이</a></li>
							<li><a>제주 4·3</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">여행필수정보</a>
						<ul>
							<li><a>안전·안심관광 가이드</a></li>
							<li><a>날씨</a></li>
							<li><a>교통</a></li>
							<li><a>의료기관</a></li>
							<li><a>가이드북</a></li>
							<li><a>관광문의</a></li>
							<li><a>무장애 관광</a></li>
							<li><a>제주의료관광</a></li>
							<li><a>공지</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">제주여행추천</a>
						<ul>
							<li><a>일정 추천</a></li>
							<li><a>여행 큐레이션</a></li>
							<li><a>테마여행</a></li>
							<li><a>축제와 행사</a></li>
							<li><a>제주문화공연</a></li>
							<li><a>레저/체험</a></li>
							<li><a>알쓸신제 원정대</a></li>
						</ul>
					</li>
					<li class="mainMenu">
						<a href="">나의 여행</a>
						<ul>
							<li><a>나의 여행일정</a></li>
							<li><a>찜한 여행</a></li>
							<li><a>나의 리뷰</a></li>
							<li><a>방문 여행지</a></li>
							<li><a>관광문의</a></li>
							<li><a>틀린정보신고</a></li>
							<li><a>정보수정</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		<!-- 콘텐츠부분 -->
		<section>
			<div id="container">
				<div class="inr">
					<div id="contents" class="contents">
						<div class="signupWrap">
							<div class="textWrap top">
								<strong class="tit">회원가입</strong>
								<p class="txt">
								맨도롱 또똣에 오신 것을 환영합니다.<br>
								맨도롱 또똣 회원이 되시면 더욱 다양한 혜택을 누리실 수 있습니다.
								</p>
							</div>
							<div class="signupBox">
								<div class="innerWrap">
									<div class="inr">
										<div class="textWrap">
											<strong class="tit">맨도롱 또똣 회원</strong>
										</div>
										<a href="index.jsp?main=member/memberlogin.jsp" class="btnbigpink">회원가입</a>
										<a href="index.jsp?main=member/reallogin.jsp" class="btnbigpink">로그인</a>
									</div>
									<div class="inr right">
										<!-- 다른 회원가입 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 사이드바 -->
		<aside>
			<p>aside</p>
		</aside>
		<!-- 풋터 -->
		<footer>
			(풋터)멘도롱 또똣(풋터)
		</footer>
</body>
</html>