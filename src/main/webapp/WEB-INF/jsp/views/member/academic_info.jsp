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
  <link href="/resources/assets/css/academic_info.css" rel="stylesheet">


<script type="text/javascript">
	function fn_chk(){
		var varSelOpt = document.getElementById("selOpt").value;
		var varKeyword = document.getElementById("keyword").value;

		if(varKeyword == null || varKeyword == ""){
			alert("검색어를 입력하세요.")
		}

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
              <h1 class="title-single">학술정보</h1>
              <span class="color-text-a">Academic Infomation</span>
            </div>
          </div>
          <c:if test="${memId eq 'admin'}">
          <div class="col-md-12 col-lg-4">
            <input type="button" value="글쓰기" class="write-btn" onclick="location.href='/academic_info_write.do'" />
          </div>
          </c:if>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="grid-option search">
              <form method="get" onsubmit="return fn_chk()">
                <select class="custom-select" name="selOpt" id="selOpt">
                  <option value="" selected>전체</option>
                  <option value="title"
                  	<c:if test="${selOpt == 'title'}">selected</c:if>>
                  	제목
                  	</option>
                  <option value="inDate"
                  	<c:if test="${selOpt =='inDate'}">selected</c:if>>
                  	작성일
                  </option>
                </select>
                <input type="text" class="search-input" placeholder='검색어를 입력하세요.' id="keyword" name="keyword" />
                <input type="submit" class="search-btn" value="검색"  value="Search"/>
              </form>
            </div>
          </div>


          <c:forEach var="list" items="${academicList.content}">
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="/resources/assets/img/icon/academic_cover.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      ${list.academicTitle}
                    </h2>
                  </div>
                  <br/>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <a href="/academic_info_detail.do?academicSeq=${list.academicSeq}"><span class="price-a">보러가기</span></a>
                    </div>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">저자</h4>
                        <span>관리자</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>${list.academicHit}</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">게시일</h4>
                        <span>${list.inDate}</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>

		<br/>
		<c:if test="${academicList.hasArticles()}">
	        <div class="row">
	          <div class="col-sm-12">
	            <nav class="pagination-a">
	              <ul class="pagination justify-content-end">
	              <c:if test="${academicList.startPage > 5 }">
	                <li class="page-item disabled">
	                  <a class="page-link" href="/academic_info.do?pageNum=${academic_info.startPage - 5 }" tabindex="-1">
	                    <span class="ion-ios-arrow-back"></span>
	                  </a>
	                </li>
	                </c:if>

					<c:forEach var="pNo" begin="${academicList.startPage}" end="${academicList.endPage}" >
						<c:if test="${academicList.currentPage eq pNo}">
							<li class="page-item active">
								<a href="/academic_info.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>
						<c:if test="${academicList.currentPage ne pNo}">
							<li class="page-item">
								<a href="/academic_info.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${academicList.endPage <  academicList.totalPages}">
		                <li class="page-item next">
		                  <a class="page-link" href="/academic_info.do?pageNum=${academic_info.startPage + 5 }">
		                    <span class="ion-ios-arrow-forward"></span>
		                  </a>
		                </li>
	                </c:if>

	              </ul>
	            </nav>
	          </div>
	        </div>
        </c:if>
      </div>
    </section><!-- End Property Grid Single-->

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

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

