<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>RANBAB</title>
	<link rel="icon" type="image/x-icon" href="/assets/fav.ico" />
	<!-- Core theme JS (메인 JS)-->
	<script src="/js/scripts.js"></script>
	<!-- Core theme CSS (부트스트랩 CSS 추가) -->
	<link href="/css/styles.css" rel="stylesheet" />
	<!-- Font Awesome icons (폰트, 아이콘 무료로 배포해주는 사이트) -->
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts (랜덤밥스 기본 폰트, 구글폰트 라이브러리 제공) -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!-- Bootstrap core JS (부트스트랩 JS 추가)-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body id="page-top">
       <!-- Navigation -->
       <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
           <%@ include file="/layout/nav.jsp" %>
       </nav>
       <!-- Header -->
       <header class="masthead text-center text-white">
           <div class="masthead-content">
               <div class="container px-5">
                   <h1 class="masthead-heading mb-0">랜덤밥스</h1>
                   </br>
                   <h4>매일 매일 새로운 식사를 경험해보세요!</h4>
                   <a class="btn btn-primary btn-xl rounded-pill mt-5" href="/views/start.jsp">음식 고르러 가기</a>
               </div>
           </div>
           <div class="bg-circle-1 bg-circle"></div>
           <div class="bg-circle-2 bg-circle"></div>
           <div class="bg-circle-3 bg-circle"></div>
           <div class="bg-circle-4 bg-circle"></div>
       </header>
       <!-- Content section 1-->
       <section id="scroll">
           <div class="container px-5">
               <div class="row gx-5 align-items-center">
                   <div class="col-lg-6 order-lg-2">
                       <div class="p-5"><img class="img-fluid rounded-circle" src="/assets/img/01.jpg" alt="..." /></div>
                   </div>
                   <div class="col-lg-6 order-lg-1">
                       <div class="p-5">
                           <h2 class="display-4">For those about to rock...</h2>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                       </div>
                   </div>
               </div>
           </div>
       </section>
       <!-- Content section 2-->
       <section>
           <div class="container px-5">
               <div class="row gx-5 align-items-center">
                   <div class="col-lg-6">
                       <div class="p-5"><img class="img-fluid rounded-circle" src="/assets/img/02.jpg" alt="..." /></div>
                   </div>
                   <div class="col-lg-6">
                       <div class="p-5">
                           <h2 class="display-4">We salute you!</h2>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                       </div>
                   </div>
               </div>
           </div>
       </section>
       <!-- Content section 3-->
       <section>
           <div class="container px-5">
               <div class="row gx-5 align-items-center">
                   <div class="col-lg-6 order-lg-2">
                       <div class="p-5"><img class="img-fluid rounded-circle" src="/assets/img/03.jpg" alt="..." /></div>
                   </div>
                   <div class="col-lg-6 order-lg-1">
                       <div class="p-5">
                           <h2 class="display-4">Let there be rock!</h2>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                       </div>
                   </div>
               </div>
           </div>
       </section>
       <!-- Footer-->
       <footer class="py-5 bg-black">
       	<%@ include file="/layout/footer.jsp" %>
       </footer>
</body>
</html>
