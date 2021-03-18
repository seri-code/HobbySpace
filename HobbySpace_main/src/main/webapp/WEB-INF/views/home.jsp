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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Poor+Story&display=swap" rel="stylesheet">
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

		
			
<!-- 		마우스롤오버	 -->
<!-- 			<figure class="snip1200"> -->
<!--   <img id="mainImage" class="bg-image" name="sp_topimg" -->
<!-- 				style="width: 100%; height:50rem; cursor: pointer;" onclick="spaceDetail()" /> -->
<!--   <figcaption> -->
<!--     <p>사진 클릭 시 공간 상세로 이동합니다. 당신만의 시간을 즐겨보세요!</p> -->
<!--     <div class="heading"> -->
<!--       <h2>Hobby<span> Space</span></h2> -->
<!--     </div> -->
<!--   </figcaption> -->
<!--   <a href="spaceDetail()"></a> -->
<!-- </figure> -->
<!-- 		마우스롤오버	 -->

		<div class="mySlides fade" > 
		<div class="numbertext">1 / 3</div>
			<figure class="snip1200">
			<img id="mainImage" class="bg-image" name="sp_topimg"
				style="width: 100%; height:50rem; cursor: pointer;" onclick="spaceDetail()" />
			<figcaption>
			<p style="font-size:30px">사진 클릭 시 공간 상세로 이동합니다. </p>
         <div class="heading">
     	 <h2>별점 최고<span> 추천공간</span></h2>
    	</div>
  			</figcaption>
  			<a onClick="spaceDetail()"></a>
			</figure>
		</div>

<!-- 		<div class="mySlides fade" > -->
<!-- 			<div class="numbertext">1 / 3</div> -->
<!-- 			<img id="mainImage" class="bg-image" name="sp_topimg" -->
<!-- 				style="width: 100%; height:50rem; cursor: pointer;" onclick="spaceDetail()" /> -->
				
<!-- 		    <div class="bg-text"> -->
<!--   			<h1 style="font-size:50px">★가장 높은 별점의 추천공간입니다.</h1> -->
<!--   			<h3 style="font-size:20px">원하는 공간을 찾아보세요.</h3> -->
<!-- 			</div> -->
<!-- 			<div class="text">별점 최고 공간</div> -->
<!-- 		</div> -->
	
		<div class="mySlides fade" > 
		<div class="numbertext">2 / 3</div>
		<figure class="snip1200">
			<img id="mainImage" class="bg-image" name="sp_topimg"
				style="width: 100%; height:50rem; cursor: pointer;" onclick="spaceDetail2()" />
			<figcaption>
			<p style="font-size:30px">사진 클릭 시 공간 상세로 이동합니다. </p>
         <div class="heading">
     	 <h2>예약 최다<span> 추천공간</span></h2>
    	</div>
  			</figcaption>
  			<a onClick="spaceDetail2()"></a>
			</figure>
		</div>
		
		
		<div class="mySlides fade" > 
		<div class="numbertext">3 / 3</div>
		<figure class="snip1200">
			<img id="mainImage" class="bg-image" name="sp_topimg"
				style="width: 100%; height:50rem; cursor: pointer;" onclick="spaceDetail3()" />
			<figcaption>
			<p style="font-size:30px">사진 클릭 시 공간 상세로 이동합니다. </p>
         <div class="heading">
     	 <h2>찜 클릭 수 최다<span> 추천공간</span></h2>
    	</div>
  			</figcaption>
  			<a onClick="spaceDetail3()"></a>
			</figure>
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
					<div class="content" onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate0()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="04"
									src="resources/images/Soccer.jpg" 
									width="150" height="150">
							</div>
							<h3>운동</h3>
						</header>
						<p>여럿이서 같이 하는 스포츠! 친구들과 추억을 같이 쌓아보세요.</p>
					</div>

				</section>
				<section>
					<div class="content" onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate1()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="06"
									src="resources/images/photo.jpg" 
									width="150" height="150">
							</div>
							<h3>사진 스튜디오</h3>
						</header>
						<p>멋있고 이쁜 모습들을 찍으세요!</p>
					</div>
				</section>
				<section>
					<div class="content" onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate2()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="07"
									src="resources/images/cooking.jpg" 
									width="150" height="150">

							</div>
							<h3>쿠킹 스튜디오</h3>
						</header>
						<p>맛있는 나만의 요리를 만들어 보아요!</p>
					</div>
				</section>
				<section>
					<div class="content"  onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate3()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="01"
									src="resources/images/drink.jpg"
									width="150" height="150">
							</div>
							<h3>주조</h3>
						</header>
						<p>나만의 술을 제조해 보아요! 취하지는 말고</p>
					</div>
				</section>
				<section>
					<div class="content"  onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate4()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="08"
									src="resources/images/sing.jpg" 
									width="150" height="150">
							</div>
							<h3>녹음실</h3>
						</header>
						<p>노래연습을 마음껏! 노래실력을 뽑내보아요~</p>
					</div>
				</section>
				<section>
					<div class="content"  onMouseOver="this.style.backgroundColor='#FFAA28';" onMouseOut="this.style.backgroundColor='#FFFFFF'"
					onclick="searchCate5()" style="cursor: pointer;">
						<header>
							<div class="image">
								<input type="image" name="cate" value="05"
									src="resources/images/tree.jpg"
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

