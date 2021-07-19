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
  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=815248eb47a306fe880b3b368e6105a9&libraries=services"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/drug_info.css" rel="stylesheet">


<script type="text/javascript">

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
              <h1 class="title-single">약국 찾기</h1>
              <span class="color-text-a">Find a Pharmacy</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
		<div class="container" style="max-width: 1300px;">
			<div class="row">
				<div class="col">
				 	<img src="resources/assets/img/icon/pharmacy.png" alt="" style="width: 40%; margin-left:25%">
				 	<br/><br/>
				 	<p style="margin-left:17%;font-size: 18px">위치 정보가 궁금한 약국의 이름을 입력해주세요 ! </p>
				 	<br/>
				 	<input type="text" class="search-input" name="pharmacyName" id="pharmacyName" style="margin-left:23%">
				 	<br/><br/>
				 	<button type="button" onclick="fn_pharmSearch()" class="search-btn" style="margin-left:34%;width: 22%;">약국 찾기</button>
				</div>

				<div class="col">
					<div id="map" style="width:632px;height:400px;"></div>

				</div>
			</div>
		</div>
    </section>
    <!-- End Property Grid Single-->

<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	        center: new kakao.maps.LatLng(36.32542695404362, 127.42037609877455), // 지도의 중심좌표
	        level: 12 // 지도의 확대 레벨
	    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	function fn_pharmSearch(){
		var pharmacyName = $("#pharmacyName").val();
		if(pharmacyName  == null || pharmacyName ==""){
			alert("약국의 이름을 입력해주세요!")
			return false
		}

		var param = "";
		param += "dummy=" + Math.random();
	    param += "&pharmacyName=" + pharmacyName;

		 $.ajax({
	         type: "post",
	         url: "/pharmacySearch.do",
	         dataType: "json",
	         data : param,
	         error: function (request, status, error) {
	        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         },
	         success: function (data) {
	        	 $("#pharmacyName").val("");
	        	 console.log(data)
	        	 console.log(data.data[5])


	        	 var positions = [];

	        	 var location = [];
	        	 for(var i=0; i < data.data.length ; i++){
	        		 if(!data.data[i].XPos && !data.data[i].YPos){
	        			 continue;
	        		 }else{
	        			 location = {'title' : data.data[i].yadmNm, 'latlng' : new kakao.maps.LatLng(Number(data.data[i].YPos), Number(data.data[i].XPos))};
	        		 }
		        	 positions.push(location);
 	        	 }
	        	 console.log(positions)

				// 마커 이미지의 이미지 주소입니다

				for (var i = 0; i < positions.length; i ++) {

				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35);
				    var imageSrc = 'resources/assets/img/icon/pharmacy_icon.png', // 마커이미지의 주소입니다
				    imageSize = new kakao.maps.Size(50, 55), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)


				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지
					});
				}
	         }
	     });
	}




</script>


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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=815248eb47a306fe880b3b368e6105a9&libraries=services"></script>



</body>

