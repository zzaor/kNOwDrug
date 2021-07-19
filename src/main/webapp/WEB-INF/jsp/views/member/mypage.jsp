<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = session.getAttribute("memId").toString();
%>
	<c:set var="memId" value="<%=memId%>" />
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
	function fn_ShowToggle(param){
		if(param =="mypage"){
			$("#mypage").css("display","none");
			$("#mypage_modi").css("display","block");

		}else{
			$("#mypage").css("display","block");
			$("#mypage_modi").css("display","none");

		}
	}

	function openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('input[name=memZip]').val(data.zonecode); // 우편번호 (5자리)
				$('input[name=memAddr1]').val(data.address);
				$('input[name=memAddr2]').val(data.buildingName);
			}
		}).open();
	}
</script>
</head>
<body class="sebang">


  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single" style="padding-top: 8%;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">마이페이지</h1>
              <span class="color-text-a">My Page</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
     <div class="container" >
    	<div class="card o-hidden border-0 shadow-lg" >
        <div class="card-body p-0" id="mypage">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5" style="text-align: center; padding-top: 10%; padding-left: 9%;">
                	<img alt="" src="/resources/assets/img/icon/mypage.png" style="width: 350px;">
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <br/>
                        <form class="" action=""  enctype="" name="">
                            <div class="form-group row">
                            	<div class="col-sm-2">
                            		<label style="margin-top: 10px;">이름</label>
                            	</div>
                            	<div class="col-sm-8">
                                	<input type="text" class="search-input" name="memName" value="${member.memName}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
	                            <div class="col-sm-2">
	                            	<label style="margin-top: 10px;">아이디</label>
	                            </div>
	                            <div class="col-sm-8">
                                	<input type="email" class="search-input" name="memId" value="${member.memId}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
	                            <div class="col-sm-2">
		                        	<label style="margin-top: 10px;">비밀번호</label>
		                       	</div>
		                       	<div class="col-sm-8">
	                                <input type="text" class="search-input" name="memPwd"  value="${member.memPwd}" readonly>
								</div>
                            </div>

                            <hr>
                            <div class="form-group row">
                            	<div class="col-sm-2">
                            		<label style="margin-top: 10px;">생년월일</label>
                            	</div>
                            	<div class="col-sm-8">
                                	<input type="text" class="search-input" name="memBirth" value="${member.memBirth}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                            <div class="col-sm-2">
                            	<label style="margin-top: 10px;">연락처</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" class="search-input" name="memTel" value="${member.memTel}" readonly>
                            </div>
                                <span class="badge badge-pill"></span>
                            </div>
                            <hr>
                            <div class="form-group row">
                            <div class="col-sm-2">
                            	<label style="margin-top: 10px;">주소</label>
                            </div>
                            <div class="col">
                            	<input type="text" class="search-input" name="memAddr" value="${member.memAddr1} ${member.memAddr2} ${memZip}" readonly style="width: 85%">
                            </div>
                            </div>
							<br/>
                            <div class="form-group row" style="padding-left: 10%">
	                            <div class="col-sm-4">
	                            	<button type="button" class="search-btn" style="width:100%; border-radius: 2rem;" onclick="fn_ShowToggle('mypage')">수정</button>
	                            </div>
	                            <div class="col-sm-4">
	                           		<button type="button" class="search-btn" data-toggle="modal" data-target="#changeActive" style="width:100%; border-radius: 2rem;">탈퇴</button>
	                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="changeActive" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  		<div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		        <form action="/changeActive.do", method="post">
			      <div class="modal-body">
			      	<p>탈퇴하시려는 아이디의 비밀번호를 입력해주세요.</p>
			          <div class="form-group">
			            <input type="text" id="memPwd" name="memPwd" class="search-input" >
			          </div>
			      </div>
			      <div class="modal-footer">
				        <button type="submit" class="search-btn" style="width: 16%;">탈퇴</button>
						<button type="button" class="search-btn" style="width: 16%;" data-dismiss="modal">취소</button>
			      </div>
			      </form>
			</div>
		</div>
	</div>