<!-- <figure class="snip1141"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" /> -->
<!--   <figcaption> -->
<!--     <div class="circle"><i class="ion-ios-plus-empty"> </i></div> -->
<!--     <h2>Paris York</h2> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->

	<!-- Testimonials -->
	<section class="wrapper">
		<div class="inner">
			<header class="special">
				<h2 style="color:#000000">이용자 리뷰</h2>
				<p>이용자들의 생생한 후기를 만나보세요!</p>
			</header>
			<div class="testimonials">
				<section>
				<figure class="snip1141" onClick="reviewToSpace(loadReview[0].spCode)" style="cursor: pointer;">
						<div class="image" id="rv_img"></div>
					<div class="content">
							
						<blockquote>						
							<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
							 </blockquote>
						
<!-- 						 <div id="rv_content" style="cursor: pointer;"></div> -->
						
						<div class="author">

							<p class="credit">
								<h2>Click</h2>  <strong id="p"><span id="rv_star"
									class="star-prototype"></span></strong> <span id="span"></span>				
							</p>
							
							<figcaption style="height:450px;">
								
							<a style="float:left;"></a>
							 <div id="rv_content" style="cursor: pointer;"></div>
							</figcaption>
							
						</div>
					</div>
					
					</figure>
				</section>

				
				<section>
				<figure class="snip1141" onClick="reviewToSpace(loadReview[1].spCode)" style="cursor: pointer;">
						<div class="image" id="rv_img2"></div>
					<div class="content">
							
						<blockquote>
							
							
							<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
							 </blockquote>
						
						
						<div class="author">

							<p class="credit">
								<h2>Click</h2>  <strong id="p"><span id="rv_star2"
									class="star-prototype"></span></strong> <span id="span2"></span>									
							</p>
							
							<figcaption style="height:450px;">
								
							<a style="float:left;"></a>
							 <div id="rv_content2" style="cursor: pointer;"></div>
							</figcaption>
							
						</div>
					</div>
					
					</figure>
				</section>
				
				
<!-- 				<section> -->
<!-- 					<div class="content"> -->
<!-- 						<blockquote> -->
<!-- 							<p> -->
<!-- 							<div id="rv_content3" style="cursor: pointer;"></div> -->
<!-- 							</p> -->
<!-- 						</blockquote> -->
<!-- 						<div class="author"> -->
<!-- 							<div class="image" id="rv_img3"></div> -->
<!-- 							<p class="credit"> -->
<!-- 								- <strong id="p"><span id="rv_star3" -->
<!-- 									class="star-prototype"></span></strong> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</section> -->

				<section>
				<figure class="snip1141" onClick="reviewToSpace(loadReview[2].spCode)" style="cursor: pointer;">
						<div class="image" id="rv_img3"></div>
					<div class="content">							
						<blockquote>
													
							<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
							 </blockquote>						
						
						<div class="author">

							<p class="credit">
								<h2>Click</h2>  <strong id="p"><span id="rv_star3"
									class="star-prototype"></span></strong> 
									<span id="span3"></span>									
							</p>
							
							<figcaption style="height:450px;">
								
							<a style="float:left;"></a>
							 <div id="rv_content3" style="cursor: pointer;"></div>
							</figcaption>						
						</div>
					</div>
					</figure>
				</section>
				

			</div>
		</div>
	</section>



	
	
<jsp:include page="footer.jsp"></jsp:include>

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
		add_review.style.width ="260px";
		add_review.style.margin ="210px 0 5px 30px";
		
		review.appendChild(add_review);

		let star = document.getElementById("rv_star");
		star.textContent = loadReview[0].rvStar;
		

		let img = document.getElementById("rv_img");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/rvimg/" + loadReview[0].rvImg;
		add_img.style.width = "340px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[0].spCode);
		});
		img.style.cursor = "pointer";

		
		let span = document.getElementById("span");
		span.textContent = "("+loadReview[0].rvStar+"/5"+")";
		
	}

	function init3() {
		let review = document.getElementById("rv_content2");
		let add_review = document.createElement("div");
		add_review.textContent = loadReview[1].rvText;
		add_review.style.width ="260px";
		add_review.style.margin ="210px 0 5px 30px";
		
		review.appendChild(add_review);

		let star = document.getElementById("rv_star2");
		star.textContent = loadReview[1].rvStar;
		

		let img = document.getElementById("rv_img2");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/rvimg/" + loadReview[1].rvImg;
		add_img.style.width = "340px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[1].spCode);
		});
		img.style.cursor = "pointer";

		
 		let span = document.getElementById("span2");
		span.textContent = "("+loadReview[1].rvStar+"/5"+")";
		
	}
	
	function init4() {
		let review = document.getElementById("rv_content3");
		let add_review = document.createElement("div");
		add_review.textContent = loadReview[2].rvText;
		add_review.style.width ="260px";
		add_review.style.margin ="210px 0 5px 30px";
		
		review.appendChild(add_review);

		let star = document.getElementById("rv_star3");
		star.textContent = loadReview[2].rvStar;
		
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};
		
		'${rv_star}'
		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
		
		let img = document.getElementById("rv_img3");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/rvimg/" + loadReview[2].rvImg;
		add_img.style.width = "340px";
		add_img.style.height = "187px";
		img.appendChild(add_img);
		img.addEventListener('click', function() {
			reviewToSpace(loadReview[2].spCode);
		});
		img.style.cursor = "pointer";

		
		let span = document.getElementById("span3");
		span.textContent = "("+loadReview[2].rvStar+"/5"+")";
		
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
	
	  $(".hover").mouseleave(
			    function () {
			      $(this).removeClass("hover");
			    }
			  );
	  
	  
	  
	 
</script>

<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>

</html>