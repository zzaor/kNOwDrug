<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = session.getAttribute("memId").toString();
%>
	<c:set var="memId" value="<%=memId%>" />
<head>
  <title>EstateAgency Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/academic_info.css" rel="stylesheet">

<script type="text/javascript">

	function searchDetail(){
		window.open("/graphDetail.do", "PopupWin", "width=990,height=610")
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
              <h1 class="title-single">검색어 그래프</h1>
              <span class="color-text-a">Search Word Graph</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row">

          <c:forEach var="list" items="${dataList.content}">
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a" style="height: 350px;">
                <img src="/resources/assets/img/icon/graph_cover.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      	${list.itemName}
                    </h2>
                  </div>
                  <br/>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <a href="#" onclick="searchDetail()"><span class="price-a">보러가기</span></a>
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
                        <span>234</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">게시일</h4>
                        <span>32423</span>
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

	        <div class="row">
	          <div class="col-sm-12">
	            <nav class="pagination-a">
	              <ul class="pagination justify-content-end">
	              <c:if test="${dataList.startPage > 5 }">
	                <li class="page-item">
	                  <a class="page-link" href="/graph.do?pageNum=${dataList.startPage - 5}" tabindex="-1">
	                    <span class="ion-ios-arrow-back"></span>
	                  </a>
	                </li>
	                </c:if>

					<c:forEach var="pNo" begin="${dataList.startPage}" end="${dataList.endPage}" >
						<c:if test="${dataList.currentPage eq pNo}">
							<li class="page-item active">
								<a href="/graph.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>
						<c:if test="${dataList.currentPage ne pNo}">
							<li class="page-item">
								<a href="/graph.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${dataList.endPage <  dataList.totalPages}">
		                <li class="page-item next">
		                  <a class="page-link" href="/graph.do?pageNum=${dataList.startPage + 5 }">
		                    <span class="ion-ios-arrow-forward"></span>
		                  </a>
		                </li>
	                </c:if>

	              </ul>
	            </nav>
	          </div>
	        </div>

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

