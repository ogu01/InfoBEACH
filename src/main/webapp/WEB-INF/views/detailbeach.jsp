<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>바다정보</title>
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


img {
	width: 500px; /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
	height: 300px; /* 비율을 유지하면서 높이를 자동으로 조정 */
	border-radius: 15px;
	margin-bottom: 5px;
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
</style>

</head>
<body>

	<%-- TopLogo.jsp --%>
	<%@ include file="/WEB-INF/views/includes/TopLogo2.jsp"%>


	<%-- TopLogo.jsp --%>


	<hr>
	<!--  모달  -->

	<!-- Header-->

	<!-- Page Content-->
	<section class="pt-4" style="background-color: rgb(248, 249, 250);">
		<div class="container px-lg-2">

			<div style="font-family: 'MangoByeolbyeol', sans-serif; font-weight: bold; font-size:20px; margin-bottom: 10px;">'${searchText}해수욕장' 주변 맛집 ${SearchBeach.size()}개</div>
			<div class="row">
				<c:forEach items="${SearchBeach}" var="SearchBeach">
					<div style="display: flex;">
						<div>
							<a href="${SearchBeach.link}"> <c:choose>
									<c:when test="${fn:contains(SearchBeach.category,'한식')}">
										<img src="/resources/img/한식찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'중식')}">
										<img src="/resources/img/중식찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'일식')}">
										<img src="/resources/img/일식찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'양식')}">
										<img src="/resources/img/양식찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'술집')}">
										<img src="/resources/img/술집찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'카페')}">
										<img src="/resources/img/카페찐.jpg">
									</c:when>
									<c:when test="${fn:contains(SearchBeach.category,'분식')}">
										<img src="/resources/img/분식찐.png">
									</c:when>
									<c:otherwise>
										<p>
											<img src="/resources/img/음식점.png">
										</p>
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div style="margin-left: 15px;">
							<h1
								style="font-size: 30px; font-weight: bold; margin-top: 0; margin-bottom: 0;">${SearchBeach.title}</h1>
							<div style="magin-top: 0;">${SearchBeach.category}</div>
							<h1 style="font-size: 20px;">${SearchBeach.address}</h1>
							<br> <br> <br> <br> <br> <br> <br>

						</div>
					</div>
					<div style="text-align:right; margin-bottom: 10px;">
						<a href="${SearchBeach.link}" style="">바로가기</a>
					</div>
					<hr>
				</c:forEach>


			</div>



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