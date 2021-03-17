<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html lang="ko" dir="ltr">
<style>
	.img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	@media screen and (min-width: 800px) {
		#header-search-desktop-div {
			position: absolute;
			left: 1100px;
			width: 400px;
			margin-top: 26px;
			margin-bottom: 2px;
			border-radius: 24px;
		}
		#header-search-desktop-div #header-search-fa {
			position: absolute;
			color: #7E7E7E;
			z-index: 100;
			font-size: 27px;
		}
		#header-search-desktop-div .fa-search {
			top: 5%;
			left: 1.5%;
			line-height: 0.8em;
		}
	}
	#header-search-submit {
		position: absolute;
		z-index: 1;
		padding: 0;
		right: 20px;
		top: 0px;
		font-size: 24px;
		font-family: FontAwesome;
		cursor: pointer;
		background: 0;
		border: 0;
	}
	select {
		width: 215px;
		/* 원하는 너비설정 */
		padding: .8em .5em;
		/* 여백으로 높이 설정 */
		font-family: inherit;
		/* 폰트 상속 */
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
		/* 네이티브 화살표 대체 */
		border: 1px solid #999;
		border-radius: 0px;
		/* iOS 둥근모서리 제거 */
		-webkit-appearance: none;
		/* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
	}
	.selectbox label {
		position: absolute;
		top: 1px;
		/* 위치정렬 */
		left: 10px;
		/* 위치정렬 */
		padding: .8em .5em;
		/* select의 여백 크기 만큼 */
		color: #999;
		z-index: -1;
		/* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
	}
	div {
		display: inline-block;
	}
</style>

<head>
	<title>하비스페이스</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="resources/assets/css/main.css">
	<link rel="icon" type="image/x-icon" sizes="16x16" href="resources/images/favicon.ico">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

</head>

<body class="is-preload">


	<!-- Header -->
	<header id="header">

		<a href="/">
			<img src="resources/images/logo-removebg-preview.jpg" alt="logo Image" width="190" height="220">

		</a>

		<div class="search" style="position:absolute; top:14px; right:18%;">
			<input type="text" name="keyword" placeholder="검색어를 입력해주세요." onkeypress="if(event.keyCode == 13 ){search();}" />
			<button onClick="search()" style="position:absolute; top:0%; right:-24%">검색</button>
		</div>
		
		<input id="indate" name="seDate" type="date">
		
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
			<input type="text" name="maxPeople" class="opt" value="0" placeholder="인원수" style="position: absolute; top: 14px; width: auto; height: 48px;" />
			<input type="button" value="+" class="opt" onClick="change(1)" style="position: relative; top: -7px; left: 128px;" />
			<input type="button" value="-" class="opt" onClick="change(-1)" style="position: relative; top: -7px; left: 129px;" />
		</div>

		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

</body>
<script>
	function change(qty) {
		var maxPeople= document.getElementsByName("maxPeople")[0];
		var val = parseInt(maxPeople.value);
		maxPeople.value = ((val += qty) == 0) ? 1 : val;
	}
	function search() {
		var keyword = document.getElementsByName("keyword")[0];
		var sedate = document.getElementById("indate");
 		var sect = document.getElementById("sectlect");
 		var seaddy = document.getElementById("select");
 		var seple = document.getElementsByName("maxPeople")[0];
 		
		if(keyword.value != ""){
			var form = document.createElement("form");
			form.action = "Search?sCode=Search";
			form.method = "post";
			form.appendChild(keyword);
			document.body.appendChild(form);
			form.submit();
		}else{
			var form2 = document.createElement("form");
			form2.action = "SearchD";
			form2.method = "post";
			form2.appendChild(sedate);
			form2.appendChild(sect);
			form2.appendChild(seaddy);
			form2.appendChild(seple);
			document.body.appendChild(form2);
			form2.submit();
		}
	
	}
</script>

</html>
