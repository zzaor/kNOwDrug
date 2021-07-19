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
  <link href="/resources/assets/css/drug_identify.css" rel="stylesheet">

<script type="text/javascript">
function fn_Search() {
    var itemName = $("#itemName").val();
    if(itemName == null || itemName == ""){
    	itemName = "";
    }

    var entpName = $("#entpName").val();
    if(entpName == null || entpName == ""){
    	entpName = "";
    }

    if(itemName == null && entpName == null || itemName == "" && entpName == ""){
    	alert("제품명 또는 회사명을 입력해주세요.")
    	return false;
    }

	var recognizeName = $("#recognizeName").val()
    if(recognizeName == null || recognizeName == ""){
    	recognizeName = "";
    }

	var formName = $("input[name=formName]:checked").val();
	if(formName == null || formName == ""){
		alert("제형을 선택해주세요.")
		return false;
	}

	var durShape = $("input[name=durShape]:checked").val();
	if(durShape == null || durShape == ""){
		alert("모양을 선택해주세요.")
		return false;
	}

	var durColor = $("input[name=colors]:checked").val();
	if(durColor == null  || durColor == ""){
		alert("색상을 선택해주세요.")
		return false;
	}

	var durLine = $("input[name=lines]:checked").val();
	if(durLine == null || durLine == ""){
		alert("분할선을 선택해주세요.")
		return false;
	}


    var param = "";
     param += "dummy=" + Math.random();
     param += "&itemName=" + itemName;
     param += "&entpName=" + entpName;
     param += "&recognizeName=" + recognizeName;
     param += "&formName=" + formName;
     param += "&durShape=" + durShape;
     param += "&durColor=" + durColor;
     param += "&durLine=" + durLine;

     $.ajax({
         type: "post",
         url: "/durSearch.do",
         dataType: "json",
         data: param,
         error: function (request, status, error) {
            alert("검색결과가 없습니다.");
         },
         success: function (data) {
        	 fn_reset();

           	console.log(data.data[0].ITEM_NAME)
			console.log(data)
			console.log(data.data.length)
			console.log("성공")
			var output = "";
			var cnt = 0;

			for(var i=0; data.data.length; i++){

             	var item = data.data[i]
	             output += 	"<tr style='border-top:2px solid #e9f9e7'>"
				 output += 	"	<td class='img'>"
				 output += 	"		<div class='w-100 h-100'>"
				 output += 	"			<img alt='의약품이미지' style='width:100%;height:100%' src='"+item.ITEM_IMAGE+"'>"
				 output += 	"		</div>"
				 output += 	"	</td>"

				 output += 	"<td class='categ'>"
				 			if(item.PRINT_FRONT == null || item.PRINT_FRONT ==""){
				 output += 	"		-"
							}else{
				 output += 			item.PRINT_FRONT
						   }
				 output += '/'
					 		if(item.PRINT_BACK == null || item.PRINT_BACK ==""){
				 output += 	"		-"
							}else{
				 output += 			item.PRINT_BACK
						   }
				 output += 	"		</td>"


				 output += 	"<td class='txtL name'>"+item.ITEM_NAME+"</td>"

				 output += 	"<td class='mark_medi'>"+item.DRUG_SHAPE+"</td>"

				 output += 	"<td class='categ'>"+item.FORM_CODE_NAME+"</td>"
				 output += "<td class='mark_medi'>"+item.LENG_LONG+"</td>"
				 output += "<td class='mark_medi'>"+item.LENG_SHORT+"</td>"
				 output += "<td class='mark_medi'>"+item.THICK+"</td>"
				 output += "<td class='comp'>"+item.ENTP_NAME+"</td>"
				 output += 	"</tr>"
				 output +=  "<tr class='spacer' style='border-top:2px solid #e9f9e7'><td colspan='80' style='padding:0.50rem;'></td></tr>"


				 if(formName == "전체" && durShape == "전체" && durColor == "전체"
					|| formName == "전체" && 	item.DRUG_SHAPE == durShape && item.COLOR_CLASS1.includes(durColor)
					|| formName == "전체" && 	durShape == "전체" && item.COLOR_CLASS1.includes(durColor)
					|| item.FORM_CODE_NAME.includes(formName) && durShape == "전체" && item.COLOR_CLASS1.includes(durColor)
					|| item.FORM_CODE_NAME.includes(formName) && durShape == "전체" && durColor == "전체"
					|| formName == "전체" && 	item.DRUG_SHAPE == durShape && durColor == "전체"
					|| item.FORM_CODE_NAME.includes(formName) && item.DRUG_SHAPE == durShape && durColor == "전체"
					|| item.FORM_CODE_NAME.includes(formName) && item.DRUG_SHAPE == durShape && item.COLOR_CLASS1.includes(durColor)
				 	){
					 $("#resList").css("display","block")
					 $("#resTable").html(output);
					 cnt = 1;
				 }else{
					 cnt = 0;
				 }
			}
            alert(cnt)
            if(cnt == 0){
            	alert("조건에 맞는 검색 결과가 없습니다.")
            }
		}
	});
}

