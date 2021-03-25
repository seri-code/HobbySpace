<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>

<meta charset="UTF-8" />
<title>날짜 api</title>
<link rel="stylesheet"
	href="${path}/resources/assets/css/pignose.calendar.min.css">
<link rel="stylesheet" href="resources/assets/css/manageProfile.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<style>
/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.pignose-calendar-unit-disabled a {
	color: red !important
}

button {
	position: relative;
	left: 58.3%;
	top: -56px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="${path}/resources/assets/js/pignose.calendar.full.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
        $(function() {
            //오늘 날짜를 출력
            $("#today").text(new Date().toLocaleDateString());

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);

            // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
            // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
            //시작일.
            $('#fromDate').datepicker({
                showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
                buttonText: "날짜선택", // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd", // 날짜의 형식
                changeMonth: true, // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function(selectedDate) {
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#toDate").datepicker("option", "minDate", selectedDate);
                }
            });
            

            //종료일
            $('#toDate').datepicker({
                showOn: "both",
                buttonText: "날짜선택",
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function(selectedDate) {
                    // 종료일(toDate) datepicker가 닫힐때
                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#fromDate").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

    </script>
</head>

<body class="is-preload" onload="init()">

	<!-- Header -->
	<header id="header">
		<!-- 				<a class="logo" href="./imgages/logo1.png">HobbySpace</a> -->

		<a class="logo" href="/"> <img src="resources/images/logo2.png"
			alt="logo Image" width="80" height="90" />
		</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

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




	<div class="heading">
		<h3
			style="color: #000000; font-weight: 800; font-size: xx-large; text-align: center; border-bottom: 5px solid lightsalmon; padding-bottom: 26px;">가능한
			날짜를 입력해주세요.</h3>

		<div class="dateinput"
			style="border: 3px solid lightsalmon; margin-left: 15%; margin-right: 15%;">


			<h1
				style="font-size: revert; font-weight: 500; position: relative; left: 39%;">오늘
				날짜 :</h1>
			<span id="today"
				style="position: relative; left: 52%; font-size: x-large; top: -65px;"></span>
			<label for="fromDate"
				style="font-size: x-large; font-weight: 1000; position: relative; left: 22rem;">영업시작일
				: </label> <input type="text" name="startD" id="fromDate"
				onchange="datechange()"
				style="position: relative; width: 15rem; left: 39%;"> <label
				for="toDate"
				style="font-size: x-large; font-weight: 1000; position: relative; left: 22rem;">영업종료일
				: </label> <input type="text" name="finalD" id="toDate"
				onchange="datechange()"
				style="position: relative; width: 15rem; left: 39%;"> <br>
			<h2
				style="position: relative; left: 37.5%; font-weight: 600; color: red;">휴무일을
				선택해주세요</h2>
			<div class="calendar" style="position: relative; left: 3%;"></div>
			<button name='zensong' onClick="zensong()"
				style="position: relative; left: 39.5%; width: 20.5rem; font-size: x-large; top: 0px;">전송</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	var nDate;
	var finalD;
    function datechange() {
    	startD = document.getElementById('fromDate').value;
    	finalD = document.getElementById('toDate').value;
        
        var arr = [];
        arr.push = ("2021-03-15");
        arr.push = ("2021-03-18");
        arr.push = ("2021-03-21");
        $('.calendar').pignoseCalendar({
            theme: 'blue', // light, dark, blue
            minDate: startD,
            maxDate: finalD,
            lang: 'ko',
            toggle: true,
            select: function(dates, context) {
                console.log('sDate', context.storage.activeDates);
                nDate = context.storage.activeDates;
            }
        	,disabledDates: [
        		$(arr).each(function(){  })
    		]
        });
    }
    function zensong() {

    	var spCode = '${spCode}';

    	var form = document.createElement("form");
        form.action="SaveD";
        form.method="post";
        
        var myspCode =document.createElement("input");
        myspCode.type = "hidden";
        myspCode.name = "sp_Code";
        myspCode.value = spCode;
        form.appendChild(myspCode);
        
        var myDate =document.createElement("input");
        myDate.type = "hidden";
        myDate.name = "finalD";
        myDate.value = finalD;
        form.appendChild(myDate);
        
        var notDate =document.createElement("input");
        notDate.type = "hidden";
        notDate.name = "nDate";
        notDate.value = nDate;
        form.appendChild(notDate);
        
        document.body.appendChild(form);
        form.submit();
    	
	}
</script>

<!-- Scripts -->
<!-- <script src="resources/assets/js/jquery.min.js"></script> -->
<!-- <script src="resources/assets/js/browser.min.js"></script> -->
<!-- <script src="resources/assets/js/breakpoints.min.js"></script> -->
<!-- <script src="resources/assets/js/util.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->

</html>