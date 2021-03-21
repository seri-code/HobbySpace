<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="resources/assets/css/logInForm.css" />
		
	</head>
	<body class="is-preload">
	


	<!-- Header -->
	<header id="header" style="height: 7.25rem; line-height: 7.25rem; background-color: cornsilk;">

		<a href="/">
			<img src="resources/images/logo-removebg-preview.jpg" alt="logo Image" width="190" height="220" style="position: relative; top: -1rem;">

		</a>

		<div class="search" style="position:absolute; top:14px; right:18%;">
			<input type="text" name="keyword" placeholder="검색어를 입력해주세요." onkeypress="if(event.keyCode == 13 ){search();}" style="position: relative; top: 17px;
			width: 25rem; background-color: floralwhite;" />
			<button onClick="search()" style="position:absolute; top:30%; right:0%; background-color:gold;" >검색</button>
		</div>
		
		<input id="indate" name="seDate" type="date" style="font-weight: 600; width: 10rem;">
		
		<select id="sectlect" name="ctCode">
			<option selected value="">카테고리</option>
			<option value="01">주조</option>
			<option value="02">세미나실</option>
			<option value="03">공작</option>
			<option value="04">운동</option>
			<option value="05">목공</option>
			<option value="06">사진스튜디오</option>
			<option value="07">쿠킹스튜디오</option>
			<option value="08">녹음실</option>
		</select>

		<select id="select" name="spLocation">
			<option selected>지역을 선택해주세요</option>
			<option>서울</option>
			<option>인천</option>
			<option>대전</option>
			<option>부산</option>
			<option>광주</option>
			<option>울산</option>
			<option>대구</option>
			<option>강릉</option>
			<option>전주</option>
			<option>안산</option>
			<option>시흥</option>
			<option>춘천</option>
			<option>전주</option>
			<option>성남</option>
			<option>분당</option>
			<option>여수</option>
			<option>세종</option>
		</select>

		<div id="option">
			<div class="option__label"><label for="opt"></label></div>
			<input type="text" name="maxPeople" class="opt" value="0" placeholder="인원수" style="position: absolute; top: 40px; width: auto; height: 48px;" />
			<input type="button" value="+" class="opt" onClick="change(1)" style="position: relative; top: -10px; left: 128px;" />
			<input type="button" value="-" class="opt" onClick="change(-1)" style="position: relative; top: -10px; left: 129px;" />
		</div>

		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>
			
			
			
<div class="userId">
<table class="type05">
  <tbody> 
  <tr>
  <td><form action="#">ID<input type="text" name="userId"></form></td>
  </tr>
  <tr>
  <td><form action="#">PW<input type="password" name="userPw"></form></td>
  </tr>
  </tbody>
</table>
</div>

<div class="button1">
<button onClick="toJoin()">회원가입</button>
&nbsp;&nbsp;
<button onClick="submit()">로그인</button>
</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
<script>
function toJoin(){
	var form = document.createElement("form");
	form.action = "ToJoin";
	form.method = "GET";
	
	var SCode = document.createElement("input");
	SCode.type = "hidden";
	SCode.name = "SCode";
	SCode.value = "ToJoin";
	form.appendChild(SCode);
	
	document.body.appendChild(form);
	form.submit();
}

function submit() {
	var userId = document.getElementsByName("userId")[0];
	var userPw = document.getElementsByName("userPw")[0];
	var form = document.createElement("form");
	form.action = "LogIn";
	form.method = "POST";
	
	var SCode = document.createElement("input");
	SCode.type = "hidden";
	SCode.name = "SCode";
	SCode.value = "LogIn";
	form.appendChild(SCode);
	   
	form.appendChild(userId);
	form.appendChild(userPw);
	document.body.appendChild(form);
	
	form.submit();
}

function logInForm() {
	if(sessionStorage.getItem('nickname')==''){
		var form = document.createElement("form");
		form.action = "LogInForm?sCode=1";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	} else{
		var form = document.createElement("form");
		form.action = "manageProfile?sCode=toManageProfile&userId="+'${accessInfo}';
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
}
function ToReserveList() {
	var form = document.createElement("form");
	form.action = "ToReserveList?sCode=2&userId=" + '${accessInfo}';
	form.method = "post";

	document.body.appendChild(form);

	form.submit();
}
function ToReviewList() {
	var form = document.createElement("form");
	form.action = "ToReviewList?sCode=3&userId=" + '${accessInfo}';
	form.method = "post";

	document.body.appendChild(form);

	form.submit();
}
function ToZzimList() {
	var form = document.createElement("form");
	form.action = "ToZzimList?sCode=4&userId=" + '${accessInfo}';
	form.method = "post";

	document.body.appendChild(form);

	form.submit();
}
function ToManageSpace() {
	var form = document.createElement("form");
	form.action = "ToManageSpace?sCode=5&userId=" + '${accessInfo}';
	form.method = "post";

	document.body.appendChild(form);

	form.submit();
}
function LogOut() {
	var form = document.createElement("form");
	form.action = "LogOut?sCode=LogOut";
	form.method = "post";

	document.body.appendChild(form);

	form.submit();
}


</script>

<!-- Scripts -->
<script src="resources/assets/js/jquery.min.js"></script>
<script src="resources/assets/js/browser.min.js"></script>
<script src="resources/assets/js/breakpoints.min.js"></script>
<script src="resources/assets/js/util.js"></script>
<script src="resources/assets/js/main.js"></script>

</html>	