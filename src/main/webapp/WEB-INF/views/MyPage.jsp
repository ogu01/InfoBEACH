<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style type="text/css">
/* beachImg 클래스: 이미지 높이를 200px로 설정하고, 오브젝트의 크기에 맞게 자르기 */
img.beachImg {
	height: 200px;
	object-fit: cover;
}

/* 사용자 정의 폰트 MangoByeolbyeol을 설정 */
@font-face {
	font-family: 'MangoByeolbyeol';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/MangoByeolbyeol.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

/* navbar 아이디: 플렉스 박스로 설정하여 자식 요소들을 가로로 정렬 */
#navbar {
	display: flex;
	align-items: center; /* 수직 정렬 */
}

/* logo-text 아이디: 텍스트 스타일 설정 및 이미지 옆에 배치 */
#logo-text {
	margin-left: 10px; /* 이미지와 텍스트 사이의 간격 조절 */
	font-size: 30px;
	margin-top: 30px;
	font-family: 'MangoByeolbyeol', sans-serif; /* MangoByeolbyeol 폰트 사용 */
	font-weight: bold; /* 텍스트를 굵게 설정 */
	cursor: pointer; /* 클릭 가능하게 표시 */
}

/* 바디 태그: 배경 이미지를 설정하고 폰트 패밀리 설정 */
body {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	font-family: 'MangoByeolbyeol', sans-serif;
}

/* gradient-btn 클래스: 버튼 스타일 설정 */
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
	border-radius: 5px;
	transition: background-position 0.3s; /* 백그라운드 포지션 변경 시 애니메이션 효과 */
}

/* gradient-btn 클래스의 호버 상태: 색상과 배경 위치 변경 */
.gradient-btn:hover {
	color: red;
	background-position: 99% 50%;
}
</style>
</head>
<body>
	<!-- 네비게이션 바 컨테이너: 로고 이미지와 텍스트를 포함 -->
	<div id="navbar" class="container px-0">
		<!-- 로고 이미지 링크 -->
		<a class="navbar-brand m-0" href="/"> <img style="width: 150px;"
			src="resources/img/바다.png">
		</a>
		<!-- 클릭 가능한 텍스트 -->
		<p id="logo-text" onclick="location.href = '/'">
			바다<br>보다
		</p>



	</div>

	<!-- 회원 정보 표시 -->

	<div class="container mt-5" style="min-height:70vh">
		<div class="row">
			<div class="col-lg-6">
				<h2>회원 정보</h2>
				<table class="table table-bordered">
					<tbody>
						<tr >
							<th scope="row">회원 ID</th>
							<td>${minfo.memberid}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td>${minfo.memberpw}</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>${minfo.membername}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${minfo.memberaddr}</td>
						</tr>
						<tr>
							<th scope="row">이메일 ID</th>
							<td>${minfo.memberemailid}</td>
						</tr>
						<tr>
							<th scope="row">이메일 도메인</th>
							<td>${minfo.memberemaildomain}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-6">
			   <!-- 즐겨찾기 해수욕장 리스트 -->
                <h2>즐겨찾기</h2>
                <hr>
                <c:if test="${favorite.size()>0}">
                
                 <c:forEach items="${favorite}" var="favorite">
                
               
                    <div>
                        
                        <a href="http://localhost:8080${favorite.beachurl}" style="text-decoration: none; color: inherit;">
                            ${favorite.beachname} 해수욕장
                        </a>
                        <hr>
                    </div>
                    
                </c:forEach>
                </c:if>
                <c:if test="${favorite.size()==0}">
                <div>
                즐겨찾기 목록이 없습니다.
                </div>
                </c:if>
                
               
				<!-- 오른쪽 반절 공간은 비워둠 -->
				
			</div>
		</div>
	</div>

	<!-- Footer 포함 -->
	<%-- Footer.jsp --%>
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<%-- Footer.jsp --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>