<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<body>
	<header id="header">
		<h1>
			<a href="index.jsp" style="text-decoration-line: none;">랜덤밥스</a>
		</h1>
		<%
			request.setCharacterEncoding("UTF8");
			response.setCharacterEncoding("UTF-8");

			String uId = (String) session.getAttribute("userIdSession");
			String uNum = (String) session.getAttribute("userNumSession");
			
			if(uId == null) {
		%>
			<nav id="nav">
				<ul>
					<li><a href="start.jsp">점심 뭐 먹지?</a></li>
					<li><a href="login.jsp" class="button special">로그인</a></li>
				</ul>
			</nav>
		<%
			}
			
			if(uId != null) {
		%>
			<nav id="nav">
			<ul>
				<a href="myPage.jsp"><li><strong><%=uId%></strong></a>님 환영합니다!</li>
			<%
				if (uId.equals("admin")) {
			%>
					<jsp:include page="/layout/adminNav.jsp"></jsp:include>
			<%
				}
				else {
			%>
					<jsp:include page="/layout/userLoginNav.jsp"></jsp:include>
			<%
				}
			}
			%>
			</ul>
		</nav>
		
	</header>
	<section id="banner">
		<div class="w3-content w3-section">
			<h2 class="mySlides"><strong>점심에 떡볶이가 그리울 때</strong></h2>
			<h2 class="mySlides"><strong>든든한 집밥 한상이 간절할 때</strong></h2>
			<h2 class="mySlides"><strong>가볍고 맛있게 먹고싶을 때</strong></h2>
			<h2 class="mySlides"><strong>따뜻한 국밥 한 그릇이 생각날 때</strong></h2>
			<h2 class="mySlides"><strong>겉바속촉 돈까스가 먹고싶을 때</strong></h2>
			<h2 class="mySlides"><strong>머리가 띵~할 정도로 시원한 냉면이 땡길 때</strong></h2>
		</div>
		<script>
			var myIndex = 0;
			carousel();
		
			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
		
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 3500);
			}
		</script>
	</section>
	<section id="one" class="wrapper style1 special">
		<div class="container">
			<header class="major">
				<h2>점심 뭐 먹지? 랜덤밥스!</h2>
				<p>그것이 무엇이든 랜밥에 다~ 있다</p>
			</header>
			<div class="row 150%">
				<div class="4u 12u$(medium)">
					<section class="box"> 
					<i class="icon big rounded color1 fa-thin fa-hand-point-up fa-xl" style="color: #ffffff;"></i>
						<h3>이건 어떠니? 저건 어떠니?</h3>
						<p>고민고민하지마~</p>
					</section>
				</div>
				<div class="4u 12u$(medium)">
					<section class="box"> 
						<i class="icon big rounded color1 fa-regular fa-clock fa-xl" style="color: #ffffff;"></i>
						<h3>시간은 금</h3>
						<p>짬뽕 짜장 고를 시간에 탕수육 하나 더 먹어라</p>
					</section>
				</div>
				<div class="4u$ 12u$(medium)">
					<section class="box"> 
						<i class="icon big rounded color1 fa-solid fa-map-location-dot fa-lg" style="color: #ffffff;"></i>
						<h3>좋은 음식을 먹고싶은 곳에서</h3>
						<p>떡볶이, 돈까스, 짜장면, 쌀국수, 햄버거 <br/> </p>
					</section>
				</div>
			</div>
		</div>
	</section>
	<section id="two" class="wrapper style2 special">
		<div class="container">
			<header class="major">
				<h2>랜덤밥스 개발팀</h2>
			</header>
			<section class="profiles">
				<div class="row">
					<section class="3u 6u(medium) 12u$(xsmall) profile"> 
						<img src="/images/profile_placeholder.gif" alt="" />
						<h4>김준석</h4>
						<h5>조장(JSP 개발, DB설계, UI구현)</h5>
					</section>
					<section class="3u 6u$(medium) 12u$(xsmall) profile"> 
						<img src="/images/profile_placeholder.gif" alt="" />
						<h4>이태석</h4>
						<h5>조원(JSP 개발, DB설계, 형상관리)</h5>
					</section>
					<section class="3u 6u$(medium) 12u$(xsmall) profile"> 
						<img src="/images/profile_placeholder.gif" alt="" />
						<h4>문채현</h4>
						<h5>     조원(JSP 개발, DB설계, UI구현)</h5>
					</section>
					<section class="3u 6u$(medium) 12u$(xsmall) profile"> 
						<img src="/images/profile_placeholder.gif" alt="" />
						<h4>천선우</h4>
						<h5>조원(백엔드 개발, DB설계)</h5>
					</section>
					<section class="3u 6u$(medium) 12u$(xsmall) profile"> 
						<img src="/images/profile_placeholder.gif" alt="" />
						<h4>백서영</h4>
						<h5>조원(백엔드 개발, DB설계)</h5>
					</section>
				</div>
			</section>
		</div>
		<footer>
			<%@ include file="layout/footer.jsp" %>
		</footer>
	</section>
</body>
</html>