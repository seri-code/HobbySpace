<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>

	<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-stype: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 20px;
}
</style>



	<div class='uploadDiv'>
		<input id='uploadBtn' type='file' name='uploadFile' multiple
			onchange="upload()">
	</div>

	<div class='uploadResult'>
		<ul>

		</ul>
	</div>

	<button id='uploadBtn2'>upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous">
		
	</script>


	<script>
		$(document)
				.ready(
						function() {

							var regex = new RegExp("(.*?)\.(jpg|png|jpeg)$",
									"i");
							var maxSize = 5242880;

							function checkExtension(fileName, fileSize) {
								if (fileSize >= maxSize) {
									alert("파일 사이즈 초과");
									return false;
								}
								if (!regex.test(fileName)) {
									alert("해당 종류의 파일은 업로드 할 수 없습니다");
									return false;
								}
								return true;
							}

							var cloneObj = $(".uploadDiv").clone();

							$("#uploadBtn")
									.change(
											function(e) {
												var formData = new FormData();

												var inputFile = $("input[name='uploadFile']");

												var files = inputFile[0].files;

												console.log(files);

												//add filedate to formdata
												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i]);
												}

												var uploadResult = $(".uploadResult ul");

												function showUploadedFile(
														uploadResultArr) {
													var str = "";
													$(uploadResultArr)
															.each(
																	function(i,
																			obj) {
																		var fileCallPath = encodeURIComponent(obj.uploadPath
																				+ "/s_"
																				+ obj.uuid
																				+ "_"
																				+ obj.fileName);
																		str += "<img src='\\resources\\img\\upload\\2021\\03\\11\\"+fileCallPath+"'>";

																	});
													uploadResult.append(str);
												}

												$
														.ajax({
															url : '/uploadAjaxAction',
															processData : false,
															contentType : false,
															data : formData,
															type : 'POST',
															dataType : 'json',
															success : function(
																	result) {
																console
																		.log(result);
																showUploadedFile(result);

																//$(".uploadDiv").html(cloneObj.html());
															}
														}); //$.ajax

											});

						});
	</script>

</body>
</html>