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
  <link href="/resources/assets/css/board.css?after" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
function fn_chk(){
	var varSelOpt = document.getElementById("selOpt").value;
	var varKeyword = document.getElementById("keyword").value;

	if(varKeyword == null || varKeyword == ""){
		alert("검색어를 입력하세요.")
	}

}

$(function () {
	$('[data-toggle="popover-click"]').popover({
      html: true,
      trigger: 'click',
      placement: 'bottom',
      content: function () { return  $(this).data('img'); }
    });
})
</script>
<style>
.popover-body img{
    max-width:250px !important;
}
</style>

</head>
<body class="sebang">
  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">자유게시판</h1>
              <span class="color-text-a">Community</span>
            </div>
          </div>
          <div class="col-md-12 col-lg-4">
          	<input id="search-btn" type="button" value="글쓰기" onclick="location.href='/board_write.do'" style="width: 25%;" />
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row mg-tb3">
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
                <input type="text" class="search" id="keyword" placeholder='검색어를 입력하세요.' id="keyword" name="keyword" />
                <input type="submit" class="search" id="search-btn" value="검색"  value="Search"/>
              </form>
            </div>
          </div>
        </div>
			<table class="table table-hover">
			    <tr>
			      <th scope="col">No</th>
			      <th scope="col">제목</th>
			      <th scope="col">첨부파일</th>
			      <th scope="col">작성일</th>
			      <th scope="col">조회수</th>
			    </tr>

			    <c:forEach var="list" items="${boardlist.content}" varStatus="status">
				    <tr>
				      <td scope="col">${list.boardSeq}</td>
				      <td scope="col">
				      	<a href="/board_detail.do?boardSeq=${list.boardSeq}">${list.boardTitle}</a>
				      </td>
				      <td scope="col">
				      <c:if test="${list.attachFile != null}">
				     <a href="#" data-toggle="popover-click" data-img="<img src='resources/assets/img/upload/board/${list.attachFile}'/>">
						<img src="/resources/assets/img/icon/file_icon.png" style="width: 25px;"/>
				      </c:if>
				      <c:if test="${list.attachFile == null}">
				      -
				      </c:if>

				      </td>
				      <td scope="col">${list.inDate}</td>
				      <td scope="col">${list.boardHit}</td>
				    </tr>
			    </c:forEach>
			</table>
			<br/><br/>
		<c:if test="${boardlist.hasArticles()}">
	        <div class="row">
	          <div class="col-sm-12">
	            <nav class="pagination-a">
	              <ul class="pagination justify-content-end">
	              <c:if test="${boardlist.startPage > 5 }">
	                <li class="page-item disabled">
	                  <a class="page-link" href="/board.do?pageNum=${boardlist.startPage - 5}" tabindex="-1">
	                    <span class="ion-ios-arrow-back"></span>
	                  </a>
	                </li>
	                </c:if>

					<c:forEach var="pNo" begin="${boardlist.startPage}" end="${boardlist.endPage}" >
						<c:if test="${boardlist.currentPage eq pNo }">
							<li class="page-item active">
								<a href="/board.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>

						<c:if test="${boardlist.currentPage ne pNo }">
							<li class="page-item">
								<a href="/board.do?pageNum=${pNo}" class="page-link">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${boardlist.endPage <  boardlist.totalPages}">
		                <li class="page-item next">
		                  <a class="page-link" href="/board.do?pageNum=${boardlist.startPage+5 }">
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

