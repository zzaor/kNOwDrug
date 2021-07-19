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
 <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

</head>

<body>

  <!-- ======= memberToggler Section ======= -->
<div class="click-closed"></div>

  <!-- End Property Search Section -->


  <!-- ======= Intro Section ======= -->
  <div class="intro intro-carousel">
    <div id="carousel" class="owl-carousel owl-theme">
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(/resources/assets/img/main/slide01.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">Knowing Well Drug,
                      <br> No Drug
                    </p>
                    <h1 class="intro-title mb-4">
                    	<span>Advanced</span><br/>
                      <span class="color-b">Drug  </span>Search
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="/medi_search.do"><span class="price-a">Go Search !</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(/resources/assets/img/main/slide02.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">How to Take Your
                      <br> Medicines Correctly
                    </p>
                    <h1 class="intro-title mb-4">
                      <span> Medication </span>
                      <br><span class="color-b"> guide</span>
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="/drug_info.do"><span class="price-a">Go Search !</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(/resources/assets/img/main/slide03.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">Find the nearest
                      <br> pharmacy!
                    </p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b"> Find </span>
                      <br> A Pharmacy
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="/find_pharmacy.do"><span class="price-a">Go Find !</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><!-- End Intro Section -->

  <main id="main">

    <!-- ======= Services Section ======= -->

    <br/><br/><br/>
    <section id="services" class="services" style="margin-bottom: 10%;">
      <div class="container">
        <div class="section-title">
          <h1>Our Services</h1>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

	<c:if test="${member.memId ne 'admin'}">
        <div class="row sebang">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/icon01.png" style="width: 80%;"/>
              </div>
              <h4><a href="/medi_search.do">의약품 검색</a></h4>
              <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/icon02.png" style="width: 80%;"/>
              </div>
              <h4><a href="/drug_info.do">복약 정보 검색</a></h4>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/icon03.png" style="width: 80%;"/>
			  </div>
              <h4><a href="/academic_info.do">학술 정보 검색</a></h4>
              <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
            </div>
          </div>
        </div>
	</c:if>
		<c:if test="${member.memId eq 'admin'}">
		<div class="row sebang">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/main_admin01.png" style="width: 80%;"/>
              </div>
              <h4><a href="/memberList.do">회원관리</a></h4>
              <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/main_admin02.png" style="width: 80%;"/>
              </div>
              <h4><a href="/notice.do">공지사항 관리</a></h4>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon">
              	<img src="/resources/assets/img/main/main_admin03.png" style="width: 80%;"/>
			  </div>
              <h4><a href="/academic_info.do">학술정보 관리</a></h4>
              <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
            </div>
          </div>
        </div>
	</c:if>

      </div>
    </section>
  </main><!-- End #main -->


  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<!--   <div id="preloader"></div> -->

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/resources/assets/vendor/scrollreveal/scrollreveal.min.js"></script>

</body>
