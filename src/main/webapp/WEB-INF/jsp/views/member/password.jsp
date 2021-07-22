<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/mypage.css" rel="stylesheet">

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function fn_sendmail(){
	alert("이메일전송");
	var memId = $('#memId').val();
	var memName = $('#memName').val();
	
	var param = "";
	param += "dummy=" + Math.random();
	param += "&memId=" + memId;
	param += "&memName=" + memName;
	
	
	$.ajax({
		url : "/sendEmail.do",
		data : param,
		dataType : "json",
		type : "get",
		success : function(data) {
			if (data != null) {
				console.log(data.mem_id);
				alert("이메일로 임시 비밀번호가 전송되었습니다.");
			} else {
				alert("존재하지 않는 아이디입니다.");
			}
		}
	});
}

</script>
</head>
<body class="sebang">


  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single" style="padding: 8% 0% 0% 0%">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">비밀번호 찾기</h1>
              <span class="color-text-a">Find Password</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
<section class="property-grid grid">
	<div class="container" >
			<div class="card o-hidden border-0 shadow-lg my-5" >
		    	<div class="card-body p-0" id="mypage" style="height: 660px;">
		        <!-- Nested Row within Card Body -->
		        	<div class="row">
		            	<div class="col-lg-5" style="text-align: center; padding-top: 13%; padding-left: 9%;">
		                	<img alt="" src="resources/assets/img/icon/password.png" style="width: 350px;">
		                </div>
		                <div class="col-lg-7">
		                    <div class="p-5" style="margin-top: 25%;">
		                        <div style="margin: 10px;">
									<label style="font-weight: bold; font-size: 1.2em;" > 이름과 비밀번호를 찾고자 하는 아이디(이메일)를 입력해주세요</label>
								</div>
								<div class="form-group row">
		                            <div class="col-sm-2">
		                            	<label style="margin-top: 10px;">이름</label>
		                            </div>
		                            <div class="col-sm-8" >
		                            	<input type="text" class="search-input" id="memName" name="memName" placeholder="이름" required>
		                        	</div>
		                        </div>
								<div class="form-group row">
									<div class="col-sm-2">
			                        	<label style="margin-top: 10px;">이메일</label>
			                        </div>
			                        <div class="col-sm-8" >
		                            	<input type="text" class="search-input" id="memId" name="memId" placeholder="piano10219@nate.com" required>
		                        	</div>
		                        </div>
								<div class="form-group row" style="margin-top: 7%;">
			                        <div class="col-sm-4" style="margin-left: 60px;">
			                        	<button type="button" class="search-btn" style="width:100%; border-radius: 2rem;" onclick="fn_sendmail()">이메일전송</button>
			                        </div>
									<div class="col-sm-4">
			                        	<button type="button" class="search-btn" style="width:100%; border-radius: 2rem; "onclick="location.href='/main.do'">뒤로가기</button>
			                    	</div>
		                    	</div>
		                	</div>
		            	</div>
		        	</div>
		    	</div>
			</div>
	</div>
</section>
    <!-- End Property Grid Single-->




	

  </main><!-- End #main -->

<br/><br/><br/><br/><br/>
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

