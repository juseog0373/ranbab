/**
 * 
 */
var idck = 0;

// =====================정규식 선언===================== //
var idReg = /^[A-Za-z0-9]{4,12}$/; //아이디 영문+숫자 조합(4~12자리)
var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; //비밀번호 영문자+숫자+특수문자 조합(8~25자리) 정규식
var nameReg = /^[가-힣]{2,15}$/; //이름 정규식
var mobileReg = /^\d{2,3}-?\d{3,4}-?\d{4}$/; //전화번호
	
function joinformCheck() {
	
	var id = document.getElementById("uid");
	var pwd = document.getElementById("pwd");
	var repwd = document.getElementById("repwd");
	var name = document.getElementById("uname");
	var mobile = document.getElementById("mobile");
	var idCkVal = document.getElementById("uid").value;

	// =====================아이디 유효성 검사===================== //
	if (id.value == "") {
		alert("아이디를 입력하세요!");
		id.focus();
		return false;
	}
	if (!idReg.test(id.value)) {
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		id.focus();
		return false;
	}
	if (idck == 0) {
		alert('아이디 중복체크를 해주세요');
		return false;
	}
	// =====================비밀번호 유효성 검사===================== //
	if (pwd.value == "") {
		alert("비밀번호를 입력하세요!");
		pwd.focus();
		return false;
	}
	if (repwd.value == "") {
		alert("비밀번호 확인을 입력하세요!");
		repwd.focus();
		return false;
	}
	if (!pwdReg.test(pwd.value)) {
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리를 사용해야합니다!");
		pwd.focus();
		return false;
	}
	if (pwd.value != repwd.value) {
		alert("비밀번호가 일치하지 않습니다!");
		repwd.focus();
		return false;
	}
	// =====================이름 유효성 검사===================== //
	if (name.value == "") {
		alert("이름을 입력하세요!");
		name.focus();
		return false;
	}
	if (!nameReg.test(name.value)) {
		alert("이름은 한글만 입력해야합니다!");
		name.focus();
		return false;
	}
	// =====================전화번호 검사===================== //
	if (mobile.value == "") {
		alert("전화번호를 입력하세요!");
		mobile.focus();
		return false;
	}
	if (!mobileReg.test(mobile.value)) {
		alert("전화번호는 숫자만 입력할 수 있습니다!");
		mobile.focus();
		return false;
	}

	document.joinForm.submit();
}
const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

function openIdCheckPopup() {
	var uid = document.getElementById('uid');
	
	if (!idReg.test(uid.value)) {
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		uid.focus();
		return false;
	}
	if (uid.value == "" || uid.value == "null" || uid.value == null) {
		uid.focus();
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	else {
		idck = 1;
		window.open('idValCheck.jsp?userId=' + uid.value, '중복 체크', 'width=500,height=400');
	}
}