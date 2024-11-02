<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바다리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style type="text/css">

@font-face {
    font-family: 'MangoByeolbyeol';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/MangoByeolbyeol.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
} 
 #logo-text {
        
         margin-top:20px;
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

.imgSize {
    height: 300px;
    object-fit: cover;
    width: 100%;
    border-radius: 20px;
    border: 2px solid black;
}

.card-title {
    font-size: 20px;
    font-weight: bold;	
    text-align: center;
    margin-top: 10px;
}



</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/includes/TopLogo.jsp" %>
	<hr>
	
    <div class="container mt-5" style="min-height: 70vh;">
    <div class= mb-3 style="font-family: 'MangoByeolbyeol', sans-serif; font-weight: bold; font-size:20px;">
	${param.sido} 해수욕장 ${beachnum} 개
	</div>
			  <div class="dropdown mb-3 text-end">
		  <button id="dateBtn1" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    날짜선택
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="javascript:clickDate1('${today}')">${today}</a></li>
		    <li><a class="dropdown-item" href="javascript:clickDate1('${nextDay1}')">${nextDay1}</a></li>
		    <li><a class="dropdown-item" href="javascript:clickDate1('${nextDay2}')">${nextDay2}</a></li>
		  </ul>
		</div>
        <div class="row">
            <c:forEach items="${beach}" var="beach">
                <div class="col-lg-3 col-md-4 mb-4">
                    <div class="card">
                        <img src='resources/img/${param.sido}_${beach.sta_nm}.jfif' class="card-img-top imgSize" alt="" onclick="weather('${beach.lat}','${beach.lon}','${beach.sta_nm}')">
                            <h5 class="card-title">${beach.sta_nm} 해수욕장
                            <%-- /addFavorite?nx=${beach.lat}&ny=${beach.lon}&searchText=${beach.sta_nm} --%>
                            
                            <c:set var="check" value="true"/>
                         	<c:if test="${sessionScope.loginId != null }">	
                         	<c:forEach items="${favorite}" var="favorite">
                         		<c:if test="${sessionScope.loginId == favorite.memberid && beach.sta_nm == favorite.beachname }">
                         		<c:set var="check" value="false" />
                   
                         		</c:if>
                         		
                         		</c:forEach>
                         		<c:if test="${check == false}">
                         		<img class="icon" style="width: 35px; height: 35px; padding-bottom: 5px; " alt="즐찾완료" src="resources/img/체크북마크.png" onclick="hateBeach('${beach.lat}', '${beach.lon}', '${beach.sta_nm}','${param.sido}','zxc')">
                         		</c:if>
                         		<c:if test="${check == true}">
                         		<img class="icon" style="width: 35px; height: 35px; padding-bottom: 5px; " alt="" src="resources/img/즐겨찾기.png" onclick="likeBeach('${beach.lat}', '${beach.lon}', '${beach.sta_nm}','${param.sido}','zxc')">
                         		</c:if>
                         	  </c:if>
                         	  
                         
                       </h5>	
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/includes/Footer.jsp" %>

	<script type="text/javascript">
	let likedate = '${today}';
	
	function likeBeach(nx, ny, searchText,sido,searchText1){
		location.href=`/addFavorite?nx=\${nx}&ny=\${ny}&searchText=\${searchText}&date=\${likedate}&sido=\${sido}&searchText1=\${searchText1}`;
		
	}
	function hateBeach(nx, ny, searchText,sido,searchText1){
		location.href=`/removeFavorite?nx=\${nx}&ny=\${ny}&searchText=\${searchText}&date=\${likedate}&sido=\${sido}&searchText1=\${searchText1}`;
		
	}
	function clickDate1(selDate){
		console.log(selDate)
		document.getElementById('dateBtn1').innerText = selDate;
		likedate = selDate;
		
	}
	
	function weather(nx, ny, searchText){
		location.href=`/weather?nx=\${nx}&ny=\${ny}&searchText=\${searchText}&date=\${likedate}`;
		
	}
	
	</script>

</body>
</html>