<!--수정폼시작 -->
     <div class="card o-hidden border-0 shadow-lg my-5" >
        <div class="card-body p-0" id="mypage_modi" style="display: none;">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5" style="text-align: center; padding-top: 200px; padding-left: 100px;">
                	<img alt="" src="resources/assets/img/icon/mypage.png" style="width: 350px;">
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center" >
                            <h3><b>내 정보 수정</b></h3>
                        </div>
                        <br/>
                        <form action="/mypage.do" method="post">
                            <div class="form-group row">
                            	<div class="col-sm-2">
                            		<label style="margin-top: 10px;">이름</label>
                            	</div>
                            	<div class="col-sm-8">
                                	<input type="text" class="search-input" name="memName" value="${member.memName}" style="width: 87%;">
                                </div>
                            </div>
                            <div class="form-group row">
	                            <div class="col-sm-2">
	                            	<label style="margin-top: 10px;">아이디</label>
	                            </div>
	                            <div class="col-sm-8">
                                	<input type="email" class="search-input" name="memId" value="${member.memId}" readonly style="width: 87%;">
                                </div>
                            </div>
                            <div class="form-group row">
	                            <div class="col-sm-2">
		                        	<label style="margin-top: 10px;">비밀번호</label>
		                       	</div>
		                       	<div class="col-sm-8">
	                                <input type="text" class="search-input" name="memPwd"  value="${member.memPwd}"  style="width: 87%;" readonly>
								</div>
                            </div>

                            <hr>
                            <div class="form-group row">
                            	<div class="col-sm-2">
                            		<label style="margin-top: 10px;">생년월일</label>
                            	</div>
                            	<div class="col-sm-8">
                                	<input type="date" class="search-input" name="memBirth" value="${member.memBirth}" style="width: 87%;">
                                </div>
                            </div>
                            <div class="form-group row">
	                            <div class="col-sm-2">
	                            	<label style="margin-top: 10px;">연락처</label>
	                            </div>
	                            <div class="col-sm-8">
	                                <input type="text" class="search-input" name="memTel" value="${member.memTel}"  style="width: 87%;">
	                            </div>
                            </div>


                            <hr>

                            <div class="form-group row">
	                            <div class="col-sm-2">
	                            	<label style="margin-top: 10px;">우편번호</label>
	                            </div>
                                <div class="col-sm-4">
                                	<input type="text" class="search-input" name="memZip" placeholder="우편번호" value="${member.memZip}" required>

                                </div>
                                <div class="col-4">
                                    <button type="button" onclick="openZipSearch()"
                                    class="search-btn" style="width:110px; height: 45px; margin: 0%;">
                                      	주소검색
                                      </button>
                                </div>
                            </div>
                            <div class="form-group row">
                             	<div class="col-sm-2">
	                            	<label style="margin-top: 10px;">주소</label>
	                            </div>
	                            <div class="col-sm-8">
	                                <input type="text" class="search-input" name="memAddr1" value="${member.memAddr1}" required style="width: 87%;">
	                            </div>
                           	</div>

                            <div class="form-group row">
                            	<div class="col-sm-2">
	                            	<label style="margin-top: 10px;">상세주소</label>
	                            </div>
	                            <div class="col-sm-8">
	                                <input type="text" class="search-input" name="memAddr2" value="${member.memAddr2}" required style="width: 87%;">
	                            </div>

                            </div>
                           <div class="form-group row" style="padding-left: 10%">
	                            <div class="col-sm-4">
	                            	<button type="submit" class="search-btn" style="width:100%; border-radius: 2rem;">완료</button>
	                            </div>
	                            <div class="col-sm-4">
	                           		<button type="button" class="search-btn" style="width:100%; border-radius: 2rem;" onclick="fn_ShowToggle('mypage_modi')">취소</button>
	                            </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
    </section>
    <!-- End Property Grid Single-->




	<div id="resModal"></div>

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

