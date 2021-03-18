<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko" dir="ltr">
<head>
<title>취미공간</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="icon" type="image/x-icon" sizes="16x16"
	href="resources/images/favicon.ico">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
</head>
<body class="is-preload" onLoad="init();init2();init3();init4()">

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a><div name="user" onClick="logInForm()"
						style="cursor: pointer"></div></a></li>
			<li><a><div name="res" onClick="ToReserveList()"
						style="cursor: pointer">예약리스트</div></a></li>
			<li><a><div name="review" onClick="ToReviewList()"
						style="cursor: pointer">후기관리</div></a></li>
			<li><a><div name="zzim" onClick="ToZzimList()"
						style="cursor: pointer">찜한 공간</div></a></li>
			<li><a><div name="msp" onClick="ToManageSpace()"
						style="cursor: pointer">공간관리</div></a></li>
			<li><a><div name="logOut" onClick="LogOut()"
						style="cursor: pointer">로그아웃</div></a></li>
		</ul>
	</nav>

	<!-- Banner -->

	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img id="mainImage" name="sp_topimg"
				style="width: 100%; cursor: pointer; height:30rem;" onclick="spaceDetail()" />
			<div class="text">별점 최고 공간</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img id="mainImage" name="sp_topimg"
				style="width: 100%; cursor: pointer" onclick="spaceDetail2()" />
			<div class="text">예약 최다 공간</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img id="mainImage" name="sp_topimg"
				style="width: 100%; cursor: pointer" onclick="spaceDetail3()" />
			<div class="text">찜 최다 공간</div>
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>



	<!-- Highlights -->
	<!-- CTA -->
	<section id="cta" class="wrapper">
		<div class="inner">
			<h2>HobbySpace</h2>
			<p>어떤 공간을 찾고있나요?</p>
		</div>
	</section>

	<section class="wrapper">
		<div class="inner">
			<div class="highlights">
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="04"
									src="resources/images/Soccer.jpg" onclick="searchCate0()"
									width="150" height="150">
							</div>
							<h3>운동</h3>
						</header>
						<p>여럿이서 같이 하는 스포츠! 친구들과 추억을 같이 쌓아보세요.</p>
					</div>

				</section>
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="06"
									src="resources/images/photo.jpg" onclick="searchCate1()"
									width="150" height="150">
							</div>
							<h3>사진 스튜디오</h3>
						</header>
						<p>멋있고 이쁜 모습들을 찍으세요!</p>
					</div>
				</section>
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="07"
									src="resources/images/cooking.jpg" onclick="searchCate2()"
									width="150" height="150">

							</div>
							<h3>쿠킹 스튜디오</h3>
						</header>
						<p>맛있는 나만의 요리를 만들어 보아요!</p>
					</div>
				</section>
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="01"
									src="resources/images/drink.jpg" onclick="searchCate3()"
									width="150" height="150">
							</div>
							<h3>주조</h3>
						</header>
						<p>나만의 술을 제조해 보아요! 취하지는 말고</p>
					</div>
				</section>
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="08"
									src="resources/images/sing.jpg" onclick="searchCate4()"
									width="150" height="150">
							</div>
							<h3>녹음실</h3>
						</header>
						<p>노래연습을 마음껏! 노래실력을 뽑내보아요~</p>
					</div>
				</section>
				<section>
					<div class="content">
						<header>
							<div class="image">
								<input type="image" name="cate" value="05"
									src="resources/images/tree.jpg" onclick="searchCate5()"
									width="150" height="150">
							</div>
							<h3>목공</h3>
						</header>
						<p>인테리어를 내 손으로! 쓱싹쓱싹</p>
					</div>
				</section>
			</div>
		</div>
	</section>

	<!-- Testimonials -->
	<section class="wrapper">
		<div class="inner">
			<header class="special">
				<h2>이용자 리뷰</h2>
				<p>이용자들의 생생한 후기를 만나보세요!</p>
			</header>
			<div class="testimonials">
				<section>
					<div class="content">
						<blockquote>
							<p>
							<div id="rv_content" style="cursor: pointer;"></div>
							</p>
						</blockquote>
						<div class="author">
							<div class="image" id="rv_img"></div>
							<p class="credit">
								- <strong id="p"><span id="rv_star"
									class="star-prototype"></span></strong> <span></span>
							</p>
						</div>
					</div>
				</section>
				<section>
					<div class="content">
						<blockquote>
							<p>
							<div id="rv_content2" style="cursor: pointer;"></div>
							</p>
						</blockquote>
						<div class="author">
							<div class="image" id="rv_img2"></div>
							<p class="credit">
								- <strong id="p"><span id="rv_star2"
									class="star-prototype"></span></strong>
							</p>
						</div>
					</div>
				</section>
				<section>
					<div class="content">
						<blockquote>
							<p>
							<div id="rv_content3" style="cursor: pointer;"></div>
							</p>
						</blockquote>
						<div class="author">
							<div class="image" id="rv_img3"></div>
							<p class="credit">
								- <strong id="p"><span id="rv_star3"
									class="star-prototype"></span></strong>
							</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>



	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<div class="content">
				<section>
					<h3>Accumsan montes viverra</h3>
					<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing
						gravida odio porttitor sem non mi integer non faucibus ornare mi
						ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien
						lorem accumsan varius montes viverra nibh in adipiscing. Lorem
						ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum.
						Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed
						feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia
						ante nunc ac gravida.</p>
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
				&copy; Untitled. Photos <a href="https://unsplash.co">Unsplash</a>,
				Video <a href="https://coverr.co">Coverr</a>.
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>