//제형선택
function pickForm(form){
	var formName = $(form).find('input[type=checkbox]');

	//전체
	if(form == "전체"){
		//이미 선택되어 있을 때
		if($("#typeAll").is(':checked') == true){
			$("#typeAll").removeAttr("checked");
			$("#type_all").css('border',"1px solid #dcdcdc")
			return false

		}else{
			//선택되어 있지 않을 때
			$("#type_all").css('border',"2px solid #2eca6a")
			$("#typeAll").attr("checked",true);
			$(".type").css('border',"")
			$(".formType").removeAttr("checked");
		}

	//제형 값
	}else{
		//이미 선택되어 있을 때
	 	if(formName.is(':checked') == true){
	 		$(formName).removeAttr("checked");
			$(form).css('border', '1px solid #dcdcdc')
			return false;
	 	}

		if($("input[name=formName]").is(":checked")==true){
			alert("하나의 제형만 선택할 수 있습니다.")
			return false
		}

		$(formName).attr("checked",true);
		$(form).css('border',"2px solid #2eca6a")
	}
}


//모양선택
function pickShape(sha){
	var durShape = $(sha).find('input[type=checkbox]');

	//전체
	if(sha == "전체"){
		//이미 선택되어있을 때
		if($("#shapeAll").is(":checked") == true){
			$("#shapeAll").removeAttr("checked");
			$("#shape_all").css('border',"1px solid #dcdcdc")
			return false
		}else{
			//선택되어 있지 않을 때
			$("#shape_all").css('border',"2px solid #2eca6a")
			$("#shapeAll").attr("checked",true);
			$(".shape").css('border',"");
			$(".shapeType").removeAttr("checked");
		}

	//모양 값
	}else{
		//이미 선택되어 있을 때
		if(durShape.is(":checked") == true){
			$(durShape).removeAttr("checked");
			$(sha).css('border', '1px solid #dcdcdc')
			return false
		}

		if($("input[name=durShape]").is(":checked")==true){
			alert("하나의 모양만 선택할 수 있습니다.")
			return false
		}
		$(durShape).attr("checked",true);
		$(sha).css('border',"2px solid #2eca6a")
	}
}


//색상선택
function pickColor(col){
	var durColor = $(col).find('input[type=checkbox]');

	if(col == "전체"){

		if($("#colorAll").is(":checked") == true){
			$("#colorAll").removeAttr("checked");
			$("#color_all").css('border',"1px solid #dcdcdc")
			return false

		}else{
			$("#color_all").css('border',"2px solid #2eca6a")
			$("#colorAll").attr("checked",true);
			$(".color").css("border","")
			$(".colorType").removeAttr("checked");
		}

	}else{

		if(durColor.is(":checked") == true){
			$(durColor).removeAttr("checked");
			$(col).css('border', '1px solid #dcdcdc')
			return false
		}

		if($("input[name=colors]").is(":checked")==true){
			alert("하나의 색상만 선택할 수 있습니다.")
			return false
		}
		$(durColor).attr("checked",true);
		$(col).css("border", "2px solid #2eca6a")
	}

}




