<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
    
        <!-- Responsive navbar-->
<nav class="navbar navbar-expand navbar-white bg-white">
	<div class="container px-0">
		<div class="d-flex align-items-center">
			<a class="navbar-brand m-0" href="/"> <img style="width: 150px;"
				src="resources/img/바다.png"></a>
			<p id="logo-text" onclick="location.href = '/'">
				바다<br>보다
			</p>
		</div>


<!-- 		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> -->

		<div >
			<button type="button" class="btn btn-primary " data-bs-toggle="modal"
				data-bs-target="#exampleModal"
				style="background-color: white; color: black; border: none; display: inline-block; font-size: 30px; font-family: 'MangoByeolbyeol', sans-serif; /* MangoByeolbyeol 폰트 사용 */ font-weight: bold;">

				날짜 | 검색</button>
		</div>



		<div >

			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${sessionScope.loginId == null }">
						<%--$ --%>
						<!-- 로그인이 되어 있지 않은 경우 -->
						<button class="btn btn-primary text-white"
							onclick="location.href='/loginForm'">로그인/회원가입</button>

					</c:when>
					<c:otherwise>
						<!-- 로그인이 되어 있는 경우 -->
						<button class="btn btn-primary text-white" style="margin: 10px"
							onclick="location.href='/memberInfo'">마이페이지</button>
						<button class="btn btn-primary text-white" style="margin: 10px"
							onclick="location.href='/logout'">로그아웃</button>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
	</div>

</nav>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xs" role="document">
				<div class="modal-content">
					<div class="modal-header">

						<h1 class="modal-title fs-5 w-100 text-center fw-bold"
							id="exampleModalLabel" class="text-success " class="text-center">날짜
							| 검색</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 검색창 추가 -->
						<form action="/selectsido">
							<div class="input-group mb-3">
								<input type="hidden" name="searchDate" id="searchDate"
									value="${today}"> <input type="text" name="searchText"
									class="form-control" placeholder="검색어 입력" aria-label="검색어 입력"
									aria-describedby="button-search">
								<button class="btn btn-outline-secondary" type="submit"
									id="button-search">검색</button>
							</div>
						</form>

						<div class="dropdown">

							<button id="dateBtn" class="btn btn-secondary dropdown-toggle  "
								type="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="background-color: skyblue; color: black;">
								${today}</button>

							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="javascript:clickDate('${today}')">${today}</a></li>
								<li><a class="dropdown-item"
									href="javascript:clickDate('${nextDay1}')">${nextDay1}</a></li>
								<li><a class="dropdown-item"
									href="javascript:clickDate('${nextDay2}')">${nextDay2}</a></li>
							</ul>

						</div>
					</div>

				</div>





			</div>
		</div>



<script type="text/javascript">
	let searchdate = '${today}';

	function clickDate(selDate) {
		console.log(selDate)
		document.getElementById('dateBtn').innerText = selDate;
		searchdate = selDate;

		document.getElementById('searchDate').value = selDate;

	}

	function search(nx, ny, searchText) {
		location.href = `/weather?nx=\${nx}&ny=\${ny}&searchText=\${searchText}&date=\${likedate}`;

	}
</script>
     
        