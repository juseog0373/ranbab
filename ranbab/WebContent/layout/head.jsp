<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>랜덤밥스</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/skel.min.js"></script>
<script src="/resources/js/skel-layers.min.js"></script>
<script src="/resources/js/init.js"></script>
<script src="/resources/js/validation.js"></script>
<script src="https://kit.fontawesome.com/41df15ec15.js" crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="/resources/assets/fav.ico" />
<link rel="stylesheet" href="/resources/css/skel.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/style-xlarge.css" />
<!-- Google fonts (랜덤밥스 기본 폰트, 구글폰트 라이브러리 제공)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<script>
const autoHyphen = (target) => { 
		target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""); 
}
</script>