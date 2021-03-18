<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<meta charset="UTF-8">
	<title>공간등록</title>
	<link rel="stylesheet" href="resources/assets/css/inputSpace.css">
<link rel="icon" type="image/x-icon" sizes="16x16"
	href="resources/images/favicon.ico">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
</head>

<body onload="init()">
	<div>공간명*</div>
	<div class="input"><input type="text" id="space_name" name="sp_name" required="" minlength="1" maxlength="20"></div>

	<div>카테고리*</div>
	<ul class="check_list space">
		<li><input type="radio" name="space" id="cate1" value="01"><label id="spct0" for="cate1" class="ellip"></label></li>
		<li><input type="radio" name="space" id="cate2" value="02"><label id="spct1" for="cate2" class="ellip"></label></li>
		<li><input type="radio" name="space" id="cate3" value="03"><label id="spct2" for="cate3" class="ellip"></label></li>
		<li><input type="radio" name="space" id="cate4" value="04"><label id="spct3" for="cate4" class="ellip"></label></li>
		<li><input type="radio" name="space" id="cate6" value="05"><label id="spct4" for="cate6" class="ellip"></label></li>
	</ul>

	<div>공간한줄소개*</div>
	<div>
		<input type="text" id="space_intro" name="sp_intro" placeholder="공간을 소개하는 한줄 문장을 입력해주세요." minlength="1" maxlength="27" required="" value="">
	</div>

	<div>공간긴줄소개*</div>
	<div>
		<textarea id="space_text" name="sp_text" placeholder="공간을 상세하게 소개해보세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다." minlength="20" maxlength="500" required="" style="height: 108px;"></textarea>
	</div>

	<div>공간주의사항*</div>
	<div>
		<input type="text" name="sp_caution" id="space_rsv_caution" placeholder="주의사항을 작성해주세요." maxlength="100" value="">
		<button onclick="add_sp_caution()">추가</button>
	</div>
	<div id="add_caution"></div>

	<div>공간주소*</div>
	<div class="input">
		<input type="text" id="sample6_postcode" placeholder="우편번호"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소">
	</div>
	<div>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	</div>
	
	<div>공간Room 설정*</div>
	<div class="room">
		<input type="text" name="sp_room" maxlength="4" placeholder="방 번호"><input type="text" name="sp_peopel" maxlength="3" placeholder="방의 최대 수용수"><input type="button" class="btnAdd" value="추가"><br>
	</div>
	
	
	<div>공간가격*</div>
	<div class="input">
		<input type="text" name="sp_price" id="space_price" placeholder="가격을 입력해 주세요." maxlength="30" value="">
	</div>

		<div>공간대표이미지*</div>
	<div class="inner inner_img">대표이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
	<div class="btn_box">
	
		<div class="uploadDiv">
			<input type="file" name="uploadFile">
			<button id='uploadBtn'>업로드</button>
		</div>
		
		<div class ="uploadResult">
		<ul id = "ulChildren">
				
		</ul>
		</div>
	
	
	</div>

	<div>공간이미지*</div>
	<div class="inner inner_img2">이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
	<div class="btn_box2">
	
		<div class="uploadDiv2">
			<input type="file" name="uploadFile2">
			<button id='uploadBtn2'>업로드</button>
		</div>
		
		<div class ="uploadResult2">
		<ul id = "ulChildren2">
				
		</ul>
		</div>
	
	
	</div>

	<div>공간연락처*</div>
	<div class="input"><input type="text" name="sp_mobile" id="space_mobile" required="" minlength="1" maxlength="20" value=""></div>

	<div>공간SNS*</div>
	<div class="input"><input type="text" name="sp_sns" id="space_url" placeholder="웹사이트 URL을 입력해주세요." value="">
		<button onclick="add_sp_sns()">추가</button>
	</div>
	<div id="add_sns"></div>

	<div>공간태그*</div>
	<div class="input"><input type="text" name="sp_tag" id="space_tag" placeholder="태그를 입력해 주세요." maxlength="30" value="">
		<button onclick="add_sp_tag()">추가</button>
	</div>
	<div id="add_tag"></div>
	<br>
	<button onclick="toDate()">다음</button>
</body>

