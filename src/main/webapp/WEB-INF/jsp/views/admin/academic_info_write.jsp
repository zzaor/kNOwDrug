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
	String academicSeq = request.getParameter("academicSeq");
%>
<c:set var="academicSeq" value="<%=academicSeq %>"/>

<script type="text/javascript">


</script>

<body class="sebang">


  <main id="main">
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h2>학술정보 등록</h2>
              <span class="color-text-a">Academic Infomation</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->



<form method="post" action="academic_info_write.do" enctype="multipart/form-data">
	<section class="testimonial-area testimonial-padding section-bg3" style="height:590px;">
		<div class="container" style="max-width: 900px;">
    		<div class="row justify-content-between">
        		<div class="col-xl-12" >
					<div class="section-top-border">
						<div class="row">
							<div class="col-2" style="margin-top:10px;">
								제목
							</div>
							<div class="col-4">
								<input type="text" id="" name="academicTitle" placeholder="학술정보 제목" class="search-input" required>
							</div>
						</div>
						<div class="row">
							<div class="col-2" style="margin-top:10px;">
								작성자
							</div>
							<div class="col-4" style="margin-top:10px;">
								관리자
							</div>
							<div class="col-2" style="margin-top:10px;">
								작성일
							</div>
							<div class="col-4" style="margin-top:10px;">
							<script>document.write(new Date().getFullYear());</script>-0<script>document.write(new Date().getMonth()+1);
                       		</script>-0<script>document.write(new Date().getDate());</script>
							</div>
						</div>

						<div class="row" style="padding : 40px 0px 40px 0px;">
							<div class="col-2" style="margin-top:10px;">
								첨부파일
							</div>
							<div class="col-4" style="margin-top:10px;">
								<input type="file"  name="attachFile" multiple required/>
							</div>
						</div>


						<div class="card-footer" style="text-align:  right;">
	                    	<button class="search-btn" type="submit" >등록</button>
		  					<button class="search-btn" type="button" onclick="history.back()">취소</button>
		                </div>
					</div>
				</div>
    		</div>
		</div>
	</section>
</form>

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

