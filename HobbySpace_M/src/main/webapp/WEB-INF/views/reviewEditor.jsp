<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>

<head>
<title>리뷰작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="resources/assets/css/join.css" />
<style type="text/css">
.starR {
	color: gainsboro;
	font-size: 50px
}

.starR.on {
	background-position: 0 0;
	color: yellow;
	font-size: 50px
}
</style>
</head>

<body class="is-preload" onload="init()">

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<!-- Header -->
	<header id="header">

		<a class="logo" href="/" /> <img src="resources/images/logo2.png"
			alt="logo Image" width="80" height="90" />

		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a>
					<div name="user" onClick="logInForm()" style="cursor: pointer"></div>
			</a></li>
			<li><a>
					<div name="res" onClick="ToReserveList()" style="cursor: pointer">예약리스트</div>
			</a></li>
			<li><a>
					<div name="review" onClick="ToReviewList()" style="cursor: pointer">후기관리</div>
			</a></li>
			<li><a>
					<div name="zzim" onClick="ToZzimList()" style="cursor: pointer">찜한
						공간</div>
			</a></li>
			<li><a>
					<div name="msp" onClick="ToManageSpace()" style="cursor: pointer">공간관리</div>
			</a></li>
			<li><a>
					<div name="logOut" onClick="LogOut()" style="cursor: pointer">로그아웃</div>
			</a></li>
		</ul>
	</nav>


	<div class="userId">
		<table class="type05">
			<tr>
				<th scope="row">공간이미지</th>
				<td>
					<div class="inner">이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
					<div class="btn_box">
						<label class="btn" for="snimg"> <input type="file"
							class="_fileRel" name="sp_img" id="spimg" accept="image/*"
							placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" />
							<button id='uploadBtn'>업로드</button>
							<div class="uploadResult">
								<ul id="ulChildren"></ul>
							</div>
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>
					<div class="starRev">
						<span class="starR on">★</span> <span class="starR">★</span> <span
							class="starR">★</span> <span class="starR">★</span> <span
							class="starR">★</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">후기 작성</th>
				<td>
					<div class="formtag">
						<form action="#">
							<textarea id="space_text" name="rvtext"
								placeholder="사용후기를 상세히 남겨주세요. 다른 회원에게 큰 도움이 됩니다:D"
								minlength="20" maxlength="500" required style="height: 108px;"></textarea>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<br>
	<br>
	<br>
	<div class="button1">
		<button type="button" onclick="send()">완료</button>
	</div>
	<br>
	<br>
	<br>
</body>
<script>
    var reserve;

    function init() {
        reserve = JSON.parse('${reserve}');
        if (reserve.rvstar > 0) {
            //let img = document.getElementById('ulChildren');
            //let jemsu = document.getElementById('ulChildren');
            let test = document.getElementById('space_text');
            test.value = reserve.rvtext;
        } else {
            reserve = JSON.parse('${reserve}');
        }
    }

    //var reserve = JSON.parse('${reserve}');
    var regex = new RegExp("(.*?)\.(jpg|png|jpeg)$", "i");
    var maxSize = 5242880; //5mb
    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과")
            return false
        }
        if (!regex.test(fileName)) {
            alert("해당 형식의 파일은 업로드할 수 없습니다")
            return false
        }
        return true
    }
    var rvimg;
    //이미지
    $("#uploadBtn").on("click", function(e) {
        var ele = document.getElementById('ulChildren');
        var eleCount = ele.childElementCount;
        if (eleCount == 0) {
            var formData = new FormData();
            var inputFile = $("input[name='sp_img']");
            var files = inputFile[0].files;
            //var name = "TOP";
            console.log(files);
            //add filedate to formdata
            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false
                }
                formData.append("uploadFile", files[i]);
                formData.append("rdCode", reserve.rdCode);
            }
            $.ajax({
                url: '${pageContext.request.contextPath}/ReviewImg',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    console.log(result);
                    alert("이미지가 업로드 되었습니다");
                    rvimg = result.rvimg;
                    showUploadeFile(result);
                    //$(".uploadDiv").html(cloneObj.html());
                }
            }); //$.ajax
        } else {
            alert("이미지는 1개만 올리실수 있습니다")
        }
    });



    var uploadResult = $(".uploadResult ul");

    function showUploadeFile(uploadResultArr) {
        var ulChildren = $("#ulChildren");
        $(uploadResultArr).each(function(i, obj) {
            let img = document.createElement("img");
            img.width = "300";
            img.height = "300";
            img.src = "/resources/images/rvimg/" + obj.rvimg;
            img.style.marginLeft = "11%";
            ulChildren.append(img);
        });
    }


    $('.starRev span').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });

    function send() {
        var form = document.createElement("form");
        if (reserve.rvstar > 0) {
            form.action = "EditReview"; //리뷰수정
            alert("수정");
        } else {
            form.action = "NewReview"; //리뷰작성
        }
        form.method = "post";
        //예약코드
        var inRdCode = document.createElement("input");
        inRdCode.type = "hidden";
        inRdCode.name = "rdCode";
        inRdCode.value = reserve.rdCode;
        form.appendChild(inRdCode);
        //공간코드
        var inSpCode = document.createElement("input");
        inSpCode.type = "hidden";
        inSpCode.name = "rdSpCode";
        inSpCode.value = reserve.rdSpCode;
        form.appendChild(inSpCode);
        //공간방번호
        var inSpRoom = document.createElement("input");
        inSpRoom.type = "hidden";
        inSpRoom.name = "rdRoom";
        inSpRoom.value = reserve.rdRoom;
        form.appendChild(inSpRoom);
        //리뷰이미지
        var inRvImg = document.createElement("input");
        inRvImg.type = "hidden";
        inRvImg.name = "rvImg";
        inRvImg.value = rvimg;
        form.appendChild(inRvImg);
        //리뷰별점
        var inRvStar = document.createElement("input");
        inRvStar.type = "hidden";
        inRvStar.name = "rvstar";
        inRvStar.value = $('.on').length;
        form.appendChild(inRvStar);
        //리뷰내용
        var inRvText = document.createElement("input")
        inRvText.type = "hidden";
        inRvText.name = "rvtext";
        inRvText.value = document.getElementById("space_text").value;
        form.appendChild(inRvText);

        document.body.appendChild(form);
        form.submit();
    }

    function logInForm() {
        var form = document.createElement("form");
        form.action = "LogInForm?sCode=1&userId=" + '${accessInfo}';
        form.method = "post";
        document.body.appendChild(form);
        form.submit();
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