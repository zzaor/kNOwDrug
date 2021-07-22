<!doctype html>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>kNOwDrug</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">


 <!--/ Form Search Star /-->
<div class="box-collapse sebang">
    <c:if test="${empty member}">
		<div class="title-box-d">
	      <h3 class="title-d ">LOGIN</h3>
	    </div>
	    <span class="close-box-collapse right-boxed ion-ios-close"></span>
	    <div class="box-collapse-wrap form">
			<form class="form-a" action="/login.do" method="post">
				<img src="/resources/assets/img/main/lock.png" style="width: 40%; margin-left: 31%;"/>
				<br/><br/>
				<div class="row">
	           		<div class="col">
	             		<input type="text" class="form-control form-control-a login-input" name="memId" id="memID" placeholder=" ID " >
	           		</div>
	           		<div class="w-100">
	           		<br/>
	           		</div>
	           		<div class="col">
	             		<input type="password" class="form-control form-control-a login-input" name="memPwd" id="memPwd" placeholder=" PASSWORD">
	           		</div>
				</div>

				<div style="text-align: center; margin:5%;">
					<a href="/join.do" class="font-size">회원가입</a>
					<br/>
					<a href="/password.do" class="font-size">비밀번호 찾기</a>
					<br/><br/>
		            <button type="submit" class="btn login-btn">LOGIN</button>
				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${!empty member}">
		<div class="title-box-d">
	      <h4 class="title-d">Welcome</h4>
	    </div>
	    <span class="close-box-collapse right-boxed ion-ios-close"></span>
	    <div class="box-collapse-wrap form">
			<form class="form-a" action="/login.do" method="post">
				<img src="/resources/assets/img/main/member.png" style="width: 40%; margin-left: 31%;"/>
				<br/><br/>
				<div class="row">
					<div class="col" style="text-align: center">
	           		<span class="tmon"  style="font-size:25px;">${member.memName}님 환영합니다.</span>
	           		</div>
				</div>

				<div style="text-align: center; margin:5%;">
					<a href="mypage.do" class="font-size">마이페이지</a>
					<br/>
					<a href="changePwdPage.do" class="font-size">비밀번호변경</a>
					<br/><br/>
		            <button type="button" onclick="location.href='/logout.do'" class="btn login-btn">LOGOUT</button>
				</div>
			</form>
			<br/><br/>
			<div class="row">
				<div class="col title-d">
					<h4>추천 검색어</h4>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col">
					<i class="recommand">#이지엔</i>
					&nbsp;&nbsp;
					<i class="recommand">#타이레놀</i>
					&nbsp;&nbsp;
					<i class="recommand">#아스피린</i>

				</div>
			</div>
		</div>
	</c:if>
</div>



<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container" style="min-width: 1500px;">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand pop" href="/main.do">KNOW<span class="color-b">Drug</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault" style="margin-left: 38%; margin-top: 0.5%;">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link sebang" href="/medi_search.do">의약품검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link sebang" href="/drug_identify.do">의약품식별</a>
          </li>
          <li class="nav-item">
            <a class="nav-link sebang" href="/drug_info.do">복약정보</a>
          </li>
          <li class="nav-item sebang">
            <a class="nav-link" href="/ingredients_info.do">성분정보</a>
          </li>
          <li class="nav-item sebang">
            <a class="nav-link" href="/find_pharmacy.do">약국찾기</a>
          </li>
          <li class="nav-item dropdown sebang">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	알림/문의
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="width: 100px;">
              <a class="dropdown-item" href="/notice.do">공지사항</a>
              <a class="dropdown-item" href="/academic_info.do">학술정보</a>
              <a class="dropdown-item" href="/board.do">자유게시판</a>
            </div>
          </li>
        </ul>
      </div>
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse" data-target="#memberToggler" aria-expanded="false">
        <span class="fa fa-user" aria-hidden="true"></span>
      </button>
    </div>
  </nav><!-- End Header/Navbar -->
        <!-- Header End -->
