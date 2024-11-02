<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/Main.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>로그인</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/templet/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/templet/css/styles.css" rel="stylesheet" />
<style>
@font-face {
	font-family: 'MangoByeolbyeol';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/MangoByeolbyeol.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#logo-text {
	margin-top: 20px;
	font-size: 30px;
	font-family: 'MangoByeolbyeol', sans-serif; /* MangoByeolbyeol 폰트 사용 */
	font-weight: bold; /* 텍스트를 굵게 설정 */
}

body {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	font-family: 'MangoByeolbyeol', sans-serif;
}


div.formRow {
	display: flex;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 7px;
	border: 1px solid cornflowerblue;
	border-radius: 7px;
	background-color: white;
}

div.formRow>input[type="text"] {
	flex-grow: 1;
	outline: none;
	border: 0px;
	font-size: 15px;
}

div.formRow label {
	width: 100px;
}

.focusRow {
	border-color: green !important;
}

.submitBtn {
	width: 100%;
	padding: 15px;
	font-size: 17px;
	border-radius: 8px;
	cursor: pointer;
	background-color: blue;
}

.submitBtn:hover {
	background-color: rgb(11, 11, 43);
	color: white;
}

.gradient-btn {
	display: inline-block;
	padding: 1em 2em;
	border-radius: 0;
	color: black;
	margin-top: 25px;
	font-weight: bold;
	font-size: 0.678rem;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-decoration: none;
	background: inherit;
	background-position: 1% 50%;
	background-size: 400% 300%;
	border: 1px solid black;
	border-radius: 5px;
	width: 45%; @ include transition; &: hover { color : red;
	background-position: 99% 50%;
}
}
</style>

<c:if test="${not empty msg}">

	<script type="text/javascript">
		alert('${msg}');
	</script>


</c:if>

</head>
<body>
	<%-- TopLogo.jsp --%>
	<%@ include file="/WEB-INF/views/includes/TopLogo.jsp"%>


	<%-- TopLogo.jsp --%>
	<hr>
	<h2 style="text-align: center;">회원 로그인</h2>
	<!-- Page Content-->
	<section class="pt-4" style="min-height: 70vh;">
		<div class="container px-lg-2">
			<!-- 로그인양식 -->
			<form class="d-block mx-auto mt-3 p-3 border rounded"
				style="width: 500px;" method="post" action="/loginForm"
				onsubmit="return loginFormCheck(this)">
				<div class="mb-3">
					<label for="inputId" class="form-label">아이디</label> <input
						type="text" class="form-control" id="inputId" name="memberid">
				</div>
				<div class="mb-3">
					<label for="inputPw" class="form-label">비밀번호</label> <input
						type="password" class="form-control" id="inputPw" name="memberpw">
				</div>

				<button type="submit" class="btn btn-primary w-100">로그인</button>

			</form>
			<div style="text-align: center;">
				아이디가 없으신가요?? <br> <a href="/joinForm">회원가입</a>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<!-- Footer-->
	<!-- Footer-->
	<%-- Footer.jsp --%>
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>

	<%-- Footer.jsp --%>
	<script>
		function focusInput(obj) {
			console.log(obj);
			obj.parentElement.classList.add("focusRow");
		}
		function blurInput(obj) {
			obj.parentElement.classList.remove("focusRow");
		}

		function loginFormCheck(formObj) {
			let inputMemberId = document.querySelector("#inputId");
			let inputMemberPw = document.querySelector("#inputPw");
			if (inputMemberId.value.length == 0) {
				alert("아이디를 입력 해주세요!!");
				inputMemberId.focus();
				return false;
			}
			if (inputMemberPw.value.length == 0) {
				alert("비밀번호를 입력 해주세요!!");
				inputMemberPw.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>