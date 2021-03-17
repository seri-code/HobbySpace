<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="${path}/resources/assets/css/pignose.calendar.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<!-- datepicker 한국어로 -->

<head>
<title>공간 상세 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="resources/assets/css/spaceDetail.css" />

<script src="resources/assets/js/jquery.min.js" ></script>
<script src="resources/assets/js/browser.min.js" ></script>
<script src="resources/assets/js/breakpoints.min.js"></script>
<script src="resources/assets/js/util.js" ></script>
<script src="resources/assets/js/main.js" ></script>

</head>
<body class="is-preload"
	onLoad="init();spName();spComment();spLong();spImg();spLocation();spPrice();spMobile();">

	<jsp:include page="header.jsp"></jsp:include>


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

	<div id="side_right">
		<button type="button" onClick="zzim()">찜하기♡</button>
		<button type="button" onClick="deleteZzim()">찜 삭제</button>
		<button onClick="room()">옵션선택하기▼</button>
		<div id="room"></div>
		<div id="date"></div>
		<div id="date1"></div>
		<div class="calendar"></div>
		<div id="res"></div>
	</div>

	<div class="image" id="sp_topimg"></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>


	<div class="inner">
		<div class="content">
			<header class="align-center">
				<div id="sp_name"></div>
				<h2>공간 소개</h2>
				<div id="sp_comment"></div>
				<div id="sp_long"></div>
				<div id="sp_location"></div>
				<div id="sp_price"></div>
				<div id="sp_moblie"></div>
			</header>
		</div>
	</div>

</body>

<!-- Scripts -->