</body>
<script>
	var topStar = JSON.parse('${topStar}');
	var topReserve = JSON.parse('${topReserve}');
	var topZzim = JSON.parse('${topZzim}');

	function spaceDetail() {
		var form = document.createElement("form");
		form.action = "SpaceDetail?sCode=SpaceDetail&spCode=" + topStar.spCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function spaceDetail2() {
		var form = document.createElement("form");
		form.action = "SpaceDetail?sCode=SpaceDetail&spCode="
				+ topReserve.spCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function spaceDetail3() {
		var form = document.createElement("form");
		form.action = "SpaceDetail?sCode=SpaceDetail&spCode=" + topZzim.spCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function init() {
		for (i = 0; i < 3; i++) {

			let img = document.getElementsByName("sp_topimg");
			img[0].src = "resources/images/" + topStar.spImg;
			img[1].src = "resources/images/" + topReserve.spImg;
			img[2].src = "resources/images/" + topZzim.spImg;
		}

		let loginInfo = document.getElementsByName("user")[0];
		let logOut = document.getElementsByName("logOut")[0];
		sessionStorage.setItem('nickname', '${nickname}');
		sessionStorage.setItem('accessInfo', '${accessInfo}');
		if (sessionStorage.getItem('nickname') == '') {
			loginInfo.textContent = "로그인";
			logOut.style.visibility = 'hidden';
		} else {
			loginInfo.textContent = '${nickname}' + "님";
		}
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

	var slideIndex = 1;
	var timer = null;
	showSlides(slideIndex);

	function plusSlides(n) {
		clearTimeout(timer);
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		clearTimeout(timer);
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n == undefined) {
			n = ++slideIndex
		}
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		timer = setTimeout(showSlides, 6000);
	}

	loadReview = JSON.parse('${review}');
	function init2() {
		let review = document.getElementById("rv_content");
		let add_review = document.createElement("div");
		add_review.textContent = loadReview[0].rvText;
		review.appendChild(add_review);

		let star = document.getElementById("rv_star");
		star.textContent = loadReview[0].rvStar;

		let img = document.getElementById("rv_img");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/" + loadReview[0].rvImg;
		add_img.style.width = "125px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[0].spCode);
		});
		img.style.cursor = "pointer";

	}

	function init3() {
		let review = document.getElementById("rv_content2");
		let add_review = document.createElement("div");
		add_review.textContent = loadReview[1].rvText;
		review.appendChild(add_review);

		let star = document.getElementById("rv_star2");
		star.textContent = loadReview[1].rvStar;

		let img = document.getElementById("rv_img2");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/" + loadReview[1].rvImg;
		add_img.style.width = "125px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[1].spCode);
		});
		img.style.cursor = "pointer";
	}

	function init4() {
		let review = document.getElementById("rv_content3");
		let add_review = document.createElement("div");
		add_review.textContent = loadReview[2].rvText;
		review.appendChild(add_review);

		let star = document.getElementById("rv_star3");
		star.textContent = loadReview[2].rvStar;

		// 별점 호출 함수(이 함수는 없어도 아래 함수 있으면 작동함)
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};
		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();

		let img = document.getElementById("rv_img3");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/" + loadReview[2].rvImg;
		add_img.style.width = "125px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[2].spCode);
		});
		img.style.cursor = "pointer";
	}

	// 카테고리 클릭 시 검색결과 페이지로 이동
	function searchCate0() {
		let ctCode = document.getElementsByName("cate")[0].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function searchCate1() {
		let ctCode = document.getElementsByName("cate")[1].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function searchCate2() {
		let ctCode = document.getElementsByName("cate")[2].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function searchCate3() {
		let ctCode = document.getElementsByName("cate")[3].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function searchCate4() {
		let ctCode = document.getElementsByName("cate")[4].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function searchCate5() {
		let ctCode = document.getElementsByName("cate")[5].value;
		var form = document.createElement("form");
		form.action = "SearchCate?sCode=SearchCate&ctCode=" + ctCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	// 리뷰사진 클릭 시 공간상세 페이지로 이동
	function reviewToSpace(spCode) {
		var form = document.createElement("form");
		form.action = "SpaceDetail?sCode=SpaceDetail&spCode=" + spCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>

</html>