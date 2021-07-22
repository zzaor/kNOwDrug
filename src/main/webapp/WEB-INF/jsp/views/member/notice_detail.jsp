<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memName = session.getAttribute("memName").toString();
	String memId = session.getAttribute("memId").toString();
%>
<c:set var="memId" value="<%=memId%>" />
<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/board_detail.css?after" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">



	function fn_ShowToggle(getParam){
		if(getParam =="board_detail"){
			$("#board_detail").css("display","none");
	  		$("#board_detail_modi").css("display","block");
	    }else{
			$("#board_detail").css("display","block");
	  		$("#board_detail_modi").css("display","none");
		}
	}


	function fn_fileDel(boardSeq){
		var boardSeq = boardSeq
		alert(boardSeq)

		var param = "";
		param += "dummy=" + Math.random();
		param += "&boardSeq=" + boardSeq;

		$.ajax({
			url : "/file_del.do",
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
					location.href="/board_detail.do?boardSeq="+boardSeq
				}else{
			  		alert("파일 삭제 도중 문제 발생");
				}
			}
		});

	}
</script>
</head>
<body class="sebang">
  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single" style="padding-bottom: 0px;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
            	<h2>${detail.notiTitle}</h2>
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
	   					${detail.inDate}
 					</div>
				</div>
			</div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->
    <!-- ======= Property Grid ======= -->
	<section class="testimonial-area testimonial-padding section-bg3" >
		<form method="post" action="deleteNoti.do" onsubmit="return confirm('공지사항을 삭제하시겠습니까?')">
		<input type="hidden" value="${detail.notiSeq}" name="notiSeq">
			<div id="board_detail">
    			<div class="container" >
        			<div class="row justify-content-between">
            			<div class="col-xl-12" >


	          			<div class="section-top-border" style="border-bottom: 1px dotted #eee; margin-left: 5%;">
	           				<div style="margin-left: 5%;">
									<br/>
		            				<p style="white-space: pre-line; font-size:20px;">${detail.notiContent}</p>
		            				<br/><br/>

		          				<div style="text-align: center;">
		            				<c:if test="${detail.attachFile != null}">
										<img src="resources/assets/img/upload/notice/${detail.attachFile}" alt="" style= "width: 600px; height: 500px; ">
									</c:if>
		          				</div>
	          				</div>
	        			</div>
	        		</div>
	        	</div>
    		</div>

	    	<div class="row" style="margin-top: 20px;">
	    		<div class="col" style="margin-right: 25%;">
	          		<input id="search-btn" type="button" value="목록" onclick="location.href='/notice.do'" style="width: 20%; height: 45px;" />
	            </div>
				<div class="col" style="text-align: right; margin-right: 19%;">
				<c:if test="${memId eq 'admin'}">
	         		<button id="search-btn1"  type="button" onclick="location.href='/notice_mod.do?notiSeq=${detail.notiSeq}'">수정</button>
	         		<button id="search-btn1" type="submit" >삭제</button>
	         	</c:if>
	      		</div>
	    	</div>

		</div>
	</form>

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

