<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/join.css" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

    <script type="text/javascript">

    	function idDuplCheck(){
    		var memId = $("#memId").val();
    		if(memId == null || memId == ""){
    			alert("아이디를 입력하세요.")
    			return false;
    		}

    		var param = "";
    	    param += "dummy=" + Math.random();
		    param += "&memId=" + memId;

   			$.ajax({
  		         type: "get",
  		         url: "/idDuplCheck.do",
  		         dataType: "json",
  		         data: param,
  		         error: function (request, status, error) {
  		        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  		         },
  		         success: function (data) {
  		        	if(data == 1){
  		        		alert("사용 할 수 없는 아이디입니다. 다시 입력해주세요.")
  		        	}else{
  		        		alert("사용 가능한 아이디입니다.")
  		        	}
  		         }
  		     });
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


	    $(function(){
	        $('#memPwd').keyup(function(){
	          $('#pwdCheck').html('');
	        });

	        $('#memPwdChk').keyup(function(){
	        	console.log($('#mem').val())
	        	console.log($('#memPwdChk').val())

	            if($('#mem').val() != $('#memPwdChk').val()){
	              $('#pwdCheck').html('비밀번호 일치하지 않음');
	              $('#pwdCheck').attr('color', '#f82a2aa3');
	            } else{
	              $('#pwdCheck').html('비밀번호 일치함');
	              $('#pwdCheck').attr('color', '#199894b3');
	            }

	        });

		    var autoHypenPhone = function(str){
		        str = str.replace(/[^0-9]/g, '');
		        var tmp = '';
		        if( str.length < 4){
		            return str;
		        }else if(str.length < 7){
		            tmp += str.substr(0, 3);
		            tmp += '-';
		            tmp += str.substr(3);
		            return tmp;
		        }else if(str.length < 11){
		            tmp += str.substr(0, 3);
		            tmp += '-';
		            tmp += str.substr(3, 3);
		            tmp += '-';
		            tmp += str.substr(6);
		            return tmp;
		        }else{
		            tmp += str.substr(0, 3);
		            tmp += '-';
		            tmp += str.substr(3, 4);
		            tmp += '-';
		            tmp += str.substr(7);
		            return tmp;
		        }
		        return str;
		  	}


		  	var memTel = document.getElementById('memTel');

		  	memTel.onkeyup = function(){
		    	this.value = autoHypenPhone( this.value ) ;
		  	}
	    });
    </script>
</head>
<body class="sebang">


  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single" style="padding-top: 8%; padding-bottom: 0%;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">회원가입</h1>
              <span class="color-text-a">Sign Up</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
		<div class="container">
		    <div class="card o-hidden border-0 shadow-lg my-5">
		        <div class="card-body p-0">
		            <!-- Nested Row within Card Body -->
		            <div class="row">
		                <div class="col-lg-5" style="text-align: center; padding-top: 150px; padding-left: 77px;">
		                	<img alt="" src="resources/assets/img/icon/join_logo.png" style="width: 400px;">
		                </div>
		                <div class="col-lg-7">
		                    <div class="p-5">
		                        <form action="/join.do" method="post">
		                            <div class="form-group">
		                                <input type="text" class="search-input w-100" name="memName" id="memName" placeholder="이름" required>
		                            </div>
		                            <div class="form-group row">
		                                <div class="col">
		                                    <input type="email" class="search-input w-100" name="memId" id="memId" placeholder="아이디 (이메일 )" required>

		                                    <button type="button" class="search-btn" style="width: 27%; position:absolute; right: 5px; top: -13px; height: 47px;"onclick="idDuplCheck()">
		                                    	아이디 중복 확인
		                                    </button>
		                                </div>
		                            </div>
		                            <div class="form-group row">
		                                <div class="col-sm-6 mb-3 mb-sm-0">
		                                    <input type="password" class="search-input" id="mem" name="memPwd" placeholder="비밀번호" required>
		                                </div>
		                                <div class="col-sm-6">
		                                    <input type="password" class="search-input" id="memPwdChk" name="memPwdChk" placeholder="비밀번호 확인" required style="margin-bottom: 4%;">
		                                    &nbsp;&nbsp;<font id="pwdCheck" size="3"></font>
		                                </div>
		                            </div>

		                            <hr>
		                             <div class="form-group row">
		                                <div class="col-sm-6 mb-3 mb-sm-0">
		                                    <input type="date" class="search-input w-100" name="memBirth"  required>
		                                    <span class="badge badge-pill"></span>
		                                </div>

		                                <div class="col-sm-6 mb-3 mb-sm-0">
		                                    <input type="tel" class="search-input" name="memTel" id="memTel" placeholder="연락처" maxlength="13" required>
		                                    <span class="badge badge-pill"></span>
		                                </div>
		                            </div>

		                            <hr>

		                            <div class="form-group row">
		                                <div class="col-sm-6 mb-3 mb-sm-0">
		                                	<input type="text" class="search-input" name="memZip" placeholder="우편번호" required>
		                                </div>
		                                <div class="col-4">
		                                    <button type="button" class="search-btn" onclick="openZipSearch()" style="width:116px; position: absolute; right: 138px; top: -4px; height: 46px;">
		                                      	주소검색
		                                      </button>
		                                </div>
		                            </div>
									<div class="form-group">
		                                <input type="text" class="search-input w-100" name="memAddr1" placeholder="주소" required readonly>
		                            </div>
		                            <div class="form-group">
		                                <input type="text" class="search-input w-100" name="memAddr2" placeholder="상세주소" required>
		                            </div>
		                            <button type="submit" id="submit" class="search-btn w-100">회원가입</button>
		                        </form>
		                        <hr>
		                        <div class="text-center">
		                            <a href="/findPwd.do">비밀번호 찾기</a>
		                        </div>
		                        <div class="text-center">
		                            <a href="/main.do">메인으로</a>
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

