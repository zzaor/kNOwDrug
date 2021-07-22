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
  <link href="/resources/assets/css/ingredients_info.css?after" rel="stylesheet">

<script type="text/javascript">
	function checkSelectAll(checkbox)  {
		const checkboxes
	    	= document.getElementsByName("disease");
		checkboxes.forEach((cb) => {
	    	cb.checked = false;
		})
		checkbox.checked = true;
	}

	function fn_reset(){
		$('#ingreName').val('');

		$('input:checkbox[class="checkBox"]:checked').prop("checked",false);


	}

	function fn_ingreSearch(){
		var ingreName = $("#ingreName").val();
		if(ingreName == null || ingreName == ""){
			alert("성분명을 입력해주세요")
			return false;
		}

		var checkBoxlen = $("input:checkbox[name=disease]:checked").length
		if(checkBoxlen == 0){
			alert("약효분류를 하나 선택해주세요")
			return false;
		}

		var durClassify =$('input:checkbox[class="checkBox"]:checked').val();

		var param = "";
	    param += "dummy=" + Math.random();
	    param += "&ingreName=" + ingreName;
	    param += "&durClassify=" + durClassify;

		$.ajax({
	        type: "post",
	        url: "/ingreSearch.do",
	        dataType: "json",
	        data: param,
	        error: function () {
	            alert('검색 결과가 없습니다.');
	            fn_reset();
	        },
	        success: function (data) {
	        	fn_reset();
	        	$("#ingreTbl").css("display","block")
	        	console.log(data)
	        	var length =data.data.length;

				var output = "";
	           	for(var i=0; length; i++){
	        		console.log(i)
	                output +="<tr scope='row' style='border-top:2px solid #e9f9e7'>"
	                output +=	"<td>"+data.data[i].INGR_ENG_NAME+"</td>"
	                output +=	"<td>"+data.data[i].INGR_KOR_NAME+"</td>"
	                output +=	"<td>"+data.data[i].MIXTURE_CLASS+"</td>"
	                output +=	"<td>"+data.data[i].PROHBT_CONTENT+"</td>"
	                output +="</tr>"
	                output +="<tr class='spacer' style='border-top:2px solid #e9f9e7'><td colspan='80' style='padding:0.50rem;'></td></tr>"
	                console.log(output)
		           $("#res").html(output);
	            }
	        }
	    });
	}

	function fn_click(init){
		$("#ingreName").val(init);
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
              <h1 class="title-single">성분 정보검색</h1>
              <span class="color-text-a">Ingredient information search</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
      	<div class="row">
        	<div style="margin-left: 5%;background: #e9f9e7;width: 390px;text-align: center;">
            	<span style="font-size:15px;color:#008073;">입력한 성분명의 상세정보와 금기내용을 조회할 수 있습니다.<br></span>
        	</div>
      	</div>
        <div class="row mg-tb3">

        	<div class="col-2 txt-cnt"><span style="color: red">*</span>&nbsp;성분명(한글)</div>
        	<div class="col" style="margin-left: 4%;">
        		<input type="text" class="search-input" id="ingreName" />
        	</div>
        </div>
        <div class="row txt-cnt mg-tb3">
        	<div class="col-2">가나다검색</div>
        	<div class="col letters">
        		<p>* 정확한 성분명을 모를 경우 가나다로 검색할 수 있습니다.</p>
        	<ul id="ul_initial" >
				<li id="가" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>가</a>
				</li>
				<li id="나" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>나</a>
				</li>
				<li id="다" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>다</a>
				</li>
				<li id="라" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>라</a>
				</li>
				<li id="마" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>마</a>
				</li>
				<li id="바" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>바</a>
				</li>
				<li id="사" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>사</a>
				</li>
				<li id="아" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>아</a>
				</li>
				<li id="자" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>자</a>
				</li>
				<li id="차" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>차</a>
				</li>
				<li id="카" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>카</a>
				</li>
				<li id="타" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>타</a>
				</li>
				<li id="파" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>파</a>
				</li>
				<li id="하" style="cursor:pointer" onclick="fn_click(this.id)">
					<a>하</a>
				</li>
			</ul>
        	</div>
        </div>


        <div class="row txt-cnt mg-tb3 ">
        	<div class="col-2">KPIC 약효분류</div>
			<div class="col-4 " style="text-align: left;">
				<ul style="list-style: none;">
					<li><input type="checkbox" class="checkBox" name="disease" value="감염성질환" onclick='checkSelectAll(this)'/><label class="liLabel">감염성질환</label></li>
					<li><input type="checkbox" class="checkBox" name="disease" value="소화기계질환" onclick='checkSelectAll(this)'><label class="liLabel">소화기계질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="순환기계질환" onclick='checkSelectAll(this)'/><label class="liLabel">순환기계질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="근골격계/결합조직질환" onclick='checkSelectAll(this)'/><label class="liLabel">근골격계/결합조직질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="호흡기계질환" onclick='checkSelectAll(this)'/><label class="liLabel">호흡기계질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="알러지 질환(비염, 가려움증 등 포함)" onclick='checkSelectAll(this)'/><label class="liLabel">알러지 질환(비염.가려움증 등 포함)</label></li>
				</ul>
			</div>
        	<div class="col-3 " style="text-align: left;">
				<ul style="list-style: none;">
                	<li><input type="checkbox" class="checkBox" name="disease"  value="정신/행동장애" onclick='checkSelectAll(this)'/><label class="liLabel">정신/행동장애</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease"  value="신경계질환" onclick='checkSelectAll(this)'/><label class="liLabel">신경계 질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease"  value="호르몬 & 대사관련 질환" onclick='checkSelectAll(this)'/><label class="liLabel">호르몬 & 대사관련 질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="혈액 및 조혈기관 질환" onclick='checkSelectAll(this)'/><label class="liLabel">혈액 및 조혈기관 질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="비뇨생식기계질환" onclick='checkSelectAll(this)'/><label class="liLabel">비뇨생식기계질환</label></li>
                    <li><input type="checkbox" class="checkBox" name="disease" value="통증 질환 " onclick='checkSelectAll(this)'/><label class="liLabel">통증 질환</label></li>
				</ul>
			</div>
        	<div class="col-3 " style="text-align: left;">
				<ul style="list-style: none;">
					<li><input type="checkbox" class="checkBox" name="disease" value="눈,귀,치과,구강용 약물" onclick='checkSelectAll(this)'/><label class="liLabel">눈.귀.치과.구강용 약물</label></li>
	                <li><input type="checkbox" class="checkBox" name="disease" value="암 및 면역 관련 질환" onclick='checkSelectAll(this)'/><label class="liLabel">암 및 면역 관련 질환</label></li>
	                <li><input type="checkbox" class="checkBox" name="disease" value="피부/피하조직질환" onclick='checkSelectAll(this)'/><label class="liLabel">피부/피하조직질환</label></li>
	                <li><input type="checkbox" class="checkBox" name="disease" value="비타민 및 영양제류" onclick='checkSelectAll(this)'/><label class="liLabel">비타민 및 영양제류</label></li>
	                <li><input type="checkbox" class="checkBox" name="disease" value="기타약물" onclick='checkSelectAll(this)'/><label class="liLabel">기타 약물</label></li>
				</ul>
			</div>
		</div>
	    <div class="row">
	    	<div style="margin-left: 5%;background: #e9f9e7;width: 763px;text-align: center;">
				<span style="font-size:15px;color:#008073;">필수입력값을 제외한 데이터는 홈페이지에서 더 나은 서비스를 제공하기 위해 수집하는 데이터입니다. 협조 부탁드립니다.</span>
			</div>
	    </div>
		<div class="row txt-cnt">
			<div class="col">
				<button class="search-btn" type="button" onclick="fn_reset()">초기화</button>
				<button class="search-btn" onclick="fn_ingreSearch()" style="cursor:pointer">검 색</button>
			</div>
		</div>
	</div>
    </section>

   	<br/><br/><br/>

 	<div class="container">
		<div id="ingreTbl"  style="display:none;">
			<h2 class="mb-5">검색결과</h2>
		<br/>
        <table class="table custom-table">
          <thead style="border-top:2px solid #e9f9e7; border-top:2px solid #e9f9e7"	>
            <tr>
              <th scope="col">성분명(영문)</th>
              <th scope="col">성분명(한글)</th>
              <th scope="col">성분상세정보</th>
              <th scope="col">성분금기내용</th>
            </tr>
          </thead>
			<tbody id="res">
			</tbody>
			</table>
		</div>
	</div>

    <!-- End Property Grid Single-->

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

