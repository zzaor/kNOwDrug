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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
  <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
  <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/drug_info.css" rel="stylesheet">
<style>


body{margin-top:20px;}
.section-title {
    position: relative;
}
.section-title h2 {
    color: #1d2025;
    position: relative;
    margin: 0;
    font-size: 24px;
}
@media (min-width: 768px) {
    .section-title h2 {
        font-size: 28px;
    }
}
@media (min-width: 992px) {
    .section-title h2 {
        font-size: 34px;
    }
}
.section-title.title-ex1 h2 {
    padding-bottom: 20px;
}
@media (min-width: 768px) {
    .section-title.title-ex1 h2 {
        padding-bottom: 30px;
    }
}
@media (min-width: 992px) {
    .section-title.title-ex1 h2 {
        padding-bottom: 40px;
    }
}
.section-title.title-ex1 h2:before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 12px;
    width: 110px;
    height: 1px;
    background-color: #d6dbe2;
}
@media (min-width: 768px) {
    .section-title.title-ex1 h2:before {
        bottom: 17px;
    }
}
@media (min-width: 992px) {
    .section-title.title-ex1 h2:before {
        bottom: 25px;
    }
}
.section-title.title-ex1 h2:after {
    content: "";
    position: absolute;
    left: 0;
    bottom: 12px;
    width: 40px;
    height: 1px;
    background-color: #0cc652;
}
@media (min-width: 768px) {
    .section-title.title-ex1 h2:after {
        bottom: 17px;
    }
}
@media (min-width: 992px) {
    .section-title.title-ex1 h2:after {
        bottom: 25px;
    }
}
.section-title.title-ex1.text-center h2:before {
    left: 50%;
    transform: translateX(-50%);
}
.section-title.title-ex1.text-center h2:after {
    left: 50%;
    transform: translateX(-50%);
}
.section-title.title-ex1.text-right h2:before {
    left: auto;
    right: 0;
}
.section-title.title-ex1.text-right h2:after {
    left: auto;
    right: 0;
}
.section-title.title-ex1 p {
    font-family: "Montserrat", sans-serif;
    color: #8b8e93;
    font-size: 14px;
    font-weight: 300;
}


.price-card {
    background: #f5f5f6;
    padding: 19px 35px;
    position: relative;
    border-radius: 2px;
    overflow: hidden;
}
.price-card:before {
    position: absolute;
    content: "";
    top: 0;
    right: -35px;
    width: 88px;
    height: 88px;
    background: #0cc652;
    opacity: 0.2;
    border-radius: 8px;
    transform: rotate(45deg);
}
.price-card:after {
    position: absolute;
    content: "";
    top: 30px;
    right: -35px;
    width: 88px;
    height: 88px;
    background: #0cc652;
    opacity: 0.2;
    border-radius: 8px;
    transform: rotate(45deg);
}
.price-card h2 {
    font-size: 26px;
    font-weight: 600;
}
.price-card .btn {
    font-size: 11px;
    border-radius: 100px;
    padding: 0 25px;
    border: 0;
    color: #fff;
    float: right;
}
.price-card .btn.btn-primary {
    border: 0 !important;
}
.price-card.featured {
    background: #fff;
    border: 1px solid #ebebeb;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}
.price-card:hover .btn {
    background: #0cc652;
    border-color: #0cc652;
}
p.price span {
    display: inline-block;
    padding: 45px 15px 50px;
    padding-right: 0;
    font-size: 50px;
    font-weight: 600;
    color: #0cc652;
    position: relative;
}
p.price span:before {
    position: absolute;
    content: "$";
    font-size: 16px;
    top: 25px;
    font-weight: 300;
    left: 0;
}
.pricing-offers {
    padding: 0 0 10px;
}
.pricing-offers li {
    padding: 0 0 16px;
    line-height: 18px;
}
ul li {
    list-style-type: none;
}
.btn.btn-mid {
    height: 40px;
    line-height: 40px;
    padding: 0 20px;
}
#capture{
        overflow: hidden;
        width: 798px important!;
        height: 933x important!;
}


