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
  <link href="/resources/assets/css/academic_info_detail.css" rel="stylesheet">


<%
	String academicSeq = request.getParameter("academicSeq");
%>
<c:set var="academicSeq" value="<%=academicSeq %>"/>

<script type="text/javascript">

	function fn_delFile(seq){
		var academicSeq = ${academicSeq}
		var file = $("input[name=attachFile]");

		var param = "";
		param += "dummy=" + Math.random();
		param += "&academicSeq=" + academicSeq;
		param += "&fileSeq=" + seq;

		if(file.length == 1){
			if(confirm("마지막 파일을 삭제하면 게시글도 삭제됩니다. 계속하시겠습니까?")==true){
				param += "&deleteInfo=Y"
			}
		}else{
			if(confirm("파일을 삭제하시겠습니까?")==true){
				param += "&deleteInfo=N"
			}
		}

	    $.ajax({
	    	url : "/academic_file_del.do",
	      	data : param,
	      	dataType : "json",
	      	type : "post",
	      	statusCode : {
	        404 : function() {
	        		alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
				}
			},
			success : function(data) {
	    		console.log(data)
	   			if(data.data == "fileDelete"){
	   				alert("파일을 삭제했습니다.")
					location.reload();
	    		}else{
	    			alert("게시글이 삭제됐습니다.")
      				location.href="/academic_info.do"
	    		}
			}
		});



	}


	function fn_addFile(){
		var fileForm = "<input type='file' name='attachFile' multiple accept='image/gif,image/jpeg,image/png'/>";
		$("#addFile").html(fileForm);
	}

</script>
</head>
<body class="sebang">


  <main id="main">
	<section class="testimonial-area testimonial-padding section-bg3 intro-single" >
    		<div class="container" style="max-width: 800px;">
			<div style="background: none;">
				<h3>학술정보 수정</h3>
			</div>
			<br/>
		<form method="post" action="academic_info_modi.do" enctype="multipart/form-data">
			<input type="hidden" name="academicSeq" value="${academicSeq}" />
    		<div class="row justify-content-between">
        		<div class="col-xl-12" >
					<div class="section-top-border">
						<div class="row">
							<div class="col-2" style="margin-top:10px;">
								제목
							</div>
							<div class="col-4">
								<input type="text" id="" name="academicTitle" value="${info[0].academicTitle}" class="search-input" required>
							</div>
						</div>
						<div class="row">
							<div class="col-2" style="margin-top:10px;">
								작성자
							</div>
							<div class="col-4" style="margin-top:10px;">
								관리자
							</div>
							<div class="col-2" style="margin-top:10px;">
								작성일
							</div>
							<div class="col-4" style="margin-top:10px;">
								${info[0].inDate}
							</div>
						</div>

						<div class="row" style="padding : 10px 0px 10px 0px;">
							<div class="col-4" style="margin-top:10px;">
								첨부파일 목록
							</div>
							<div class="col" style="margin-top:10px; text-align: right">
								<input type="button" onclick="fn_addFile()" value="파일추가"/>
							</div>
						</div>

						<c:forEach var="info" items="${info}" varStatus="status">
						<input type="hidden" name="attachFile" />
						<div class="row" style="padding : 10px 0px 10px 0px;">

							<c:if test="${info.attachFile ne null}">

								<div class="col" style="margin-top:10px; padding-left: 5%;">
									<img name="attachFile" src="resources/assets/img/upload/academicInfo/${info.attachFile}"  data-toggle="modal" data-target="#imgModal_${status.count}" style="width:100px;cursor:pointer;"/>
									&nbsp;&nbsp;&nbsp;${info.attachFile}
								</div>
								<div class="col-2" style="margin-top:10px; padding-left: 10%;">
									<img src="resources/assets/img/icon/trashbin.png" style="width: 30px; cursor:pointer; margin-top:120%;" onclick="fn_delFile(${info.fileSeq})"/>
								</div>

							</c:if>

							<div id="imgModal_${status.count}" class="modal" style="overflow: hidden">
							  	<span class="close">&times;</span>
					         	<img  class="modal-content" id="" src="resources/assets/img/upload/academicInfo/${info.attachFile}"  style="height: 90%; margin-top: 2%; width: 650px; margin-left: 32%;"/>
							</div>

						</div>
						</c:forEach>
						<div class="row" style="padding : 10px 0px 10px 0px;">
							<div class="col" id="addFile" style="margin:10px 0px; padding-left: 5%;"></div>
						</div>
							<div class="card-footer" style="text-align: right;">
		                    	<button class="search-btn" type="submit" >수정</button>
			  					<button class="search-btn" type="button" onclick="location.href='/academic_info_detail.do?academicSeq=${academicSeq}'">취소</button>
			                </div>
						</div>
					</div>
    			</div>
			</form>
		</div>
	</section><!-- End Property Grid Single-->

  </main><!-- End #main -->

<br/><br/><br/>
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

