<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
	<style>
		.menu-item {
			margin-bottom: 60px;
		}
	</style>
	<script>
		function addMenu() {
			var container = document.getElementById("menuContainer");

			var menuDiv = document.createElement("div");
			menuDiv.style.marginBottom = "10px";

			var menuNameInput = document.createElement("input");
			menuNameInput.type = "text";
			menuNameInput.name = "menuName";

			var menuPriceInput = document.createElement("input");
			menuPriceInput.type = "text";
			menuPriceInput.name = "menuPrice";

			var removeButton = document.createElement("input");
			removeButton.type = "button";
			removeButton.value = "삭제";

			removeButton.onclick = function () {
				container.removeChild(menuDiv);
			};

			menuDiv.appendChild(document.createTextNode("메뉴명"));
			menuDiv.appendChild(menuNameInput);
			menuDiv.appendChild(document.createTextNode("메뉴가격"));
			menuDiv.appendChild(menuPriceInput);
			menuDiv.appendChild(removeButton);

			container.appendChild(menuDiv);
		}
	</script>
</head>
<body>
	<header id="header">
		<h1>
			<a href="index.jsp" style="text-decoration-line: none;">랜덤밥스</a>
		</h1>
		<%
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

			String uId = (String) session.getAttribute("userIdSession");
			String uNum = (String) session.getAttribute("userNumSession");

			if(uId == null) {
		%>
			<nav id="nav">
				<ul>
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
	<body>
		<form action="insertRestAction.jsp" name="insertRestForm" method="post">
			<section id="main" class="wrapper">
				<div class="container">
					<header class="major">
						<h2>가게 등록하기</h2>
					</header>
				</div>
			<section>
			<div class="table_center">
				<p>가게명 <input type="text" id="restName" name="restName"></p>
				<p>
					가게타입
					<select id="restType" name="restType" onchange="generateRestCode()">
						<option value="kr">한식</option>
						<option value="cn">중식</option>
						<option value="jp">일식</option>
						<option value="we">양식</option>
						<option value="ff">패스트푸드</option>
						<option value="as">아시안</option>
					</select>
				</p>
				<p>가게코드<input type="text" id="restCode" name="restCode" value=""></p>
				<p>메뉴명 <input type="text" id="menuName" name="menuName"></p>
				<p>메뉴가격 <input type="text" id="menuPrice" name="menuPrice">
					<input type="button" value="메뉴추가" class="button special" onclick="addMenu()">
				</p>
				<div id="menuContainer">
				</div>
				<br>
				<p>가게위치 <input type="text" id="restLoca" name="restLoca"></p>
				<p>거리 <input type="text" id="restDis" name="restDis"></p>
				<p>
					<input type="submit" value="등록하기" class="button special">
					&nbsp; &nbsp;
					<input type="button" value="뒤로가기" onclick="window.history.back()">
				</p>
			</div>
			</section>
		</form>

		<script>
			// 가게 코드 자동 생성 함수
			function generateRestCode() {
			  var restType = document.getElementById("restType").value;
			  var restCodeInput = document.getElementById("restCode");
			
			  // AJAX를 사용하여 서버에서 마지막 가게 코드 가져오기
			  var xhr = new XMLHttpRequest();
			  xhr.open("GET", "getLastRestCode.jsp?restType=" + restType, true);
			  xhr.onreadystatechange = function() {
			    if (xhr.readyState === XMLHttpRequest.DONE) {
			      if (xhr.status === 200) {
			        // 서버에서 마지막 가게 코드를 응답받으면 새로운 가게 코드 생성
			        var lastRestCode = xhr.responseText;
			        var newRestCode = generateNewRestCode(lastRestCode);
			        // 새로운 가게 코드를 입력 필드에 설정
			        restCodeInput.value = newRestCode;
			      } else {
			        // 오류 처리
			       	alert("가게 코드를 가져오는데 문제가 생겼습니다" + xhr.status);
			      }
			    }
			  };
			  xhr.send();
			}
			// 새로운 가게 코드 생성 함수
			function generateNewRestCode(lastRestCode) {
			  // 마지막 가게 코드에서 숫자 부분 추출
			  var lastCodeNumber = parseInt(lastRestCode.split('R')[1]);
			  // 숫자 부분 증가시키기
			  lastCodeNumber++;
			  // 새로운 가게 코드 생성
			  var restType = document.getElementById("restType").value;
			  switch (restType) {
			    case "kr": restType = "KR_"; break;
			    case "cn": restType = "CN_"; break;
			    case "jp": restType = "JP_"; break;
			    case "we": restType = "WE_"; break;
			    case "ff": restType = "FF_"; break;
			    case "as": restType = "AS_"; break;
			    default: restType = "";
			  }
			  var newRestCode = restType + "R" + lastCodeNumber.toString().padStart(3, "0");
			  return newRestCode;
			}
		</script>
	</body>
</html>