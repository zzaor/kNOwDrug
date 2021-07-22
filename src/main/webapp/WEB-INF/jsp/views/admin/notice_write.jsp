<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memName = session.getAttribute("memName").toString();
%>
<c:set var="memName" value="<%=memName%>"></c:set>
<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/board_detail.css?after" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
function fn_search(){

	var title =$('#title').val();
	var content=$('#content').val();
	if(title == null || title ==""){
		alert("제목을 입력해주세요");
		return false;
	}
	if(content== null || content ==""){
		alert(" 내용을 입력해주세요");
		return false;
	}
}</script>
</head>
<body class="sebang">
  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h2>공지사항 등록</h2>
              <span class="color-text-a">Notice Registration</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
	<section class="testimonial-area testimonial-padding section-bg3" >
<div class="container">
<form method="post" action="notice_write.do" enctype="multipart/form-data" onsubmit="return fn_search()">
	<div class="row">
    	<div class="col-1">
			<p>제목</p>
		</div>
        <div class="col-md-6 mb-3">
        	<div class="form-group">
            	<input type="text" id="title" name="notiTitle" class="search-input w-100" placeholder="공지사항 제목" />
			</div>
		</div>
	</div>
    <div class="row">
    	<div class="col-1">
			<p>작성자</p>
		</div>
        <div class="col-md-6 mb-3">
        	<div class="form-group">
            	관리자
			</div>
		</div>
    	<div class="col-1">
			<p>작성일</p>
		</div>
        <div class="col-3">
        	<div class="form-group">
            	<script>document.write(new Date().getFullYear());</script>-0<script>document.write(new Date().getMonth()+1);
				</script>-0<script>document.write(new Date().getDate());</script>
			</div>
		</div>
	</div>
	<div class="row">
        <div class="col">
        	<div class="form-group">
            	<textarea class="search-text" id="content" name="notiContent" placeholder="   공지사항 내용" style="height: 300px;"></textarea>
			</div>
		</div>
	</div>
	<div class="row">
    	<div class="col-1">
			<p>첨부파일</p>
		</div>
        <div class="col-md-6 mb-3">
        	<div class="form-group">
            	<input type="file" name="attachFile" accept="image/gif,image/jpeg,image/png"/>
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="col" style="text-align:right;">
	    	<input type="submit" class="search-btn" value="등록">
			<input type="button" class="search-btn" value="취소" onclick="history.back()">
		</div>
	</div>
</form>
</div>

	</section>

  </main><!-- End #main -->

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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
  <script src="/resources/assets/js/main.js"></script>

</body>

