<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>EstateAgency Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->

  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/academic_info_detail.css" rel="stylesheet">


<%
	String memId = session.getAttribute("memId").toString();
	String academicSeq = request.getParameter("academicSeq");
%>
<c:set var="academicSeq" value="<%=academicSeq %>"/>
<c:set var="memId" value="<%=memId %>"/>

<script type="text/javascript">

	function fn_deleteInfo(){
		var academicSeq = ${academicSeq};

		var param = "";
		param += "dummy=" + Math.random();
		param += "&academicSeq=" + academicSeq;

		if(confirm("학술정보를 삭제하시겠습니까?") == true){

			$.ajax({
				url : "/academic_info_del.do",
				data : param,
				dataType : "json",
				type : "post",
				statusCode : {
					404 : function(){
						alert("네트워크가 불안정합니다. 다시 시도 부탁드립니다.")
					}
				},
				success : function (data){
					console.log(data)

					if(data != null){
						alert("학술정보 삭제에 성공했습니다.");
						location.href="/academic_info.do"
					}else{
						alert("학술정보 삭제 도중 문제가 발생했습니다.")
					}
				}
			});

		}else{
			return false;
		}
	}


</script>

<body class="sebang">


  <main id="main">
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h2>${info[0].academicTitle}</h2>
		        <div class="row">
					<div class="col-2" style="margin-top:10px;">
						작성자
					</div>
					<div class="col-3" style="margin-top:10px;">
						관리자
					</div>
					<div class="col-2" style="margin-top:10px;">
						작성일
					</div>
					<div class="col-3" style="margin-top:10px;">
						${info[0].inDate}
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->



	<section class="testimonial-area testimonial-padding section-bg3" >
		<div class="container">
    		<div class="row justify-content-between">
        		<div class="col-xl-12" >

				</div>
			</div>

			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner txt-cnt">
					<c:forEach var="info2" items="${info}" varStatus="st">
				  		<c:if test="${st.index eq 0}">
						    <div class="carousel-item active" style="padding-left: 17%;">
						      <img class="d-block" src="resources/assets/img/upload/academicInfo/${info2.attachFile}" style="width: 700px; height: 850px;" >
						    </div>
				  		</c:if>
				  		<c:if test="${st.index ne 0}">
					    	<div class="carousel-item" style="padding-left: 17%;">
					      	<img class="d-block" src="resources/assets/img/upload/academicInfo/${info2.attachFile}" style="width: 700px; height: 850px;"" >
					    	</div>
					    </c:if>
				    </c:forEach>
			  	</div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			<br/><br/>
			<div class="row">
				<div class="col">
					<input type="button" class="search-btn" value="목록" onclick="location.href='/academic_info.do'" style="margin-left: 33%; padding-left:3%"/>
				</div>
					<div class="col">
					<c:if test="${memId eq 'admin'}">
						<input type="button" class="search-btn" value="수정" onclick="location.href='/academic_info_modi.do?academicSeq=${academicSeq}'" style="margin-left: 34%; padding-left:3%"/>
						<input type="button" class="search-btn" value="삭제" onclick="fn_deleteInfo()" style="margin-left: 1%; padding-left:3%"/>
					</c:if>
					</div>
			</div>
      </div>
    </section><!-- End Property Grid Single-->

  </main><!-- End #main -->

<br/><br/><br/>
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<!--   <div id="preloader"></div> -->

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/resources/assets/vendor/scrollreveal/scrollreveal.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

