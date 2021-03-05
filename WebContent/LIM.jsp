<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LIM DESIGN</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="./css/lim_style.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
<script>
function logout(){
	let coment = confirm("로그아웃 하시겠습니까?");
	if(coment == true){
		location.href="logoutAction.jsp";
	}
	else if(coment == false){
		
	}
	
}

function delContent(ID){
	let coment = confirm("삭제 하시겠습니까?");
	if(coment == true){
		location.href="deleteAction.jsp?contentID="+ID;
	}
	else if(coment == false){
		
	}
}
</script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			pause : 4000
		});
	});

	$(document).ready(function() {
		$('.best_slide').slick({
			slidesToShow : 5,
			slidesToScroll : 1,
			prevArrow : $('.prev'),
			nextArrow : $('.next'),
			infiniteLoop : true,
			autoplay : true,
			autoplaySpeed : 2000,
		});
	});

	$(function() {
		$('.moblie_list > li > a').each(function() {
			var submenu = $(this).siblings('.moblie_sub');
			$(this).click(function() {
				$(submenu).stop().slideToggle();
			})
		});
	});
</script>

</head>

<body>

	<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	pageContext.setAttribute("u", userID);

	%>

	<div class="moblie_side_bar">
		<input type="checkbox" id="icon"> <label for="icon"> <span></span>
			<span></span> <span></span>
		</label>

		<div class="side_bar">
			<div class="moblie_login">
				<ul>
					<li><a href="http://donghyeok.dothome.co.kr/LIM_login"><img
							src="image/moblie_login.png" alt="moblie_login"></a></li>
					<li>|</li>
					<li><a href="#"><img src="image/mobile_inq.png"
							alt="moblie_inq"></a></li>
					<li>|</li>
					<li><a href="#"><img src="image/moblie_deliver.png"
							alt="moblie_deliver"></a></li>
				</ul>
			</div>
			<hr>
			<div class="side_title">
				<h3>category</h3>
			</div>

			<div class="moblie_menu">
				<ul class="moblie_list">
					<li><a href="#"> 홈데코 <span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>침실</li>
							<li>거실</li>
							<li>부엌</li>
							<li>개인공간</li>
							<li>드레스룸</li>
							<li>화장실</li>
							<li>욕실</li>
						</ul></li>
					<li><a href="#"> 가구<span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>침대</li>
							<li>책상/의자</li>
							<li>진열장</li>
							<li>소파</li>
							<li>화장대</li>
							<li>옷장/행거/서랍장</li>
						</ul></li>
					<li><a href="#"> 야외<span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>테이블</li>
							<li>의자</li>
							<li>벤치/선배드</li>
							<li>데코</li>
						</ul></li>
					<li><a href="#"> 인테리어<span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>조명</li>
							<li>매트/카페트/러그</li>
							<li>키친웨어</li>
							<li>침구류</li>
							<li>기타</li>
						</ul></li>
					<li><a href="#"> 빌트인 수납<span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>붙박이장</li>
							<li>드레스룸</li>
							<li>현관장</li>
						</ul></li>
					<li><a href="#"> 리모델링<span class="moblie_menu_plus">ˇ</span>
					</a>
						<ul class="moblie_sub">
							<li>전체공사</li>
							<li>부분공사</li>
							<li>상품안내</li>
						</ul></li>
			</div>
		</div>
	</div>

	<!-- -----------------------moblie_page----------------------------- -->
	<div id="wrap">
		<header>
			<nav>
				<h1 class="logo">
					<a href="#"><img src="image/LIM_LOGO.png" alt="로고"></a>
				</h1>
				<ul class="main_nav">
					<li class="main_menu"><a href="#"> 홈데코 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>침실</li>
										<li>거실</li>
										<li>부엌</li>
										<li>개인공간</li>
										<li>드레스룸</li>
										<li>화장실/욕실</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<li class="main_menu"><a href="#"> 가구 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>침대</li>
										<li>책상/의자</li>
										<li>진열장</li>
										<li>쇼파</li>
										<li>화장대</li>
										<li>옷장/행거/서랍장</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<li class="main_menu"><a href="#"> 야외 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>테이블</li>
										<li>의자</li>
										<li>세트상품</li>
										<li>벤치/선배드</li>
										<li>데코</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<li class="main_menu"><a href="#"> 인테리어 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>조명</li>
										<li>매트/카페트/러그</li>
										<li>키친웨어</li>
										<li>침구류</li>
										<li>기타</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<li class="main_menu"><a href="#"> 빌트인 수납 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>붙박이장</li>
										<li>드레스룸</li>
										<li>현관장</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<li class="main_menu"><a href="#"> 리모델링 </a>
						<div>
							<ul>
								<li class="nav_menu">
									<ul>
										<li>전체공사</li>
										<li>부분공사</li>
										<li>상품안내</li>
									</ul>
								</li>
							</ul>
						</div></li>
					<c:if test="${u==null }"></c:if>
					<c:if test="${u!=null }">
					<li class="main_menu"><a href="board.jsp"> 게시판 </a></li>
					</c:if>
				</ul>

	<c:if test="${u!=null }"><div class="login_bar">${u }님 반갑습니다! <input type="button" value="logout" onClick="logout()"></div></c:if>
	<c:if test="${u==null }">
				<div class="login_menu">
					<ul>
						<li><a href="login.jsp"><img src="image/login.png"
								alt="login"></a></li>
						<li>|</li>
						<li><a href="#"><img src="image/inq.png" alt="문의"></a>
						<li>|</li>
						<li><a href="#"><img src="image/deliver.png" alt="배달조회"></a></li>
						<li>|</li>
						<li class="login_menu1"><a href="#"><img
								src="image/search.png" alt="검색"></a></li>
					</ul>
				</div>
				</c:if>
			</nav>
		</header>
		<div class="slider">
			<div class="main_silde">
				<div class="silde_txt">
					<ul>
						<li>
							<h3>당신이 생활하는 공간</h3> <br>
							<h1>자연과 함께하는 LIM DESIGN</h1>
						</li>
					</ul>
					<div class="silde_btn">
						<button>MORE</button>
					</div>
				</div>
			</div>
			<div class="main_silde1">
				<div class="silde_txt1">
					<ul>
						<li>
							<h3>오래 머무르고 싶은 장소</h3> <br>
							<h1>LIM DESIGN</h1>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<section id="section_1">
			<div class="inner">
				<div>
					<h2>건강한 인테리어.LIMDESIGN</h2>
				</div>
				<div class="under_bar"></div>
				<div class="menu1">
					<div class="ani">
						<p>eco-friendly</p>
					</div>
					<img src="image/menu1.png" alt="소개1">
				</div>
				<div class="menu_txt">
					<h3>자연친화</h3>
					<br>넓게 펼쳐진 숲속에서 생활하는 듯 한 <br>느낌을 주는 LIM DESIGN는 자연이 주는
					편안함과 <br>피톤치드의 효과를 이용하여 스트레스 <br>해소, 심폐기능강화, 살균작용의 효과를 볼
					수 있습니다.
				</div>
				<hr>
				<div class="menu2">
					<div class="ani1">
						<p>concept</p>
					</div>
					<img src="image/menu2.png" alt="소개2">
				</div>
				<div class="menu_txt">
					<h3>CONCEPT</h3>
					<br>"자연","건강"그리고 편안함을 컨셉으로 하여 <br>인테리어하는 LIM DESIGN는
					자연친화적인 소재로 <br>만든 가구와 아늑한 느낌을 주는 조명과 컬러를 <br>사용하여서 일상에서
					생긴 피로와 스트레스 <br>완화시키고 편한 휴식공간으로 설계되어 있습니다.
				</div>
			</div>
			<hr>
		</section>

		<section id="section_2">
			<div class="banner">
				<div class="banner_txt">
					<h3>LIM DESIGN'S STYLE</h3>
					<br>LIM DESIGN 스타일은 원목가구를 주로 사용하여 자연과 함께 생활하고있는 느낌을 받을 수 있습니다.
					<br>오랜 기간동안 생활 할 수록 원목가구의 빈티지함이 더해져 가면서 쉽게 실증이 나지않는 디자인입니다.
				</div>
			</div>
		</section>
		<section id="motto">
			<div>
				<div>
					<h2>MOTTO</h2>
				</div>
				<div class="under_bar"></div>
				<div>
					<img src="image/motto.png" alt="모토">
				</div>
			</div>
		</section>
		<section id="bestseller">

			<%
			productDAO pd = new productDAO();
			ArrayList<productDTO> list = pd.getproductlist();
			pageContext.setAttribute("list", list);//contentDTO 가 들어가있는 배열 list
			%>
			<div class="title_center">
				<div>
					<h2>BEST SELLER</h2>
				</div>
				<div class="under_bar"></div>
				<div class="bg">
					<div class="best_slide">
						<c:forEach var="l" begin="0" end="5" items="${list}"
							varStatus="st">
							<div class="best">
								<a href="detail.jsp?proID=${l.proID }"><img src="${l.path }"
									alt="best1"></a>
								<ul>
									<li>${l.proName }</li>
									<li>♥${l.hit }</li>
								</ul>
								<h4 class="won">
								<fmt:formatNumber value="${l.price }" type="number"/><br>	
									<p>원</p>
								</h4>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div class="moblie_bg">
				<div class="best">
					<a href="#"><img src="image/funiture/best1png.png" alt="best1"></a>
					<ul>
						<li>원목 나무모양 책꽂이 선반</li>
						<li>♥165</li>
					</ul>
					<h4 class="won">
						1,141,000
						<p>원</p>
					</h4>
				</div>
				<div class="best">
					<a href="#"><img src="image/funiture/best2.png" alt="best2"></a>
					<ul>
						<li>네츄럴 3단 원목 선반</li>
						<li>♥150</li>
					</ul>
					<h4 class="won">
						53,900
						<p>원</p>
					</h4>
				</div>
				<div class="best">
					<a href="#"><img src="image/funiture/best3.png" alt="best3"></a>
					<ul>
						<li>로하임 1600 고무나무 원목 수납장</li>
						<li>♥112</li>
					</ul>
					<h4 class="won">
						248,160
						<p>원</p>
					</h4>
				</div>
				<div class="best">
					<a href="#"><img src="image/funiture/best4.png" alt="best4"></a>
					<ul>
						<li>원목 낮은 책장</li>
						<li>♥138</li>
					</ul>
					<h4 class="won">
						249,000
						<p>원</p>
					</h4>
				</div>
				<div class="best">
					<a href="#"><img src="image/funiture/best5.png" alt="best5"></a>
					<ul>
						<li>지앤퍼니 아크라 1800 5단 원목책장</li>
						<li>♥191</li>
					</ul>
					<h4 class="won">
						399,000
						<p>원</p>
					</h4>
				</div>
				<div class="best">
					<a href="#"><img src="image/funiture/best6-1.png" alt="best6"></a>
					<ul>
						<li>편백나무 장롱</li>
						<li>♥173</li>
					</ul>
					<h4 class="won">
						98,000
						<p>원</p>
					</h4>
				</div>
			</div>
		</section>
		<section id="new_items">
			<div class="title_center">
				<h2>NEW ITEMS</h2>
				<div class="under_bar"></div>
			</div>
			<div class="inner">
				<div class="new">
					<div>
						<a href="#"><img src="image/funiture/new_items1.png"
							alt="new1"></a>
					</div>
					<ul>
						<li>필러체어 원목의자</li>
						<li>★3.9</li>
					</ul>
					<h4 class="won1">
						91,000
						<p>원</p>
					</h4>
				</div>
				<div class="new">
					<div>
						<a href="#"><img src="image/funiture/new_items2.png"
							alt="new2"></a>
					</div>
					<ul>
						<li>멀바우 디스플레이 원목선반</li>
						<li>★4.1</li>
					</ul>
					<h4 class="won1">
						1,598,000
						<p>원</p>
					</h4>
				</div>
				<div class="new">
					<div>
						<a href="#"><img src="image/funiture/new_items3.png"
							alt="new3"></a>
					</div>
					<ul>
						<li>화이트 빈티지 원목 트롤리</li>
						<li>★3.6</li>
					</ul>
					<h4 class="won1">
						794,500
						<p>원</p>
					</h4>
				</div>
				<div class="new">
					<div>
						<a href="#"><img src="image/funiture/new_items4.png"
							alt="new4"></a>
					</div>
					<ul>
						<li>지벤 블랑루즈 1000원목</li>
						<li>★4.8</li>
					</ul>
					<h4 class="won1">
						284,000
						<p>원</p>
					</h4>
				</div>
				<hr>
			</div>
		</section>
		<footer>
			<div class="foot_bg">
				<div class="inner">
					<a class="footer_logo" href="#"><img src="image/white_logo.png"
						alt="footer_logo"></a>
				</div>
				<div class="footer_txt1">
					<p>
						사업자등록번호 : 215-86-93600 대표이사 : 홍길동 <br>주소 : 부산광역시 사상구 운산로 56
						5층 LIM DESIGN <br>대표번호 : 051-333-3333 FAX : 051-333-3333 <br>이용약관
						| 개인정보 처리방침
					</p>
				</div>
				<p class="email">E-mail : LIMDESIGN@naver.com</p>
				<div class="footer_sns">
					<a href="#"><img src="image/facebook.png" alt="facebook"></a>
					<a href="#"><img src="image/instar.png" alt="instar"></a> <a
						href="#"><img src="image/twitter.png" alt="twitter"></a> <a
						href="#"><img src="image/talk.png" alt="talk"></a> <a
						href="#"><img src="image/band.png" alt="band"></a>
					<div class="footer_num">
						<div>고객센터</div>
						<div>1577-5888</div>
					</div>
				</div>
				<hr>
				<div class="footer_copy">
					<p>copy right (c) 2020 LIM INC. All rights reserved</p>
				</div>
			</div>
		</footer>
	</div>
</body>

</html>