<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memName = session.getAttribute("memName").toString();
	String memId = session.getAttribute("memId").toString();
%>
<c:set var="memName" value="<%=memName%>" />
<c:set var="memId" value="<%=memId%>" />
<head>
  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/board_detail.css?after" rel="stylesheet">
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		showReply();
	});



	function fn_ShowToggle(getParam){
		if(getParam =="board_detail"){
			$("#board_detail").css("display","none");
	  		$("#board_detail_modi").css("display","block");
	    }else{
			$("#board_detail").css("display","block");
	  		$("#board_detail_modi").css("display","none");
		}
	}

		function fn_replyAdd(){
			var board_seq = '${detail.boardSeq}';
		  	var replyName = $('input[name=replyName]').val();
		  	var replyPwd = $('input[name=replyPwd]').val();
		  	var content = $('textarea[name=replyContent]').val();

		  	var param = "";
		  	param += "dummy=" + Math.random();
		   	param += "&boardSeq=" + board_seq;
		   	param += "&replyName=" + replyName;
		   	param += "&replyPwd=" + replyPwd;
			param += "&content=" + content;

		   	 $.ajax({
			    	url : "/reply_add.do",
			      	data : param,
			      	dataType : "json",
			      	type : "post",
			      	async : false,
			      	statusCode : {
			        404 : function() {
		        		alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
						}
					},
					success : function(data) {
			    	console.log(data)
		   			if(data != null){
						showReply();
		    		}else{
		      		alert("댓글 작성 도중 문제 발생");
		    		}
				}
			});
		}

	function showReply(){
		var boardSeq = '${detail.boardSeq}';
		var memId = '${detail.memId}';

		var param = "";
		param += "dummy=" + Math.random();
		param += "&boardSeq=" + boardSeq;
		param += "&memId=" + memId;

		$.ajax({
			url : "/reply_list.do",
		    data : param,
		    dataType : "json",
		    type : "post",
		    async : false,
		    statusCode : {
		    	404 : function() {
		        	alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
		        }
			},
		    	success : function(data) {
		        console.log(data.data)


		        if(data.data.length == 0){
		        	$('#replyRes').html("");
		        }

				var output = "";
		        for(i = 0; i < data.data.length; i++){
		        	console.log(data.data[i].replyName)
		            console.log(data.data.length)
		            var list = data.data[i]
		        	output += "<div class='container mt-5 mb-5' style='max-width:1000px;'>"
		        	output += "<div class='d-flex justify-content-center row'>"
		        	output += "<div class='col'>"
		        	output += "<div class='p-3 bg-white mt-2 rounded ' style='box-shadow : 0 1px 1px rgb(46 202 106 / 8%) inset, 0 0 8px rgb(46 202 106 / 60%)'>"
		        	output += "<div class='d-flex justify-content-between'>"
		        	output += "<div class='d-flex flex-row user'>"
		        	output += "<img class='rounded-circle img-fluid img-responsive' src='/resources/assets/img/icon/reply_icon.png' width='50'>"
		        	output += "<div class='d-flex flex-column' style='margin-left:12%; width:130px;'>"
		        	output += "<span class='font-weight-bold'>"+list.replyName+"</span><span class='day'>"+list.inDate+"</span>"
		        	output += "</div>"
		        	output += "</div>"
		        	output += "</div>"
		        	output += "</br>"
		        	output += "<div class='comment-text text-justify mt-2'>"
		        	output += "<p style='white-space : pre-line;'>"+ list.replyContent +"</p>"
		        	output += "</div>"
		        		if(list.replyName =='${memName}'){
		        	output += "<div class='d-flex justify-content-end align-items-center comment-buttons mt-2 text-right'>"
		        	output += "<button id='reply-btn' onclick='fn_replyDel("+list.replySeq+")'>삭제</button>"

		        	output += "</div>"
		        		}
		        	output += "</div>"
		        	output += "</div>"
		        	output += "</div>"
		        	output += "</div>"

		            $('#replyRes').html(output);
			        $('textarea[name=replyContent]').val("");
				}
			}
		});
	}

	function fn_replyDel(replySeq){
	  	alert(replySeq)
	    var boardSeq = '${detail.boardSeq}';
	    var replySeq = replySeq;

	    var param = "";
	    param += "dummy=" + Math.random();
	    param += "&boardSeq=" + boardSeq;
	    param += "&replySeq=" + replySeq;

	    $.ajax({
	    	url : "/reply_del.do",
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
	   			if(data != null){
					showReply();
	    		}else{
	      			alert("댓글 삭제 도중 문제 발생");
	    		}
			}
		});
	}

	function fn_fileDel(boardSeq){
		var boardSeq = boardSeq
		alert(boardSeq)

		var param = "";
		param += "dummy=" + Math.random();
		param += "&boardSeq=" + boardSeq;

		$.ajax({
			url : "/file_del.do",
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
				if(data != null){
				alert("성공");
				location.href="/board_detail.do?boardSeq="+boardSeq
			}else{
		  		alert("파일 삭제 도중 문제 발생");
			}
		}
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
              <h2>${detail.boardTitle}</h2>
              	<div class="row">
					<div class="col-2" style="margin-top:10px;">
						작성자
					</div>
					<div class="col-3" style="margin-top:10px;">
						${detail.memName}
 					</div>
 					<div class="col-2" style="margin-top:10px;">
	   					작성일
 					</div>
 					<div class="col-3" style="margin-top:10px;">
	   					${detail.inDate}
 					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
	<section class="testimonial-area testimonial-padding section-bg3" >
		<form method="post" action="/delete.do" onsubmit="return confirm('정말 삭제하시겠습니까?')">
		<input type="hidden" value="${detail.boardSeq}" name="boardSeq">
		<input type="hidden" value="${detail.memId}" name="memId">
			<div id="board_detail">
    			<div class="container" >
        			<div class="row justify-content-between">
            			<div class="col-xl-12" >
	          			<div class="section-top-border" style="border-bottom: 1px dotted #eee; margin-left: 5%;">
	           				<div style="margin-left: 5%;">
		          				<div>
									<br/>
		            				<p style="white-space: pre-line; font-size: 20px;" >${detail.boardContent}</p>
		            				<br/><br/>
		            				<c:if test="${detail.attachFile != null}">
										<img src="resources/assets/img/upload/board/${detail.attachFile}" alt="" style= "width: 700px; height: 550px; ">
									</c:if>
		          				</div>
	          				</div>
	        			</div>
	        		</div>
	        	</div>
    		</div>
	    	<div class="row" style="margin-top: 20px;">
	    		<div class="col" style="margin-right: 25%;">
	          		<input id="search-btn" type="button" value="목록" onclick="location.href='/board.do'" style="width: 20%; height: 45px;" />
	            </div>
				<div class="col" style="text-align: right; margin-right: 19%;">
				<c:if test="${detail.memId eq memId}">
	         		<button id="search-btn1"  type="button" onclick="location.href='/board_mod.do?boardSeq=${detail.boardSeq}'">수정</button>
	         		<button id="search-btn1" type="submit" >삭제</button>
	         	</c:if>
	      		</div>
	    	</div>
		</div>
	</form>

	</section>
	<br/><br/><br/>
	  	<!-- 댓글 조회 -->
	<section class="testimonial-area testimonial-padding section-bg3" >
    	<div class="container">
			</br>
		    <!-- 댓글 ajax -->
		    <div id="replyRes">
		    </div>
		</div>
	</section>

		<br/>

	<section class="testimonial-area testimonial-padding section-bg3" >
    	<div class="container" style="max-width: 1000px;">
			<div class="form-comments">
	        	<div class="title-box-d">
	            	<h3 class="title-d"> 댓글 달기</h3>
				</div>
            	<div class="row">
                    <input type="hidden" class="form-control form-control-lg form-control-a" name="replyName" value="<%=memName %>" placeholder="Name *" >
                  	<div class="col-md-12 mb-3">
                    	<div class="form-group">
                      		<label for="textMessage">Enter message</label>
                      		<textarea name="replyContent"  class="form-control reply-text" placeholder="Comment *" name="message" cols="45" rows="8" ></textarea>
                    	</div>
                  	</div>
					<div class="col-md-12">
	                	<input id="search-btn" type="button" value="Send Reply" onclick="fn_replyAdd()" style="width: 15%;"/>
					</div>
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

