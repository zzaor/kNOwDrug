<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/board.css?after" rel="stylesheet">
  <script type="text/javascript">
  	function fn_activeN(){
  		if(confirm("해당 회원을 비활성화 하시겠습니까?")){
  			return true;
  		}else{
  			return false;
  		}
  	}

  	function fn_activeY(memId){
  		if(confirm("해당 회원을 활성화 하시겠습니까?")){
  			location.href="/memact_y.do?memId="+memId
  			return true;
  		}else{
  			return false;
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
              <h1 class="title-single">회원관리</h1>
              <span class="color-text-a">Membership Management</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
	<section class="property-grid grid">
    	<div class="container" style="text-align: center;">
			<table class="table table-hover">
				<tr>
			    	<th scope="col">No</th>
			      	<th scope="col">아이디</th>
				    <th scope="col">이름</th>
					<th scope="col">생년월일</th>
				    <th scope="col">전화번호</th>
				    <th scope="col">활동상태</th>
				</tr>
			    <c:forEach var="list" items="${memberList.content}">
					<tr>
				    	<td scope="col">${list.rnum-1}</td>
				      	<td scope="col">
				      		<a data-toggle="modal" data-target="#myModal_${list.rnum}" onclick="" style="cursor: pointer;"> ${list.memId}</a>
				      	</td>
						<td scope="col">${list.memName}</td>
					    <td scope="col">${list.memBirth}</td>
					    <td scope="col">${list.memTel}</td>
					    <td scope="col">${list.activeYn}</td>
				    </tr>
					<!-- The Modal -->
					<form action="/memberYn.do" method="post" onsubmit="return fn_activeN()">
						<div class="modal" id="myModal_${list.rnum}">
					    	<div class="modal-dialog ">
							<!-- Modal content-->
					      		<div class="modal-content">
								<!-- Modal Header -->
					        		<div class="modal-header">
					          			<h4 class="modal-title">회원 정보 수정</h4>
					        		</div>
								<!-- Modal body -->
					        	<div class="modal-body">
						        	<div class="form-group row">
										<div class="col-sm-3">
									    	<label for="mem_id">아이디</label>
									  	</div>
										<div class="col-sm-8">
											<input type="text" id="memId" name = memId class="search-input" value="${list.memId}" readonly >
										</div>
									</div>
						        	<div class="form-group row">
										<div class="col-sm-3">
											<label for="mem_name">이름</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="memName" name="memName" class="search-input"  value="${list.memName}" readonly>
										</div>
									</div>
							        <div class="form-group row">
										<div class="col-sm-3">
											<label for="">생일</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="memBirth" name="memBirth" class="search-input"  value="${list.memBirth}" readonly>
										</div>
									</div>
							        <div class="form-group row">
										<div class="col-sm-3">
											<label for="">전화번호</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="memTel" name="memTel" class="search-input"  value="${list.memTel}" readonly>
										</div>
									</div>
							        <div class="form-group row">
										<div class="col-sm-3">
											<label for="">주소</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="memAddr" name="memAddr" class="search-input" value="${list.memAddr1}" readonly>
										</div>
									</div>
							        <div class="form-group row">
										<div class="col-sm-3">
											<label for="">가입일</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="inDate" name="inDate" class="search-input" value="${list.inDate}" readonly>
										</div>
									</div>
							        <div class="form-group row">
										<div class="col-sm-3">
											<label for="">회원상태</label>
										</div>
										<div class="col-sm-8">
											<input type="text" id="activeYn" name="activeYn" class="search-input" value="${list.activeYn}" readonly>
										</div>
									</div>
						       	 	<div class="form-group row">
										<div class="col" id="memAct_btn" style="text-align: center;">
											<c:if test="${list.activeYn =='Y'}">
										 		<button class="search-btn" type="submit" >비활성화</button>
										 		<button id="modal" data-dismiss="modal" class="search-btn">취소</button>
											</c:if>
											<c:if test="${list.activeYn =='D'}">
										 		<button class="search-btn" type="button" onclick="fn_activeY('${list.memId}')">활성화</button>
										 		<button id="modal" data-dismiss="modal" class="search-btn" >취소</button>
											</c:if>
										</div>
									</div>
					        	</div>
					      	</div>
					    </div>
					  </div>
					</form>
			    </c:forEach>
			</table>

		<br/><br/>
        <c:if test="${memberList.hasArticles()}">
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-end">
              <c:if test="${memberList.startPage > 5 }">
                <li class="page-item">
                  <a class="page-link" href="/memberList.do?pageNum=${memberList.startPage-5}">
                    <span class="ion-ios-arrow-back"></span>
                  </a>
                </li>
                </c:if>

				<c:forEach var="pNo" begin="${memberList.startPage}" end="${memberList.endPage}" >
					<c:if test="${memberList.currentPage eq pNo }">
						<li class="page-item active">
							<a href="/memberList.do?pageNum=${pNo}" class="page-link">${pNo}</a>
						</li>
					</c:if>

					<c:if test="${memberList.currentPage ne pNo }">
						<li class="page-item">
							<a href="/memberList.do?pageNum=${pNo}" class="page-link">${pNo}</a>
						</li>
					</c:if>

				</c:forEach>

				<c:if test="${memberList.endPage <  memberList.totalPages}">
	                <li class="page-item next">
	                  <a class="page-link" href="/memberList.do?pageNum=${memberList.startPage+5}">
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

