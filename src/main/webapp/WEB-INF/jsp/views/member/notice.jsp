<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = session.getAttribute("memId").toString();
%>
	<c:set var="memId" value="<%=memId%>" />

<head>
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
              <h1 class="title-single">공지사항</h1>
              <span class="color-text-a">Notice</span>
            </div>
          </div>
          <c:if test="${memId eq 'admin' }">
          <div class="col-md-12 col-lg-4">
          	<input id="search-btn" type="button" value="글쓰기" onclick="location.href='/notice_write.do'" style="width: 25%;" />
          </div>
          </c:if>
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

			    <c:forEach var="notice" items="${list.content}">
				    <tr>
				      <td scope="col">${notice.notiSeq}</td>
				      <td scope="col">
				      	<a href="/notice_detail.do?notiSeq=${notice.notiSeq}">${notice.notiTitle}</a>
				      </td>
				      <td scope="col">
				      <c:if test="${notice.attachFile != null}">
				      <a href="#" data-toggle="popover-click" data-img="<img src='resources/assets/img/upload/notice/${notice.attachFile}'/>">
						<img src="/resources/assets/img/icon/file_icon.png" style="width: 25px;"/>
				      </a>
				      </c:if>
				      <c:if test="${notice.attachFile == null}">
				       -
				      </c:if>

				      </td>
				      <td scope="col">${notice.inDate}</td>
				      <td scope="col">${notice.notiHit}</td>
				    </tr>
			    </c:forEach>
			</table>
		<br/><br/>
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-end">
              <c:if test="${list.startPage > 5 }">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">
                    <span class="ion-ios-arrow-back"></span>
                  </a>
                </li>
                </c:if>

				<c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" >
					<c:if test="${list.currentPage eq pNo }">
						<li class="page-item active">
							<a href="/notice.do?pageNum=${pNo}" class="page-link">${pNo}</a>
						</li>
					</c:if>

					<c:if test="${list.currentPage ne pNo }">
						<li class="page-item">
							<a href="/notice.do?pageNum=${pNo}" class="page-link">${pNo}</a>
						</li>
					</c:if>


				</c:forEach>

				<c:if test="${list.endPage <  list.totalPages}">
	                <li class="page-item next">
	                  <a class="page-link" href="#">
	                    <span class="ion-ios-arrow-forward"></span>
	                  </a>
	                </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>

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