<script type="text/javascript">
	function init() {
		var spCategory = JSON.parse('${spCategory}');
		for(i=0; i<spCategory.length; i++){
			document.getElementById('spct' + i).textContent = spCategory[i].ctCate;
		}
	}
	//공간 방 설정
		$(document).ready(function() {
		$('.btnAdd').click(function() {
			$('.room').append(
				'<input type="text" name="sp_room" maxlength="4" placeholder="방 번호"><input type="text" name="sp_peopel" maxlength="3" placeholder="방의 최대 수용수"><input type="button" class="btnRemove" value="삭제"><br>'
			); // end append                            
			$('.btnRemove').on('click', function() {
				$(this).prev().remove(); // remove the 방번호
				$(this).prev().remove(); // remove the 최대수용수
				$(this).next().remove(); // remove the <br>
				$(this).remove(); // remove the button
			});
		}); // end click                                            
	}); // end ready
	
	
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
	//공간대표이미지
	$("#uploadBtn").on("click", function(e) {
		var ele = document.getElementById('ulChildren');
		var eleCount = ele.childElementCount;
		if(eleCount == 0){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		var name = "TOP";
		console.log(files);
		//add filedate to formdata
		for (var i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false
			}
			formData.append("uploadFile", files[i]);
			formData.append("name", name);
		}
		$.ajax({
			url: '${pageContext.request.contextPath}/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);
				showUploadeFile(result);
				//$(".uploadDiv").html(cloneObj.html());
			}
		}); //$.ajax
		}else{
			alert("대표이미지는 1개만 올리실수 있습니다")
		}
	});
	
	var uploadResult = $(".uploadResult ul");
	var spCode; 
	var spImgName; 
	var uploadPath; 
	function showUploadeFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(function(i,obj){
			str += "<li>" + obj.fileName + "</li>";
			spCode = obj.spCode;
			spImgName = obj.spImgName;
			uploadPath = obj.uploadPath;
		});
		
		uploadResult.append(str);
	}
	
	//공간이미지
	$("#uploadBtn2").on("click", function(e) {
		var ele = document.getElementById('ulChildren');
		var eleCount = ele.childElementCount;
		var ele2 = document.getElementById('ulChildren2');
		var eleCount2 = ele2.childElementCount +1;
		if(eleCount == 1){
			var formData2 = new FormData();
			var inputFile2 = $("input[name='uploadFile2']");
			var files2 = inputFile2[0].files;
			console.log(files2);
			var name = eleCount2;
			//add filedate to formdata
			for (var i = 0; i < files2.length; i++) {
				if (!checkExtension(files2[i].name, files2[i].size)) {
					return false
				}
				formData2.append("uploadFile2", files2[i]);
				formData2.append("name", name);
				formData2.append("spCode", spCode);
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/uploadImg',
				processData: false,
				contentType: false,
				data: formData2,
				type: 'POST',
				dataType: 'json',
				success: function(result) {
					console.log(result);
					showUploadeFile2(result);
					//$(".uploadDiv").html(cloneObj.html());
				}
			}); //$.ajax
		}else{
			alert("대표이미지부터 올려주십시오");
		}
	});
	
	var uploadResult2 = $(".uploadResult2 ul");
	var spImgName2 = new Array();; 
	
	function showUploadeFile2(uploadResultArr){
		var str2 = "";
		$(uploadResultArr).each(function(i,obj){
			str2 += "<li>" + obj.fileName + "</li>";
			spImgName2.push(obj.spImgName);
		});
		
		uploadResult2.append(str2);
	}
	
	var cautions = new Array();
	function add_sp_caution() {
		if (overlapCaution()) {
			alert("중복입니다");
		} else {
			let div_caution = document.getElementById("add_caution");
			let add_caution = document.createElement('div');
			add_caution.textContent = document.getElementById('space_rsv_caution').value;
			div_caution.appendChild(add_caution);
			var caution = document.getElementById('space_rsv_caution').value;
			cautions.push(caution);
		}
	}
	function overlapCaution() {
		var isDup = false;
		let wond = document.getElementById('space_rsv_caution').value;
		for (i = 0; i < cautions.length; i++) {
			if (cautions[i] == wond) {
				isDup = true;
				break;
			} else {
				isDup = false;
			}
		}
		return isDup;
	}
	var snss = new Array();
	function add_sp_sns() {
		if (overlapSns()) {
			alert("중복입니다");
		} else {
			let div_sns = document.getElementById("add_sns");
			let add_sns = document.createElement('div');
			add_sns.textContent = document.getElementById('space_url').value;
			div_sns.appendChild(add_sns);
			var sns = document.getElementById('space_url').value;
			snss.push(sns);
		}
	}
	function overlapSns() {
		var isDup = false;
		let wond = document.getElementById('space_url').value;
		for (i = 0; i < snss.length; i++) {
			if (snss[i] == wond) {
				isDup = true;
				break;
			} else {
				isDup = false;
			}
		}
		return isDup;
	}
	var tags = new Array();
	function add_sp_tag() {
		if (overlapTag()) {
			alert("중복입니다");
		} else {
			let div_tag = document.getElementById("add_tag");
			let add_tag = document.createElement('span');
			add_tag.textContent = "#" + document.getElementById('space_tag').value + " ";
			div_tag.appendChild(add_tag);
			var tag = "#" + document.getElementById('space_tag').value;
			tags.push(tag);
		}
	}
	function overlapTag() {
		var isDup = false;
		let wond = "#" + document.getElementById('space_tag').value;
		for (i = 0; i < tags.length; i++) {
			if (tags[i] == wond) {
				isDup = true;
				break;
			} else {
				isDup = false;
			}
		}
		return isDup;
	}
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	}
	function toDate() {
		var spct;
		for (var i = 0; i < document.getElementsByName("space").length; i++) {
			if (document.getElementsByName("space")[i].checked == true) {
				spct = document.getElementsByName("space")[i].value;
			}
		}
		var romm = $("input[name=sp_room]").length;
		//배열 생성
		var romms = new Array(romm);
		//배열에 값 주입
		for(var i=0; i<romm; i++){                          
			romms[i] = $("input[name=sp_room]").eq(i).val();
	        //alert(romms[i]);
		}
		alert(romms);
		
		var peopel = $("input[name=sp_peopel]").length;
		//배열 생성
		var peopels = new Array(peopel);
		//배열에 값 주입
		for(var i=0; i<romm; i++){                          
			peopels[i] = $("input[name=sp_peopel]").eq(i).val();
	        //alert(romms[i]);
		}
		alert(peopels);
		var form = document.createElement("form");
		form.action = "toDate";
		form.method = "post";
		form.enctype="multipart/form-data";
		//공간이름
		var inSpName = document.createElement("input");
		inSpName.type = "hidden";
		inSpName.name = "sp_name";
		inSpName.value = document.getElementById('space_name').value;
		form.appendChild(inSpName);
		//공간카테고리
		var inSpCt = document.createElement("input");
		inSpCt.type = "hidden";
		inSpCt.name = "ctCode";
		inSpCt.value = spct;
		form.appendChild(inSpCt);
		
		var inSpRomm = document.createElement("input");
		inSpRomm.type = "hidden";
		inSpRomm.name = "sp_romms";
		inSpRomm.value = romms;
		form.appendChild(inSpRomm);
		
		var inSpPeopels = document.createElement("input");
		inSpPeopels.type = "hidden";
		inSpPeopels.name = "sp_peopels";
		inSpPeopels.value = peopels;
		form.appendChild(inSpPeopels);
		//공간짦은글 소개
		var inSpIntro = document.createElement("input");
		inSpIntro.type = "hidden";
		inSpIntro.name = "sp_intro";
		inSpIntro.value = document.getElementById('space_intro').value;
		form.appendChild(inSpIntro);
		//공간 긴글 소개
		var inSpText = document.createElement("input");
		inSpText.type = "hidden";
		inSpText.name = "sp_text";
		inSpText.value = document.getElementById('space_text').value;
		form.appendChild(inSpText);
		//공간 주의사항
		var inSpCaution = document.createElement("input");
		inSpCaution.type = "hidden";
		inSpCaution.name = "sp_cautions";
		inSpCaution.value = cautions;
		form.appendChild(inSpCaution);
		//공간주소
		var inSpAddy1 = document.createElement("input");
		inSpAddy1.type = "hidden";
		inSpAddy1.name = "sp_addy1";
		inSpAddy1.value = document.getElementById('sample6_address').value;
		form.appendChild(inSpAddy1);
		//공간상세주소
		var inSpAdrs2 = document.createElement("input");
		inSpAdrs2.type = "hidden";
		inSpAdrs2.name = "sp_addy2";
		inSpAdrs2.value = document.getElementById('sample6_detailAddress').value;
		form.appendChild(inSpAdrs2);
		//공간가격
		var inSpPrice = document.createElement("input");
		inSpPrice.type = "hidden";
		inSpPrice.name = "sp_price";
		inSpPrice.value = document.getElementById('space_price').value;
		form.appendChild(inSpPrice);
		//공간 연락처
		var inSpMobile = document.createElement("input");
		inSpMobile.type = "hidden";
		inSpMobile.name = "sp_mobile";
		inSpMobile.value = document.getElementById('space_mobile').value;
		form.appendChild(inSpMobile);
		//공간sns
		var inSpSns = document.createElement("input");
		inSpSns.type = "hidden";
		inSpSns.name = "sp_snss";
		inSpSns.value = snss;
		form.appendChild(inSpSns);
		//공간태그
		var inSpTag = document.createElement("input");
		inSpTag.type = "hidden";
		inSpTag.name = "sp_tags";
		inSpTag.value = tags;
		form.appendChild(inSpTag);
		//공간코드
		var inspCode = document.createElement("input");
		inspCode.type = "hidden";
		inspCode.name = "sp_Code";
		inspCode.value = spCode;
 		form.appendChild(inspCode);
		//대표이미지 이름
 		var inSptopImg = document.createElement("input");
 		inSptopImg.type = "hidden";
 		inSptopImg.name = "sp_ImgName";
		inSptopImg.value = spImgName;
 		form.appendChild(inSptopImg);
		//대표이미지 경로
		var inSptopImgPath = document.createElement("input");
 		inSptopImgPath.type = "hidden";
 		inSptopImgPath.name = "sp_loadPath";
		inSptopImgPath.value = uploadPath;
 		form.appendChild(inSptopImgPath);
 		//이미지이름
 		var inSptopImg2 = document.createElement("input");
 		inSptopImg2.type = "hidden";
 		inSptopImg2.name = "sp_ImgNames";
 		inSptopImg2.value = spImgName2;
 		form.appendChild(inSptopImg2);
		
		document.body.appendChild(form);
		form.submit();
		//공간대표이미지/sp_topimg, 공간이미지/sp_img,
	}
</script>

</html>