<script src="${path}/resources/assets/js/pignose.calendar.full.min.js"></script>
<script type="text/javascript">
	var loadSpaceDetail = JSON.parse('${spaceInfo}');
	var spCode = ${spCode};
	function init() {
		let loginInfo = document.getElementsByName("user")[0];
		let logOut = document.getElementsByName("logOut")[0];
		sessionStorage.setItem('nickname', '${nickname}');
		sessionStorage.setItem('accessInfo', '${userId}');
		if (sessionStorage.getItem('nickname') == '') {
			loginInfo.textContent = "로그인";
			logOut.style.visibility = 'hidden';
		} else {
			loginInfo.textContent = '${nickname}' + "님";
		}
	}
	function spName() {
		let name = document.getElementById("sp_name");
		let add_name = document.createElement("div");
		add_name.textContent = loadSpaceDetail.spName;
		name.appendChild(add_name);
	}
	function spComment() {
		let comment = document.getElementById("sp_comment");
		let add_comment = document.createElement("div");
		add_comment.textContent = loadSpaceDetail.spComment;
		comment.appendChild(add_comment);
	}
	function spLong() {
		let splong = document.getElementById("sp_long");
		let add_splong = document.createElement("div");
		add_splong.textContent = loadSpaceDetail.spLong;
		splong.appendChild(add_splong);
	}
	function spImg() {
		let img = document.getElementById("sp_topimg");
		let add_img = document.createElement("img");
		add_img.src = "resources/images/" + loadSpaceDetail.spImg;
		img.appendChild(add_img);
	}
	function spLocation() {
		let location = document.getElementById("sp_location");
		let add_location = document.createElement("div");
		add_location.textContent = loadSpaceDetail.spLocation;
		location.appendChild(add_location);
	}
	function spPrice() {
		let price = document.getElementById("sp_price");
		let add_price = document.createElement("div");
		add_price.textContent = loadSpaceDetail.spPrice;
		price.appendChild(add_price);
	}
	function spMobile() {
		let mobile = document.getElementById("sp_moblie");
		let add_mobile = document.createElement("div");
		add_mobile.textContent = loadSpaceDetail.spMobile;
		mobile.appendChild(add_mobile);
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

	   function room(){
		      let request = new XMLHttpRequest();
		      request.onreadystatechange = function(){
		         if(this.readyState == 4 && this.status == 200){
		            let jsonData = decodeURIComponent(request.response);
		         
		            let roList = JSON.parse(jsonData);
		            
		            let section = document.getElementById("room");
		            
		            //* 이전에 누른 버튼 내용 = section에 내용이 있으면 지운다 */
		            while (section.firstChild) {
		               section.removeChild(section.firstChild);
		            }
		            
		            let obj1 = document.createElement("div");
		             obj1.className="custom-select";
		             section.appendChild(obj1);
		            let obj = document.createElement("SELECT");
		             obj.id="select1";
		             obj.className="custom-select"; 
		             
		             var opt = document.createElement("OPTION");
		                 opt.value = "";
		                 opt.text = "방을선택하세요";
		                 obj.options.add(opt);
		                 section.appendChild(obj);
		                 
		               for(i=0;i<roList.length; i++) {    
		                  var opt = document.createElement("OPTION");
		                    opt.value = roList[i].ronum;
		                    opt.text = roList[i].ronum +"호";
		                    obj.options.add(opt);
		                    section.appendChild(obj);
		                   
		                }
		               obj.addEventListener('change',function(){date(jsonData);}); 
		         }
		      };
		      request.open("post","Room", true);
		      request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		      request.send("sCode=" + 1+ "&spCode=" + spCode);   
		    }
	function date(jsonData) {
		let daList = JSON.parse(jsonData);
		var list = document.getElementById("select1");
		var value = list.options[list.selectedIndex].value;
		let Sdiv = document.getElementById("date");
		while (Sdiv.firstChild) {
			Sdiv.removeChild(Sdiv.firstChild);
		}
		
		let obj1 = document.createElement("div");
		obj1.textContent = "인원을 선택해주세요";
		Sdiv.appendChild(obj1);
		
		let div2 = document.createElement("input");
		div2.type = "text";
		div2.name = "people";
		for (i = 0; i < daList.length; i++) {
			if (value == daList[i].ronum) {
				div2.id = daList[i].people;
				div2.placeholder = "최대인원수는  " + daList[i].people + "명까지입니다";
			}
		}
		Sdiv.appendChild(div2);
		
		let div3 = document.createElement("input");
		div3.type = "button";
		div3.value = "확인";
		div3.addEventListener("click", function() {
			date1();
		});
		//div2.appendChild(div3);
		Sdiv.appendChild(div3);
	}
	function date1() {
		let people = document.getElementsByName("people")[0];
		if (people.value == 0) {
			alert("인원을선택해주세요!");
		}else if (Number(people.value) > Number(people.id)) {
			alert("최대인원 초과입니다. 확인 후 다시 입력해주세요!");
		}
		
		//방번호들고옴
		var list = document.getElementById("select1");
		var value = list.options[list.selectedIndex].value;
		//인원수 들고옴
		//var people = document.getElementsByName("people")[0];
		// 		alert(mre.value);
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData1 = decodeURIComponent(request.response);
				let finald = JSON.parse(jsonData1);
				//let day = finald.split(" ");
				let Sdiv1 = document.getElementById("date1");
				while (Sdiv1.firstChild) {
					Sdiv1.removeChild(Sdiv.firstChild);
				}
				let div3 = document.createElement("input");
				div3.type = "button";
				div3.value = "날짜를선택해주세여▼";
				div3.addEventListener("click", function() {
					date2(jsonData1)
				});
				Sdiv1.appendChild(div3);
			}
		}
		request.open("post", "finald", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=" + 2 + "&spCode=" + spCode);
	}
	function date2(jsonData1) {
		//방번호 가져옴
		var list = document.getElementById("select1");
		var value = list.options[list.selectedIndex].value;
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData2 = decodeURIComponent(request.response);
				let finald = JSON.parse(jsonData1);
				let falsed = JSON.parse(jsonData2);
				var arryf = new Array();
				for (i = 0; i < falsed.length; i++) {
					arryf[i] = falsed[i].cdate;
				}
				let startD = $("#today").text(new Date().toLocaleDateString());
				$('.calendar').pignoseCalendar({
					theme : 'dark', // light, dark, blue
					minDate : startD,
					maxDate : finald[0].finald,
					disabledDates : arryf,
					lang : 'ko',
					toggle : true,
					select : function(date, context) {
						var now = date[0];
						dated(now)
					}
				});
			}
		}
		request.open("post", "falsed", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=" + 3 + "&ronum=" + value + "&spCode=" + spCode);
	}
	function dated(now) {
		//방번호 가져옴 
		var list = document.getElementById("select1");
		var value = list.options[list.selectedIndex].value;
		alert(value);
		//인원수 가져옴 
		let people = document.getElementsByName("people")[0];
		people = people.value;
		let d = new Date(now);
		let selectdate = d.toLocaleDateString('zh-Hans-CN', {
			year : 'numeric',
			month : '2-digit',
			day : '2-digit',
		});
		let selectdata = selectdate.split("/");
		alert(selectdata);
		let Sdiv1 = document.getElementById("res");
		let div = document.createElement("input");
		div.type = "button";
		div.value = "예약하러가기";
		Sdiv1.appendChild(div);
		div.addEventListener("click", function() {
			finalall(selectdata, people, value);
		});
	}
	function finalall(selectdata, people, value) {
		let form = document.createElement("form");
		form.action = "Temp?sCode=" + 4 + "&selectdata=" + selectdata
				+ "&people=" + people + "&value=" + value + "&spCode=" + spCode;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function zzim() {
		alert('찜 리스트에 추가되었습니다.');
		var form = document.createElement("form");
		form.action = "Zzim?sCode=Zzim&spCode=" + spCode + "&userId="
				+ '${userId}';
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function deleteZzim() {
		alert('찜 리스트에서 삭제되었습니다.');
		var form = document.createElement("form");
		form.action = "DeleteZzim?sCode=DeleteZzim&spCode=" + spCode + "&userId="
			+ '${userId}';
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