</style>
<script type="text/javascript">
	function fn_drugInfo(){
		var drugName = $("#drugName").val();
		if(drugName  == null || drugName ==""){
			alert("약의 이름을 입력해주세요!")
			return false
		}


		var param = "";
		param += "dummy=" + Math.random();
	    param += "&itemName=" + drugName;

		 $.ajax({
	         type: "post",
	         url: "/drugInfo.do",
	         dataType: "json",
	         data : param,
	         error: function (request, status, error) {
	        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         },
	         success: function (data) {
	        	 $("#title").css("display","block")

	        	 console.log(data)
	        	 console.log(data.data[0].itemName)

	        	 var len = data.data.length;

	        	 var output = "";
	        	 var output = "<br/><br/>";
	        	 var modalput ="";
	        	 console.log(len)


					output += "<div class='row'>"
	    			for( var i=0; i < len; i++){
		    			output += "	<div class='col-md-4'>"
						output += "		<div class='price-card featured' style='height:400px; margin-bottom:3%;'>"
						output += "			<div style='width:278px;height:90px;font-size:18px;'>"+data.data[i].itemName+"</div>"
						output += "			<div style='width:278px;height:25px;'>"+data.data[i].entpName+"</div>"
								if(data.data[i].itemImage == null || data.data[i].itemImage == ""){
						output += "			<div style='width:278px;height:150px;'><img src='/resources/assets/img/icon/nomedicine.png' style='width:270px; height:120px;'></div>"
								}else{
						output += "			<div style='width:278px;height:150px;'><img src='"+data.data[i].itemImage+"' style='width:270px'></div>"
								}
						output += "			<p></p><br/>";
						output += "			<div class='row'><div class='col' style='text-align:center;'><a href='#druginfo_"+i+"' data-toggle='modal' class='result-btn'>복약안내문</a></div></div>";
						output += "		</div>";
						output += "</div>";

						if(len%3==0){
							output +="<div class='w-100'></div>"
						}
		    		}
					output += "</div>"

	       			$("#resBody").html(output);

	       			for( var i=0; i < len; i++){
						modalput += "<div class='modal fade' id='druginfo_"+i+"' tabindex='-1' role='dialog' aria-labelledby='' aria-hidden='true' style='text-align:center'>"
						modalput += "	<div class='modal-dialog modal-lg' role='document'>"
						modalput += "		<div class='modal-content txt-ct'>"
						modalput += "			<div id='capture'>"
						modalput += "				<div class='modal-header'>"
						modalput += "					<h5 class='modal-title'><b>복약정보</b></h5>"
						modalput += "					<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
						modalput += "						<span aria-hidden='true'>&times;</span>"
						modalput += "					</button>"
						modalput += "				</div>"
						modalput += "				<div class='modal-body'>"
						modalput += "					<div class='container'>"

						modalput += "						<div class='row'>"
						modalput += "							<div class='col-7'>"
						modalput += "								<div class='row mtitle'>"
						modalput += "									<div class='col' style='height:37px; padding:1.5%'>제품명</div>"
						modalput += "								</div>"
						modalput += "								<div class='row'>"
						modalput += "						 			<div class='col' style='margin:2%;'><b>"+data.data[i].itemName+"</b></div>"
						modalput += "								</div>"
						modalput += "								<div class='row mtitle'>"
						modalput += "									<div class='col' style='height:37px; padding:1.5%'>제조/수입사</div>"
						modalput += "								</div>"
						modalput += "								<div class='row'>"
						modalput += "									<div class='col' style='margin:2%;'><b>"+data.data[i].entpName+"</b></div>"
						modalput += "								</div>"

						modalput += "							</div>"
						modalput += "							<div class='col'>"

						modalput += "								<img class='imgPlus' "

									       						if(data.data[i].itemImage == null || data.data[i].itemImage == ""){
						modalput += " 									src='/resources/assets/img/icon/nomedicine.png' style='width: 100%; height: 165px;'>"
									       						}else{
						modalput += "									src='"+data.data[i].itemImage+"' style='width: 100%; height: 100%;'>"
									       						}

						modalput += "							</div>"
						modalput += "						</div><br/>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col txt-ct mtitle'>효능</div>"
						modalput += "						</div>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col'>"+data.data[i].efcyQesitm+"</div>"
						modalput += "						</div><br/>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col txt-ct mtitle'>사용법</div>"
						modalput += "						</div>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col'>"+data.data[i].useMethodQesitm+"</div>"
						modalput += "						</div><br/>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col txt-ct mtitle'>복용주의사항</div>"
						modalput += "						</div>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col'>"+data.data[i].atpnQesitm+"</div>"
						modalput += "						</div><br/>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col txt-ct mtitle'>복용법</div>"
						modalput += "						</div>"
						modalput += "						<div class='row'>"
						modalput += "							<div class='col'>"+data.data[i].depositMethodQesitm+"</div>"
						modalput += "						</div>"
						modalput += "					</div>"
						modalput += "				</div>"
						modalput += "			</div>"
						modalput += "			<div class='modal-footer'>"
						modalput += "				<button type='button' class='search-btn' data-dismiss='modal'>닫기</button>"
						modalput += "				<button type='button' class='search-btn' onclick='imgfn("+i+")'>저장</button>"
						modalput += "			</div>"
						modalput += "		</div>"
						modalput += "	</div>"
						modalput += "</div>"
	       			}
		    	    $("#resModal").html(modalput);
	         }
	     });
	}

   function imgfn(i){
      function saveAs(uri, fileName) {
         const link = document.createElement("a");
         link.href = uri;
         link.download = fileName;

         document.body.appendChild(link);

         link.click();

         document.body.removeChild(link);
      }
      html2canvas(document.querySelector("#capture")).then(canvas => {
          saveAs(canvas.toDataURL(), 'fileName.jpg');
          
      });
	}


</script>
</head>
<body class="sebang">


  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">의약품 복약정보</h1>
              <span class="color-text-a">Medication Guide</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
   		<div class="container">
			<div class="row">
				<div class="col" style="text-align: center">
					<img src="/resources/assets/img/icon/question.png" style="height: 55%"/>
					<br/><br/>
					<p style="font-size: 22px">복약 정보가 궁금한 약의 이름을 입력해주세요 !</p>
					<br/>
					<input type="text" class="search-input" name="drugName" id="drugName" >
					<br/>
	      			<div class="search_btn">
	      				<button type="button" onclick='return fn_drugInfo()' class="search-btn" style="width: 15%; height: 40px;">복약안내문 보기</button>
	      			</div>
				</div>
			</div>
			<br/>
		</div>
    </section>


	<section class="pricing-section">
	    <div class="container">
			<div class="row justify-content-md-center">
				<div class="col-xl-5 col-lg-6 col-md-8">
					<div class="section-title text-center title-ex1" id="title" style="display:none;">
						<h2>복약안내문</h2>
						<p>Inventore cillum soluta inceptos eos platea, soluta class laoreet repellendus imperdiet optio.</p>
					</div>
				</div>
			</div>
			<!-- Pricing Table starts -->

			<div id="resBody"></div>
		</div>
	</section>

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

