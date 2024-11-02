
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Responsive navbar-->
<style>
.d-none {
	display: none;
}
</style>

<nav class="navbar navbar-expand-lg navbar-white bg-white">
	<div class="container px-0">
		<a class="navbar-brand m-0" href="/"> <img
			style="width: 150px; margin-left: 0; height: 150px;"
			src="resources/img/바다.png"></a>
		<p id="logo-text" style="min-width: 65px;"
			onclick="location.href = '/'">
			바다<br>보다
		</p>


		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="text-center"
			style="font-family: 'MangoByeolbyeol', sans-serif; font-weight: bold; width: 100%;">
		
			<div style="text-align: center; font-size: 25px;">

				<fmt:parseDate value="${date}" pattern="yyyyMMdd" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일"
					var="formattedDate" />
				<h2
					style="font-weight: bold; font-family: 'MangoByeolbyeol', sans-serif;"
					id="cdate">${formattedDate}</h2>


				<!-- flex-direction: row-reverse; -->
				<div style="display: flex; justify-content: center;">
					<c:forEach items="${weatherList}" var="weather">
						<%--${weather.fcstDate == date && weather.fcstTime == 1200} --%>

						<c:if test="${weather.fcstTime == 1200}">

							<c:if test="${weather.category == 'SKY'}">
								<div id="div${weather.fcstDate}" class="date d-none">
									<c:choose>
										<c:when test="${weather.fcstValue == '1'}">
											<c:set var="fcst" value="맑음" />

											<img alt="맑음" src="/resources/img/맑음.jfif"
												style="width: 30px; height: 30px;">
											맑음

									</c:when>
										<c:otherwise>
											<c:set var="fcst" value="흐림" />

											<img alt="흐림" src="/resources/img/흐림.jfif"
												style="width: 30px; height: 30px;">
											흐림

									</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<div id="div${weather.fcstDate}1" class="date d-none">
								<c:if test="${weather.category == 'TMP'}">
                    			${weather.fcstValue}°C 
                			</c:if>
							</div>

						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="dropdown mb-3 text-end"
			style="font-family: 'MangoByeolbyeol', sans-serif; /* MangoByeolbyeol 폰트 사용 */ font-weight: bold;">

			<button id="dateBtn1" class="btn btn-secondary dropdown-toggle"
				type="button" data-bs-toggle="dropdown" aria-expanded="false">
				날짜선택</button>
			<ul class="dropdown-menu" style="dispaly: inline-block;">
				<li><a class="dropdown-item"
					href="javascript:clickDate1('${today}')">${today}</a></li>
				<li><a class="dropdown-item"
					href="javascript:clickDate1('${nextDay1}')">${nextDay1}</a></li>
				<li><a class="dropdown-item"
					href="javascript:clickDate1('${nextDay2}')">${nextDay2}</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarSupportedContent"
			style="min-width: 300px;">

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
<script type="text/javascript">
	let searchdate = '${today}';

	function clickDate(selDate){
		console.log(selDate)
		document.getElementById(`div`).innerText = selDate;
		searchdate = selDate;
	
	}
	
	</script>
<script type="text/javascript">
	let likedate = '${today}';
	
	document.querySelector(`#div\${likedate}`).classList.remove('d-none')
	document.querySelector(`#div\${likedate}1`).classList.remove('d-none')
	
	
	function clickDate1(selDate) {
	    console.log(selDate)
	    
	    document.getElementById('dateBtn1').innerText = selDate;
	    document.getElementById('cdate').innerText = selDate.substr(0,4)+"년 " + selDate.substr(4,2)+"월 "+selDate.substr(6,2)+"일";
	    
	    let datelist = document.querySelectorAll('.date');
	    for(let dateEl of datelist){
	    	dateEl.classList.add('d-none');
	    }
	    
		document.querySelector(`#div\${selDate}`).classList.remove('d-none')
		document.querySelector(`#div\${selDate}1`).classList.remove('d-none')	    
	 /*    for (let i = 0; i < weatherList.length; i++) {
	    
	        if (weatherList[i].fcstDate === selDate) {
	            document.getElementById(`div\${selDate}`).classList.remove("d-none");
	            document.getElementById(`div\${selDate}1`).classList.remove("d-none");
	        } else {
	            document.getElementById(`div\${weatherList[i].fcstDate}`).classList.add("d-none");
	            document.getElementById(`div\${weatherList[i].fcstDate}1`).classList.add("d-none");
	        }
	    }
	    
	    likedate = selDate; */
		likedate = selDate;
	}
	</script>