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
width: 215px; /* 원하는 너비설정 */ 
padding: .8em .5em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */ 
background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
border: 1px solid #999; 
border-radius: 0px; /* iOS 둥근모서리 제거 */ 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 
}
.selectbox label {
    position: absolute;
    top: 1px;  /* 위치정렬 */
    left: 10px;  /* 위치정렬 */
    padding: .8em .5em;  /* select의 여백 크기 만큼 */
    color: #999;
    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
}
</style>
<head>
		<title>하비스페이스</title>
		<meta charset="utf-8" >
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >
		<meta name="description" content="" >
		<meta name="keywords" content="" >
		<link rel="stylesheet" href="resources/assets/css/main.css" >
		<link rel="icon" type="image/x-icon" sizes="16x16" href="resources/images/favicon.ico">
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
		 
	</head>
<body>
<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="content">
						<section>
							<h3>&nbsp;HobbySpace</h3>
							&nbsp;상호명: 주식회사 하비스페이스 대표: 홍길동<br/>
							&nbsp;사업자등록번호: 123-45-67890 <br/> 
							&nbsp;통신판매업신고번호: 2021-서울강남-1234<br/>
							&nbsp;사업자등록정보 영업소재지: 인천광역시 매소홀로 123<br/>
							&nbsp;이메일: null254@naver.com <br/>
							&nbsp;공간에 대한 문의사항은 해당 공간 호스트에게 직접 문의해주세요.
						</section>
						<section>
							<h4>Sem turpis amet semper</h4>
							<ul class="alt">
								<li><a href="#">Dolor pulvinar sed etiam.</a></li>
								<li><a href="#">Etiam vel lorem sed amet.</a></li>
								<li><a href="#">Felis enim feugiat viverra.</a></li>
								<li><a href="#">Dolor pulvinar magna etiam.</a></li>
							</ul>
						</section>
						<section>
							<h4>Magna sed ipsum</h4>
							<ul class="plain">
								<li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
								<li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
								<li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
								<li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
							</ul>
						</section>
					</div>
					<div class="copyright">
						&copy; Untitled. Photos <a href="/">home</a>, Video <a href="/">Coverr</a>.
					</div>
				</div>
			</footer>
</body>
</html>