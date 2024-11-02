<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>바다보다</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/templet/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/templet/css/styles.css" rel="stylesheet" />

<style type="text/css">
img.beachImg {
	height: 200px;
	object-fit: cover;
}

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

.gradient-btn {
	display: inline-block;
	padding: 1em 2em;
	border-radius: 0;
	color: black;
	margin-top: -40px;
	font-weight: bold;
	font-size: 0.678rem;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-decoration: none;
	background: inherit;
	background-position: 1% 50%;
	background-size: 400% 300%;
	border: 1px solid black;
	border-radius: 5px; @ include transition; &: hover { color : red;
	background-position: 99% 50%;
}
}
.
</style>
</head>
<body>

	<%-- TopLogo.jsp --%>
	<%@ include file="/WEB-INF/views/includes/TopLogo.jsp"%>
	<hr>

	<%-- TopLogo.jsp --%>

	<!-- Header-->
	<header class="py-5">
		<!-- <div class="container px-lg-1" style="background-image: url('resources/img/sea4.jpg');background-size: cover; background-position-y: -300px">
                <div class="p-4 p-lg-5  rounded-3 text-center">
                    <div class="m-4 m-lg-5" >
                        <h1 class="display-5 fw-bold">"글자"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 글자</h1>
                        <p class="fs-4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
                    </div>
                </div>
            </div> -->
	</header>
	<!-- Page Content-->
	<section class="pt-4">
		<div class="container px-lg-2">
			<!-- Page Features-->


			<div class="row gx-lg-2" style="font-size: 20px">

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/부산.png"
								onclick="location.href='/beachlist?sido=부산'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=부산'">부산</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/울산.jpg"
								onclick="location.href='/beachlist?sido=울산'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=울산'">울산</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/제주도.jfif"
								onclick="location.href='/beachlist?sido=제주'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=제주'">제주</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/경남.jpg"
								onclick="location.href='/beachlist?sido=경남'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=경남'">경남</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/경북.jpg"
								onclick="location.href='/beachlist?sido=경북'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=경북'">경북</div>
					</div>
				</div>



			</div>

			<div class="row gx-lg-2" style="font-size: 20px">

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/전북.jpg"
								onclick="location.href='/beachlist?sido=전북'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=전북'">전북</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/전남.jfif"
								onclick="location.href='/beachlist?sido=전남'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=전남'">전남</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/충청도.jfif"
								onclick="location.href='/beachlist?sido=충남'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=충남'">충청</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/강원.png"
								onclick="location.href='/beachlist?sido=강원'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=강원'">강원</div>
					</div>
				</div>

				<div class="col mb-3 p-1 ">
					<div class="card  text-center">
						<div class="card-body ">
							<img class="beachImg img-fluid" src="resources/img/인천.jfif"
								onclick="location.href='/beachlist?sido=인천'">
						</div>
						<div class="card-title"
							onclick="location.href='/beachlist?sido=인천'">인천</div>
					</div>
				</div>



			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

		</div>
	</section>
	<!-- Footer-->
	<%-- Footer.jsp --%>
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>

	<%-- Footer.jsp --%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/templet/js/scripts.js"></script>
</body>
</html>