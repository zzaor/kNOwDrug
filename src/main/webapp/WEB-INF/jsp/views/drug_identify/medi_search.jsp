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
  <link href="/resources/assets/css/medi_search.css" rel="stylesheet">

<script type="text/javascript">
	function fn_Search() {
	    var itemName = $("#itemName").val();
	    var entpName = $("#entpName").val();
	    var efficacy = $("#efficacy").val();
		var route = $("#route option:selected").val();
		var formName = $("#formName option:selected").val();

		console.log(itemName)
	    if(itemName == null && entpName == null || itemName == "" && entpName == ""){
	       alert("제품명 또는 회사명을 반드시 입력해야합니다.")
	       return false;
	    }

	    if(entpName == null || entpName == ""){
	       entpName = "";
	    }

	    if(efficacy == null || efficacy == ""){
			efficacy = "";
	     }

	    if(route == "투여경로"){
	    	route = "";
	    }

	    if(formName == "제형"){
	    	formName = "";
	    }

	    var param = "";
	     param += "dummy=" + Math.random();
	     param += "&itemName=" + itemName;
	     param += "&entpName=" + entpName;
	     param += "&efficacy=" + efficacy;
	     param += "&route=" + route;
	     param += "&formName=" + formName;


	     $.ajax({
	         type: "post",
	         url: "/durSearch.do",
	         dataType: "json",
	         data: param,
	         error: function (request, status, error) {
	            alert("검색결과가 없습니다.");
	         },
	         success: function (data) {
	        	fn_reset()

	        	$("#resList").css("display","block")


	           	console.log(data.data[0].ITEM_NAME)
				console.log(data)
				console.log(data.data.length)
				console.log("성공")

				var output = "";

	        	var modalput = "";
	            for(var i=0; data.data.length; i++){
	             var item = data.data[i]
	             	 output += 	"<tr style='border-top:2px solid #e9f9e7'>"
					 output += 	"<td><a href='#' data-toggle='modal' data-target='#drugDetail_"+i+"'><img class='img' id='itemImg' src='"+item.ITEM_IMAGE+"' onclick='' style='width:120px; height:70px;'>"+"</a></td>"
					 output += 	"<td>"+item.FORM_CODE_NAME+"</td>"
					 output += 	"<td>"+item.LENG_LONG+"</td>"
					 output += 	"<td>"+item.LENG_SHORT+"</td>"
					 output += 	"<td>"+item.THICK+"</td>"
					 output += 	"<td>"+item.ITEM_NAME+item.ITEM_ENG_NAME+"</td>"
					 output += 	"<td>"+item.ENTP_NAME+"</td>"
					 output += 	"</tr>"
					 output +=  "<tr class='spacer' style='border-top:2px solid #e9f9e7'><td colspan='80' style='padding:0.50rem;'></td></tr>"

	                 $("#resTable").html(output);

				 modalput += "<div class='modal fade bd-example-modal-lg' id='drugDetail_"+i+"' tabindex='-1' role='dialog' aria-labelledby='' aria-hidden='true'>"
				 modalput += "	<div class='modal-dialog modal-lg' role='document'>"
				 modalput += "		<div class='modal-content txt-ct'>"
				 modalput += "			<div class='modal-header'>"
				 modalput += "				<h5 class='modal-title'>제품 상세정보</h5>"
				 modalput += "				<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
				 modalput += "					<span aria-hidden='true'>&times;</span>"
				 modalput += "				</button>"
				 modalput += "			</div>"
				 modalput += "			<div class='modal-body'>"
				 modalput += "				<div class='container txt-cnt'>"
	      		 modalput += "					<div class='row justify-content-between'>"
				 modalput += "						<div class='col-7'><img class='img' src='"+item.ITEM_IMAGE+"' style='width:420px'></div>"
					 modalput += "						<div class='col'>"
				 modalput += "							<div class='row'>"
					 modalput += "								<div class='col mtitle h-35'><p class='col-mg'>품목일련번호</p></div>"
				 modalput += "								<div class='w-100'></div>"
				 modalput += "								<div class='col  h-35'><p class='col-mg'>"+item.ITEM_SEQ+"</p></div>"
				 modalput += "								<div class='w-100'></div>"
				 modalput += "								<div class='col mtitle  h-35'><p class='col-mg'>품목명</p></div>"
				 modalput += "								<div class='w-100'></div>"
				 modalput += "								<div class='col'><p class='col-mg'><b>"+item.ITEM_NAME+"</b></p></div>"
				 modalput += "								<div class='w-100'></div>"
				 modalput += "								<div class='col mtitle h-35'><p class='col-mg'>성분/함량</p></div>"
				 modalput += "								<div class='w-100'></div>"
				 modalput += "								<div class='col h-35'>"
				 										if(item.ITEM_ENG_NAME != null || item.ITEM_ENG_NAME != ""){
				 modalput += 									item.ITEM_ENG_NAME
				 										}

				 										if(item.ITEM_ENG_NAME == null || item.ITEM_ENG_NAME == ""){
				 modalput += "									<p>-</p>"
				 										}
				 modalput += "								</div>"
				 modalput += "							</div>"
				 modalput += "						</div>"
  				 modalput += "					</div>"
				 modalput += "					<div class='row'>"
				 modalput += "						<div class='col mtitle col-mg h-35'><p class='col-mg'>제조/수입사</p></div>"
				 modalput += "						<div class='col col-mg'><p class='col-mg'>"+item.ENTP_NAME+"</p></div>"
				 modalput += "						<div class='col mtitle col-mg'><p class='col-mg'>전문/일반</p></div>"
				 modalput += "						<div class='col col-mg'><p class='col-mg'>"+item.ETC_OTC_NAME+"</p></div>"
				 modalput += "					</div>"
				 modalput += "					<div class='row'>"
				 modalput += "						<div class='col mtitle col-mg h-35'><p class='col-mg'>색상</p></div>"
				 modalput += "						<div class='col col-mg'><p class='col-mg'>"+item.COLOR_CLASS1+"</p></div>"
				 modalput += "						<div class='col mtitle col-mg'><p class='col-mg'>의약품모양</p></div>"
				 modalput += "						<div class='col col-mg'><p class='col-mg'>"+item.DRUG_SHAPE+"</p></div>"
				 modalput += "					</div>"
				 modalput += "					<div class='row'>"
				 modalput += "						<div class='col-3 mtitle col-mg h-35'><p class='col-mg'>성상</p></div>"
				 modalput += "						<div class='col col-mg'><p class='col-mg'>"+item.CHART+"</p></div>"
				 modalput += "					</div>"
				 modalput += "				</div>"
				 modalput += "			</div>"
				 modalput += "			<div class='modal-footer'>"
				 modalput += "				<button class='search-btn' data-dismiss='modal'>닫기</button>"
				 modalput += "			</div>"
				 modalput += "		</div>"
				 modalput += "	</div>"
				 modalput += "</div>"

                 $("#resModal").html(modalput);
	             }
			}
		});
	}

	function fn_click(init){
		$("#itemName").val(init);
	}

	function fn_reset(){
		$("#itemName").val("");
    	$("#entpName").val("");
    	$("#efficacy").val("");
    	$("#route").val("전체").prop("selected", true);
    	$("#formName").val("전체").prop("selected", true);
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
              <h1 class="title-single">의약품 상세 검색</h1>
              <span class="color-text-a">Detailed Drug Search</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
		<div class="row">
			<div style="margin-left: 8%;background: #e9f9e7;width: 300px;text-align: center;">
				<span style="font-size:15px;color:#008073;">제품명 또는 회사명으로 검색할 수 있습니다.</span>
			</div>
		</div>
        <div class="row mg-tb3">
        	<div class="col-3 txt-cnt"><span style="color:red">*</span>&nbsp;<span>제품명(한글/영문)</span></div>
        	<div class="col">
        		<input type="text" class="search-input" id="itemName" />
        	</div>
        </div>
        <div class="row txt-cnt mg-tb3">
        	<div class="col-3">초성검색</div>
        	<div class="col letters">
        		<p>* 정확한 제품명을 모를 경우 알파벳으로 검색할 수 있습니다.</p>
        		<ul id="ul_initial" >
					<li id="A" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>A</a>
					</li>
					<li id="B" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>B</a>
					</li>
					<li id="C" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>C</a>
					</li>
					<li id="D" style="cursor:pointer" onclick="fn_click(this.id)">
						<a >D</a>
					</li>
					<li id="E" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>E</a>
					</li>
					<li id="F" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>F</a>
					</li>
					<li id="G" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>G</a>
					</li>
					<li id="H" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>H</a>
					</li>
					<li id="I" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>I</a>
					</li>
					<li id="J" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>J</a>
					</li>
					<li id="K" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>K</a>
					</li>
					<li id="L" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>L</a>
					</li>
					<li id="M" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>M</a>
					</li>
					<li id="N" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>N</a>
					</li>
					<li id="O" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>O</a>
					</li>
					<li id="P" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>P</a>
					</li>
					<li id="Q" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>Q</a>
					</li>
					<li id="R" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>R</a>
					</li>
					<li id="S" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>S</a>
					</li>
					<li id="T" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>T</a>
					</li>
					<li id="U" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>U</a>
					</li>
					<li id="V"  style="cursor:pointer" onclick="fn_click(this.id)">
						<a>V</a>
					</li>
					<li id="W"  style="cursor:pointer" onclick="fn_click(this.id)">
						<a>W</a>
					</li>
					<li id="X"  style="cursor:pointer" onclick="fn_click(this.id)">
						<a>X</a>
					</li>
					<li id="Y" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>Y</a>
					</li>
					<li id="Z" style="cursor:pointer" onclick="fn_click(this.id)">
						<a>Z</a>
					</li>
				</ul>
        	</div>
        </div>

        <div class="row mg-tb3">
        	<div class="col-3 txt-cnt"><span style="color:red">*</span>&nbsp;회사명</div>
        	<div class="col" style="max-width: 24%;">
        		<input type="text" id="entpName" name="entpName" class="search-input" />
        	</div>
        	<div class="col-3 txt-cnt">효능효과</div>
        	<div class="col">
        		<input type="text" id="efficacy" name="efficacy" placeholder="예) 당뇨병" class="search-input" style="margin-left: 4%;"/>
        	</div>
        </div>

        <div class="row mg-tb3">
        	<div class="col-3 txt-cnt">투여경로</div>
        	<div class="col">
        		<select id="route" name="route" class="custom-select">
					<option value="전체">전체</option>
					<option value="경구">경구</option>
					<option value="구강&치아">구강&치아</option>
					<option value="귀">귀</option>
					<option value="눈">눈</option>
					<option value="코">코</option>
					<option value="폐">폐</option>
					<option value="피부">피부</option>
					<option value="주사">주사</option>
        		</select>
        	</div>
        	<div class="col-3 txt-cnt">제형</div>
        	<div class="col">
        		<select id="formName" name="formName" class="custom-select">
					<option value="전체">전체</option>
					<option value="가글액제">가글액제</option>
					<option value="건조시럽">건조시럽</option>
					<option value="겔제">겔제</option>
					<option value="경질캡슐">경질캡슐</option>
					<option value="경피흡수제(패취제)">경피흡수제(패취제)</option>
					<option value="과립">과립</option>
					<option value="시럽제">시럽제</option>
				</select>
        	</div>
        </div>
		<div class="row">
			<div style="margin-left: 8%;background: #e9f9e7;width: 763px;text-align: center;">
				<span style="font-size:15px;color:#008073;">필수입력값을 제외한 데이터는 홈페이지에서 더 나은 서비스를 제공하기 위해 수집하는 데이터입니다. 협조 부탁드립니다.</span>
			</div>
		</div>
		<div class="row txt-cnt">
			<div class="col">
				<button class="search-btn" onclick="fn_reset()">초기화</button>
				<button class="search-btn" onclick="fn_Search()">검 색</button>
			</div>
		</div>



   		<br/><br/><br/>
		<div id="resList"  style="display:none;">
			<h3 style="margin: 0% 2%;">검색결과</h3>
		<br/>
			<table class="table custom-table"  style="width: 100%; height: 10%; margin:0% 2%; border-color: white">
				<thead style="border:0px;">
					<tr style="border: 0px">
						<th rowspan="2" style="padding-bottom: 35px; width: 148px">식별이미지</th>
						<th rowspan="2" style="padding-bottom: 35px; width:125px" class="form">제형</th>
						<th colspan="3" class="size" style="border: 0px; width:350xp">크기(mm)</th>
						<th rowspan="2" style="padding-bottom: 35px; width:330px" class="name">제품명/성분명</th>
						<th rowspan="2" style="padding-bottom: 35px; width: 125px;" class="comp">회사명</th>
					</tr>
					<tr>
						<th>장축</th>
						<th>단축</th>
						<th>두께</th>
					</tr>
				</thead>

					<tbody id ="resTable">
					</tbody>

			</table>
		</div>
      </div>
    </section>
    <!-- End Property Grid Single-->




	<div id="resModal"></div>

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