function pickLine(line){
	var durLine = $(line).find('input[type=checkbox]');

	if(line == "전체"){

		if($("#lineAll").is(":checked") == true){
			$("#lineAll").removeAttr("checked");
			$("#line_all").css("border", "1px solid #dcdcdc")
			return false
		}else{
			$("#line_all").css('border',"2px solid #2eca6a")
			$("#lineAll").attr("checked",true);
			$(".line").css("border","")
			$(".lineType").removeAttr("checked");
		}

	}else{

		if(durLine.is(":checked") == true){
			$(durLine).removeAttr("checked");
			$(line).css("border", "1px solid #dcdcdc")
			return false
		}

		if($("input[name=lines]").is(":checked")==true){
			alert("하나의 분할선만 선택할 수 있습니다.")
			return false
		}
		$(durLine).attr("checked",true);
		$(line).css("border", "2px solid #2eca6a")
	}
}


	function fn_reset(){

		$("#itemName").val("");
		$("#entpName").val("");
		$("#recognizeName").val("")
		$("input[name=formName]:checked").removeAttr("checked");
		$("input[name=durShape]:checked").removeAttr("checked");
		$("input[name=colors]:checked").removeAttr("checked");
		$("input[name=lines]:checked").removeAttr("checked");

		$("#typeids > li").css('border', '1px solid #dcdcdc');
		$("#shapeids > li").css('border', '1px solid #dcdcdc');
		$("#colorids > li").css('border', '1px solid #dcdcdc');
		$("#lineids > li").css('border', '1px solid #dcdcdc');
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
              <h1 class="title-single">의약품 식별</h1>
              <span class="color-text-a">Drug Identification</span>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row mg-tb3">
        	<div class="col-2 txt-cnt">제품명</div>
        	<div class="col" style="padding-left: 50px;">
        		<input type="text" class="search-input" id="itemName" />
        	</div>
        </div>
        <div class="row mg-tb3">
        	<div class="col-2 txt-cnt" style="padding-top: 33px;">제형</div>
        	<div class="col" style="padding-top: 27px;">
				<ul id="typeids" class="idty" style="list-style: none;">

					<li style="float: left;"  id="type_01" class="shapeETC type" onclick="pickForm(this)">
						<a>
							<img src="resources/assets/img/pills/type01.jpg" alt="정제">
						</a>
						<input type="checkbox" name="formName" class="formType" value="정제">
					</li>

					<li style="float: left;" id="type_02" class="shapeETC type" onclick="pickForm(this)">
						<a>
							<img src="resources/assets/img/pills/type02.jpg" alt="경질캡슐">
						</a>
						<input type="checkbox" name="formName" class="formType" value="경질캡슐">
					</li>

					<li style="float: left;" id="type_03" class="shapeETC type" onclick="pickForm(this)">
						<a>
							<img src="resources/assets/img/pills/type03.jpg" alt="연질캡슐">
						</a>
						<input type="checkbox" name="formName" class="formType" value="연질캡슐" >
					</li>

					<li style="float: left;" id="type_04" class="shapeETC type" onclick="pickForm(this)">
						<a>
							<img src="resources/assets/img/pills/type04.jpg" alt="필름코팅정" >
						</a>
						<input type="checkbox" name="formName" class="formType" value="필름코팅정">
					</li>

					<li style="float: left; padding-top: 4%;" id="type_all" class="shapeETC" onclick="pickForm('전체')">
						<span class="all" style="margin-left: 20%;">전체</span>
						<input type="checkbox" id="typeAll" name="formName" value="전체">
					</li>
				</ul>
        	</div>
        	<div class="col">
        		<div class="row mg-tb3">
        			<div class="col">식별문자</div>
        			<div class="col">
        				<input type="text" class="search-input" />
        			</div>
        		</div>
        		<div class="row mg-tb3">
        			<div class="col">회사명</div>
        			<div class="col">
        				<input type="text" class="search-input" />
        			</div>
        		</div>
        	</div>
        </div>

		<div class="row mg-tb3">
        	<div class="col-2 txt-cnt">모양</div>
        	<div class="col">
				<ul id="shapeids" class="idty">
					<li id="shape_01" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape01.jpg">
						</a>
						<input type="checkbox" name="durShape" value="원형" class="shapeType">
					</li>

					<li id="shape_02" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape02.jpg" alt="타원형">
						</a>
						<input type="checkbox" name="durShape" value="타원형" class="shapeType">
					</li>

					<li id="shape_03" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape03.jpg" alt="반원형">
						</a>
						<input type="checkbox" name="durShape" value="반원형" class="shapeType">
					</li>

					<li id="shape_04" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape04.jpg" alt="삼각형">
						</a>
						<input type="checkbox" name="durShape" value="삼각형" class="shapeType">
					</li>

					<li id="shape_05" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape05.jpg" alt="사각형">
						</a>
						<input type="checkbox" name="durShape" value="사각형" class="shapeType">
					</li>

					<li id="shape_06" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape06.jpg" alt="마름모형">
						</a>
						<input type="checkbox" name="durShape" value="마름모형" class="shapeType">
					</li>

					<li id="shape_07" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape07.jpg" alt="장방형">
						</a>
						<input type="checkbox" name="durShape" value="장방형" class="shapeType">
					</li>

					<li id="shape_08" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape08.jpg" alt="육각형">
						</a>
						<input type="checkbox" name="durShape" value="육각형" class="shapeType">
					</li>

					<li id="shape_09" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape09.jpg" alt="팔각형">
						</a>
						<input type="checkbox" name="durShape" value="팔각형" class="shapeType">
					</li>

					<li id="shape_10" class="shapeETC shape" onclick="pickShape(this)">
						<a>
							<img src="resources/assets/img/pills/shape10.jpg" alt="오각형">
						</a>
						<input type="checkbox" name="durShape" value="오각형" class="shapeType">
					</li>

					<li id="shape_all" class="shapeALL shapeETC" onclick="pickShape('전체');" style="padding-top: 15px;">
						<span style="margin-left: 20%;">전체</span>
						<input type="checkbox" id="shapeAll" name="durShape" value="전체">
					</li>
				</ul>
			</div>
        </div>

		<div class="row mg-tb3">
       		<div class="col-2 txt-cnt">색상</div>
       		<div class="col">
				<ul id="colorids" class="idty">
					<li id="color_white" class="color" onclick="pickColor(this)">
						<a>
							<span>하양</span>
						</a>
						<input type="checkbox" name="colors" value="하양" class="colorType">
					</li>
					<li id="color_yellow" class="color" onclick="pickColor(this)">
						<a>
							<span>노랑</span>
						</a>
						<input type="checkbox" name="colors" value="노랑" class="colorType">
					</li>

					<li id="color_orange" class="color" onclick="pickColor(this)">
						<a>
							<span class="orange">주황</span>
						</a>
						<input type="checkbox" name="colors" value="주황" class="colorType">
					</li>

					<li id="color_pink" class="color" onclick="pickColor(this)">
						<a>
							<span class="pink">분홍</span>
						</a>
						<input type="checkbox" name="colors" value="분홍" class="colorType">
					</li>

					<li id="color_red" class="color" onclick="pickColor(this)">
						<a>
							<span class="red"></span>빨강
						</a>
						<input type="checkbox" name="colors" value="빨강" class="colorType">
					</li>

					<li id="color_brown" class="color" onclick="pickColor(this)">
						<a>
							<span class="brown"></span>갈색
						</a>
						<input type="checkbox" name="colors" value="갈색" class="colorType">
					</li>

					<li id="color_ygreen" class="color" onclick="pickColor(this)">
						<a>
							<span class="ygreen"></span>연두
						</a>
						<input type="checkbox" name="colors" value="연두" class="colorType">
					</li>

					<li id="color_green" class="color" onclick="pickColor(this)">
						<a>
							<span class="green"></span>초록
						</a>
						<input type="checkbox" name="colors" value="초록" class="colorType">
					</li>

					<li id="color_bgreen" class="color" onclick="pickColor(this)">
						<a>
							<span class="bgreen"></span>청록
						</a>
						<input type="checkbox" name="colors" value="청록" class="colorType">
					</li>

					<li id="color_blue" class="color" onclick="pickColor(this)">
						<a style="color: white;">
							<span class="blue"></span>파랑
						</a>
						<input type="checkbox" name="colors" value="파랑" class="colorType">
					</li>

					<li id="color_navy" class="color" onclick="pickColor(this)">
						<a style="color: white;">
							<span class="navy"></span>남색
						</a>
						<input type="checkbox" name="colors" value="남색" class="colorType">
					</li>

					<li id="color_wine" class="color" onclick="pickColor(this)">
						<a style="color: white;">
							<span class="wine"></span>자주
						</a>
						<input type="checkbox" name="colors" value="자주" class="colorType">
					</li>

					<li id="color_purple" class="color" onclick="pickColor(this)">
						<a style="color: white;">
							<span class="purple"></span>보라
						</a>
						<input type="checkbox" name="colors" value="보라" class="colorType">
					</li>

					<li id="color_grey" class="color" onclick="pickColor(this)">
						<a>
							<span class="grey"  style="color: white;"></span>회색
						</a>
						<input type="checkbox" name="colors" value="회색" class="colorType">
					</li>

					<li id="color_black" class="color" onclick="pickColor(this)">
						<a style="color: white;">
							<span class="black"></span>검정
						</a>
						<input type="checkbox" name="colors" value="검정" class="colorType">
					</li>

					<li id="color_trans" class="color" onclick="pickColor(this)">
						<a>
							투명
						</a>
						<input type="checkbox" name="colors" value="투명" class="colorType"/>
					</li>

					<li id="color_all" class="shapeALL" onclick="pickColor('전체')" style="padding-left:10px; padding-top: 15px;">
						<span>전체</span>
						<input type="checkbox" id="colorAll" name="colors" value="전체"/>
					</li>

				</ul>

       		</div>
       	</div>

       	<div class="row mg-tb3">
       		<div class="col-2 txt-cnt">분할선</div>
       		<div class="col">
				<ul id="lineids" class="idty">
					<li id="line_no" class="shapeETC line" onclick="pickLine(this)">
						<a>
							<img src="resources/assets/img/pills/line01.jpg" alt="없음">
						</a>
						<input type="checkbox" name="lines" value="없음" class="lineType">
					</li>

					<li id="line_plus" class="shapeETC line" onclick="pickLine(this)">
						<a>
							<img src="resources/assets/img/pills/line02.jpg" alt="(+)형">
						</a>
						<input type="checkbox" name="lines" value="plus" class="lineType">
					</li>

					<li id="line_minus" class="shapeETC line" onclick="pickLine(this)">
						<a>
							<img src="resources/assets/img/pills/line03.jpg" alt="(-)형">
						</a>
						<input type="checkbox" name="lines" value="minus" class="lineType">
					</li>

					<li id="line_all" class="shapeETC" onclick="pickLine('전체')" style="padding-top: 2%;">
						<span class="all" style="margin-left: 20%;">전체</span>
						<input type="checkbox" id="lineAll" name="lines" value="전체">
					</li>

				</ul>

       		</div>
       	</div>


		<div class="row txt-cnt">
			<div class="col">
				<button class="search-btn" onclick="location.reload()">초기화</button>
				<button class="search-btn" onclick="fn_Search()">검 색</button>
			</div>
		</div>
		</div>
		</section>


   	<div class="container" style="max-width: 1220px">
		<div id="resList"  style="display:none;">
			<h3 style="margin: 0% 2%;">검색결과</h3>
		<br/>
			<table class="table" style="width: 100%; height: 300px; text-align: center; margin: 0% 2%;" >
				<thead>
					<tr>
						<th rowspan="2"  style="padding-bottom: 35px;">제품이미지</th>
						<th rowspan="2" style="padding-bottom: 35px;">식별표시(앞/뒤)</th>
						<th rowspan="2" class="name" style="padding-bottom: 35px;">제품명/성분명</th>
						<th rowspan="2" class="mark_medi" style="padding-bottom: 35px;">의약품모양</th>
						<th rowspan="2" class="form" style="padding-bottom: 35px;">제형</th>
						<th colspan="3" class="size">크기(mm)</th>
						<th rowspan="2" class="comp" style="padding-bottom: 35px;">회사명</th>
					</tr>
					<tr>
						<th style="width: 100px;">장축</th>
						<th style="width: 100px;">단축</th>
						<th style="width: 100px;">두께</th>
					</tr>
				</thead>
				<tbody id="resTable">


					</tbody>
				</table>



		</div>
	</div>
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

