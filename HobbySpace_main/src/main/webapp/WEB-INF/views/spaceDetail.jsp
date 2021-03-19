<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title>취미공간</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="resources/assets/css/reserveDetail.css" />
   
      
   </head>
   <body class="is-preload" onLoad="init()">

      <jsp:include page="header.jsp"></jsp:include>   
         
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


<div>

   <img class=img2 src="/resources/images/${getSptopimg13}">
</div>
   
 
   <!-- One -->
         <input onClick="Zzim()" type="button"  value="리뷰를남겨주세요!" style="position: relative; background-color: moccasin;"/>
            <div class="inner" id="inner">
                     <div id="content" class="content" style="top: 280%; margin-top: 20px">
                        <header class="align-center" id ="align-center">
                           <h2 id="h2">예약 정보</h2>
                           <p id="p1">예약자 성함 : ${reservDetailInFo.get(0).USNICKNAME}</p>
                        </header>
                        <hr />   
                        <p id="p2"> 예약일시 : ${reservDetailInFo.get(0).frdrsreqdate}</p>
                        <p id="p3"> 예약자 핸드폰 : ${reservDetailInFo.get(0).frdmobile}</p>
                        <p id="p3"> 선택한 인원수 : ${reservDetailInFo.get(0).frdpeople}</p>
               
                     </div>
                  </div>
            
</body>
      
   <jsp:include page="footer.jsp"></jsp:include>      
      

         
      <!-- Scripts -->
         <script src="resources/assets/js/jquery.min.js"></script>
         <script src="resources/assets/js/browser.min.js"></script>
         <script src="resources/assets/js/breakpoints.min.js"></script>
         <script src="resources/assets/js/util.js"></script>
         <script src="resources/assets/js/main.js"></script>
               
   <script>
   function Zzim(){
	   let reserv1 = JSON.parse('${reservDetail}');
	   let rdcode = reserv1[0].frdcode;
	   let rdronum = reserv1[0].frdronum;
	   let frdrocode = reserv1[0].frdrospcode;
	   
	   let form = document.createElement("form");
	   form.action = "ToNewReview?rdCode="+rdcode+"&rdRoom="+rdronum+"&rdSpCode="+frdrocode;
	   form.method = "post";
	   document.body.appendChild(form);
	   form.submit();
   }
   
	   
   function logInForm() {
      var form = document.createElement("form");
      form.action = "LogInForm?sCode=1&userId="+'${accessInfo}';
      form.method = "post";
      document.body.appendChild(form);
      form.submit();
   }
   function ToReserveList() {
      var form = document.createElement("form");
      form.action = "ToReserveList?sCode=2&userId="+'${accessInfo}';
      form.method = "post";
      document.body.appendChild(form);
      form.submit();
   }
   function ToReviewList() {
      var form = document.createElement("form");
      form.action = "ToReviewList?sCode=3&userId="+'${accessInfo}';
      form.method = "post";
      document.body.appendChild(form);
      form.submit();
   }
   function ToZzimList() {
      var form = document.createElement("form");
      form.action = "ToZzimList?sCode=4&userId="+'${accessInfo}';
      form.method = "post";
      document.body.appendChild(form);
      form.submit();
   }
   function ToManageSpace() {
      var form = document.createElement("form");
      form.action = "ToManageSpace?sCode=5&userId="+'${accessInfo}';
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

</html>