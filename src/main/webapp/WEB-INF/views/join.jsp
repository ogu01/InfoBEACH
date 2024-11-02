<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Heroic Features - Start Bootstrap Template</title>
<!-- Favicon-->
    <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/templet/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/templet/css/styles.css" rel="stylesheet" />
<style>
.displayNone {
	display: none;
}
.errorForm{
	outline-color: red !important;
	border-color: red !important;
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
		<%@ include file="/WEB-INF/views/includes/TopLogo.jsp" %>
		
		
		<%-- TopLogo.jsp --%>
		<hr>
        <!-- Page Content-->
        <section class="pt-4" style="min-height: 70vh;">
            <div class="container px-lg-2" style="width:500px; ">
            		<!-- 로그인양식 -->
			<h2 style="">회원가입</h2>
            <form class="d-block mx-auto mt-3 p-3 border rounded"     onsubmit="return joinFormCheck(this)" method="post" action="/joinForm">
            <div class="mb-3">
			    <label for="inputName" class="form-label" >이름</label>
			    <input type="text" class="form-control" id="inputName"  name="membername" >
			  </div>
			  <div class="mb-3">
			  
			    <label for="inputId" class="form-label" >아이디</label>
			    <div class="d-flex">
			    <input type="text" class="form-control" id="inputId"  name="memberid" >
			    <button type="button" onclick="idCheck()" class="btn btn-primary" style="min-width: 90px; margin-left: 15px">중복확인</button>
			    </div>
			  </div>
			    <div id="idCheckMsg" class="displayNone">중복확인 결과 출력</div>
			  <div class="mb-3">
			    <label for="inputPw" class="form-label" >비밀번호</label>
			    <input type="password" class="form-control" id="inputPw"  name="memberpw">
			  </div>
			   <div class="mb-3">
			    <label for="inputAddr" class="form-label" >주소</label>
			    <input type="text" class="form-control" id="inputAddr"  name="memberaddr" >
			  </div>
			  <div class="mb-3" >
			    <label for="inputEmail" class="form-label" >이메일</label>
			    <div class="d-flex" >
			    <input type="text" class="form-control" id="inputEmail"  name="memberemailid" onfocus="focustInput_Email(this)" onblur="blurInput_Email(this)" style="margin-right: 10px">@
			    <label for="emailDomain" class="form-label" ></label>
			    <input type="text" class="form-control" id="emailDomain"  name="memberemaildomain" onfocus="focustInput_Email(this)" onblur="blurInput_Email(this)" style="margin-left: 10px">
			    <select onchange="selectDomain(this)" style="border: 2px solid black;border-radius: 5px;margin-left: 10px">
							<option value="">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
						</select>
						</div>
			  </div>

			  
			  
			  <button type="submit" class="btn btn-primary w-100" style="margin-top: 15px; margin-bottom: 15px">회원가입</button>             
			</form>	
            </div>
        </section>
        <!-- Footer-->
 <!-- Footer-->
        <!-- Footer-->
		<%-- Footer.jsp --%>
		<%@ include file="/WEB-INF/views/includes/Footer.jsp" %>
		
		<%-- Footer.jsp --%>

	<script type="text/javascript"> 
	// fuction 함수명(매개변수){실행코드}
	function focusInput(obj) {
	  //obj : focuseInput를 호출한 input태그
	  // obj.parentElement : <div class = "formRow">
	  //claaList : 해당 요소의 class속성값 목록
	  //add('focuseRow') : focusRow 클래스값 추가
	  console.log(obj);
	  obj.parentElement.classList.add("focusRow");
	}
	function blurInput(obj) {
	  obj.parentElement.classList.remove("focusRow");
	}
	function focustInput_Email(obj) {
	  obj.parentElement.parentElement.classList.add("focusRow");
	}
	function blurInput_Email(obj) {
	  obj.parentElement.parentElement.classList.remove("focusRow");
	}
	function selectDomain(obj) {
	  // obj : select태그
	  //obj.value : select태그 의 value 속성
	  let selectValue = obj.value;
	  console.log("선택한 도메인: " + selectValue);
	  /* 이메일 도메인을 입력하는 input 태그를 선택하고
	       해당 태그의 value 속성값을 selectValue로 변경
	    */
	   document.getElementById("emailDomain").value = selectValue;
	 // document.querySelector("#emailDomain").value = selectValue;
	}

	</script>

	<!-- jQuery -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>




	<script type="text/javascript">
		let idCheckResult = false; // 아이디 중복 확인 결과
		let idNoChange = null;

		function idCheck() {
			console.log("idCheck() 호출");
			//1.아이디 입력 태그 선택
			let idInputEl = document.getElementById('inputId');
			let idValue = idInputEl.value;
			console.log("입력한 아이디 : " + idValue);

			//2.결과 메세지 출력 태그 선택
			let checkMsgEl = document.getElementById('idCheckMsg');

			if (idValue.length <= 2) {
				checkMsgEl.innerText = "아이디는 2 글자 이상 입력해주세요!";
				checkMsgEl.classList.remove('displayNone');
				idCheckResult = false;
				return;
			}
			
			
			//3. 아이디 중복 확인 요청 전송 - ajax 방식
			$.ajax({
				url : '/idCheck',
				type : 'post',
				/* dataType : 'json' */
				data : {
					'userId' : idValue
				},
				async : false,
				success : function(res) {
					console.log("응답결과 : " + res);
					if (res == 'Y') {
						idCheckResult = true;
						checkMsgEl.innerText = "사용 가능한 아이디 입니다.";
						checkMsgEl.style.color = "green";
						idNoChange = idValue;
						
						
					} else {
						idCheckResult = false;
						checkMsgEl.innerText = "이미 사용중인 아이디 입니다.";
						checkMsgEl.style.color = "red";
						idInputEl.parentElement.classList.remove('errorForm');
					}
					checkMsgEl.classList.remove('displayNone');
				}
			});

		}

		function joinFormCheck(formObj) {
			/*아이디를 입력했는지 확인*/
			// 1.아이디 입력 태그를 선택
			// let inputMemberId = formObj.memberId;
			let inputMemberId = formObj.memberid;
			let idCheckMsgEl = document.getElementById('idCheckMsg');
			
			let inputMemberPw = document.querySelector("#inputPw");
			let inputMemberName = document.querySelector("#inputName");
			let inputMemberAd = document.querySelector("#inputAddr");
			let inputMemberEi = document.querySelector("#inputEmail");
			let inputMemberEd = document.querySelector("#emailDomain");

			

			if (inputMemberId.value.length == 0) {
				alert("아이디를 입력 해주세요!!");
				idCheckMsgEl.classList.remove('displayNone');
				idCheckMsgEl.style.color = 'red';
				
				inputMemberId.focus();
				return false;
			}
			if (inputMemberPw.value.length == 0) {
				alert("비밀번호를 입력 해주세요!!");
				inputMemberPw.focus();
				return false;
			}
			if (inputMemberName.value.length == 0) {
				alert("이름을 입력 해주세요!!");
				inputMemberName.focus();
				return false;
			}
			if (inputMemberAd.value.length == 0) {
				alert("주소를 입력 해주세요!!");
				inputMemberAd.focus();
				return false;
			}
			if (inputMemberEi.value.length == 0) {
				alert("이메일아이디를 입력 해주세요!!");
				inputMemberEi.focus();
				return false;
			}
			if (inputMemberEd.value.length == 0) {
				alert("이메일도메인을 입력 해주세요!!");
				inputMemberEd.focus();
				return false;
			}
			if (!idCheckResult) {
				idCheckMsgEl.innerText = '아이디 중복확인을 해주세요!!';
				idCheckMsgEl.classList.remove('displayNone');
				idCheckMsgEl.style.color = 'red';
				inputMemberId.parentElement.classList.add('errorForm');
				inputMemberId.focus();
				return false;
			}
			if(idNoChange != inputMemberId.value){
				idCheckMsgEl.innerText = '아이디 중복확인을 해주세요!!';
				idCheckMsgEl.classList.remove('displayNone');
				idCheckMsgEl.style.color = 'red';
				inputMemberId.parentElement.classList.add('errorForm');
				inputMemberId.focus();
				return false;
				
			}

			return true;
		}
		
		
	
	</script>
</body>
</html>