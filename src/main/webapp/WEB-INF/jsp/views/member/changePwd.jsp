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
  <link href="/resources/assets/css/mypage.css" rel="stylesheet">

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function fn_changePwd(){
	
	var pwd = $('#pwd').val();
	var newPwd = $('#newPwd').val();
	var confPwd = $('#confPwd').val();
	if(confPwd != newPwd){
		alert("비밀번호가  다릅니다. 다시 입력해주세요");
		return false;
	}
	
	var param = "";
	param += "dummy=" + Math.random();
	param += "&pwd=" + pwd;
	param += "&newPwd=" + newPwd;
	
	
	$.ajax({
		url : "/changePwd.do",
		data : param,
		dataType : "json",
		type : "post",
		success : function(data) {
			console.log(data);
			if (data.data == "ok") {
				alert("비밀번호가 변경되었습니다");
				location.href="/main.do";
			} else {
				alert("존재하지 않는 비밀번호입니다.");
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
              <h1 class="title-single">비밀번호 변경</h1>
              <span class="color-text-a">Change Password</span>
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
		                	<img alt="" src="resources/assets/img/icon/changePwd.png" style="width: 350px;">
		                </div>
		                <div class="col-lg-7">
		                    <div class="p-5" style="margin-top: 22%;">
		                        <div style="margin: 10px;">
									<label style="font-weight: bold; font-size: 1.2em; margin-bottom: 7%;" > 현재 비밀번호와 변경하고자 하는 비밀번호를 입력해주세요</label>
								</div>
								<div class="form-group row" style="margin-top: 5%;">
		                            <div class="col-sm-3">
		                            	<label style="margin-top: 10px;">현재 비밀번호</label>
		                            </div>
		                            <div class="col-sm-8" >
		                            	<input type="text" id="pwd" name="pwd" class="search-input" placeholder="이름" required>
		                        	</div>
		                        </div>
								<div class="form-group row">
									<div class="col-sm-3">
			                        	<label style="margin-top: 10px;">새로운 비밀번호</label>
			                        </div>
			                        <div class="col-sm-8" >
		                            	<input type="text" name="newPwd" id="newPwd" class="search-input" placeholder="password" required>
		                        	</div>
		                        </div>
								<div class="form-group row">
									<div class="col-sm-3">
			                        	<label style="margin-top: 10px;">비밀번호 확인</label>
			                        </div>
			                        <div class="col-sm-8" >
		                            	<input type="text" id="confPwd" class="search-input" placeholder="password" required>
		                        	</div>
		                        </div>
								<div class="form-group row" style="margin-top: 7%;">
			                        <div class="col-sm-4" style="margin-left: 60px;">
			                        	<button type="button" class="search-btn" style="width:100%; border-radius: 2rem;" onclick="fn_changePwd()">변경</button>
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

