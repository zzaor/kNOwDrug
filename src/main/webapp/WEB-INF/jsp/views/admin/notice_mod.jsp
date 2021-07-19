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
  <link href="/resources/assets/css/board_detail.css?after" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
function fn_fileDel(notiSeq){

	var param = "";
	param += "dummy=" + Math.random();
	param += "&notiSeq=" + notiSeq;

    $.ajax({
    	url : "/deleteFile.do",
      	data : param,
      	dataType : "json",
      	type : "post",
      	statusCode : {
        404 : function() {
        	alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
		}
	},
	success : function(data) {
    console.log(data)
   		if(data != null){
			alert("성공");
			location.href="/notice_mod.do?notiSeq="+notiSeq
    	}else{
      		alert("파일 삭제 도중 문제 발생");
    	}
	}
	});
}


	$(function() {

	   $('a.trigger').hover(function(e) {
	     $('div#pop-up').show();
	   }, function() {
	     $('div#pop-up').hide();
	   });
	});
</script>
<style>
 div#pop-up {
   display: none;
   position: absolute;
   width: 280px;
   padding: 10px;
   background: #eeeeee;
   top:26px;
   left: 68px;
 }
</style>
</head>
<body class="sebang">
  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h2>공지사항 수정</h2>
              <span class="color-text-a">Notice Modify</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
	<section class="testimonial-area testimonial-padding section-bg3" >
<div class="container">
<form method="post" action="notice_mod.do" enctype="multipart/form-data">
<input type="hidden" value="${detail.notiSeq}" name="notiSeq">
	<div class="row">
    	<div class="col-1">
			<p>제목</p>
		</div>
        <div class="col-md-6 mb-3">
        	<div class="form-group">
            	<input type="text" name="notiTitle" class="search-input w-100" value="${detail.notiTitle}"/>
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
        <div class="col-4">
        	<div class="form-group">
            	<input type="text"class="search-input" value="${detail.inDate}" readonly />
			</div>
		</div>
	</div>
	<div class="row">
        <div class="col">
        	<div class="form-group">
            	<textarea class="search-text" id="content" name="notiContent" style="height: 300px;">${detail.notiContent}</textarea>
			</div>
		</div>
	</div>
	<div class="row">
    	<div class="col-1">
			<p>첨부파일</p>
		</div>
        <div class="col-md-6 mb-3">
        	<div class="form-group">
            	<c:if test="${detail.attachFile != null}">
            		<input type="hidden" value="${detail.attachFile}" name="attachFile" />
		        	<a href="javascript:fn_fileDel(${detail.notiSeq})" class="trigger">
		        		${detail.attachFile}
		        	 	<img src="resources/assets/img/icon/trashbin.png" style="width: 30px; cursor:pointer;">
		        	 </a>
				    <div id="pop-up">
				       <img src="resources/assets/img/upload/notice/${detail.attachFile}" style="width: 260px;"/>
				    </div>
				</c:if>
				<c:if test="${detail.attachFile == null}">
		        	<input type="file" name="attachFile" accept="image/gif,image/jpeg,image/png"/>
		        </c:if>
			</div>
		</div>
	</div>


	<div class="row" >
		<div class="col" style="text-align:right;">
	    	<input type="submit" class="search-btnmod" value="수정완료" >
			<input type="button" class="search-btnmod" value="수정취소" onclick="history.back()">
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

