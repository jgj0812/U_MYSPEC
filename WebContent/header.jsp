<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
%>
<!DOCTYPE html>
<html lang="ko" class="h-100">
	<head>
    	<meta charset="UTF-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<title>MYSPEC!</title>
    	
	    <!-- 부트스트랩 -->
	    <link 
	    	rel="stylesheet" 
	    	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	    	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
	    	crossorigin="anonymous">
	    <!-- 구글 폰트 -->
	    <link
	      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	      rel="stylesheet"
	    />
	    <!-- 폰트 오썸 -->
	    <link
	      rel="stylesheet"
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	      crossorigin="anonymous"
	    />
	    <!-- slick css -->
	    <link
	      rel="stylesheet"
	      type="text/css"
	      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
	    />
	    <link
	      rel="stylesheet"
	      type="text/css"
	      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"
	    />
	    <!-- MYSPEC CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myspec.css" />
	    <!-- summernote css -->
	    <link href="${pageContext.request.contextPath}/summernote/summernote-bs4.min.css" rel="stylesheet" />
	    <!-- jquery-ui -->
	    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	</head>
  	<body class="d-flex flex-column h-100">
  		<!-- header -->
    	<header>
      		<nav class="navbar navbar-expand-sm bg-cam navbar-dark flex-md-nowrap">
      			<div class="container">
        			<a class="navbar-brand col mr-10 px-3 py-3" href="${pageContext.request.contextPath}/index.jsp">MYSPEC!</a>
        			<button
          				class="navbar-toggler collapsed"
          				type="button"
          				data-toggle="collapse"
          				data-target="#navbarCollapse">
          					<span class="navbar-toggler-icon"></span>
        			</button>
        			<!-- 검색창 -->
        			<form class="form-inline w-100 py-2" action="${pageContext.request.contextPath}/search.jsp" method="POST">  				
          				<div class="input-group">
            				<input type="text" id="search" name="search" class="form-control" size="50" />
            				<div class="input-group-append">
              					<button type="submit" id="searchBtn" class="btn btn-light px-2">
                					<i class="fas fa-search"></i>
              					</button>
            				</div>
          				</div>
        			</form>
        			<!-- / 검색창 -->
        			<!-- 로그인/로그아웃 -->
        			<%if(id != null) {	// 로그인이 되면 %>
        			<div class="col-md-3">  
          				<div class="d-flex justify-content-center row">
          					<p class="text-center"><%=id %>님 안녕하세요.</p>
            				<a href="${pageContext.request.contextPath}/member/logoutPro.jsp" class="text-nowrap btn btn-outline-cam btn-block">로그아웃</a>           
          				</div>
        			</div>
        			<%}else {	// 로그인이 되지 않으면 %>
        			<div class="col-md-3">  
          				<div class="d-flex justify-content-center row">
            				<a href="${pageContext.request.contextPath}/member/login.jsp" class="text-nowrap btn btn-outline-cam col">로그인</a>
            				&nbsp;
            				<a href="${pageContext.request.contextPath}/member/join.jsp" class="text-nowrap btn btn-cam-white col">회원가입</a>
          				</div>
        			</div>
        			<%} %>
        			<!-- / 로그인/로그아웃 -->
        		</div>
      		</nav>
    	</header>
    	<!-- / header -->
    	<!-- navbar -->
    	<nav class="navbar navbar-expand-sm bg-cam navbar-dark">
      		<div class="container">
        		<div
          			id="navbarCollapse"
          			class="navbar-collapse collapse justify-content-center">
        				<%if(id != null) {	// 로그인이 되면 %>
          				<ul class="navbar-nav">
            				<li class="nav-item px-2">
              					<a href="${pageContext.request.contextPath}/activity/list_act.jsp" class="nav-link h5">대외활동</a>
            				</li>
				            <li class="nav-item px-2">
				            	<a href="${pageContext.request.contextPath}/contest/list_gongmo.jsp" class="nav-link h5">공모전</a>
				            </li>
	            			<li class="nav-item px-2">
	              				<a href="${pageContext.request.contextPath}/community/community.jsp" class="nav-link h5">커뮤니티</a>
	            			</li>
	            			<li class="nav-item px-2">
	              				<a href="${pageContext.request.contextPath}/myPage/myPage.jsp" class="nav-link h5">마이페이지</a>
	            			</li>
          				</ul>
        				<%}else {	// 로그인이 되지 않으면 %>
          				<ul class="navbar-nav">
            				<li class="nav-item px-2">
              					<a href="${pageContext.request.contextPath}/activity/list_act.jsp" class="nav-link h5">대외활동</a>
            				</li>
            				<li class="nav-item px-2">
              					<a href="${pageContext.request.contextPath}/contest/list_gongmo.jsp" class="nav-link h5">공모전</a>
            				</li>
            				<li class="nav-item px-2">
              					<a href="${pageContext.request.contextPath}/community/community.jsp" class="nav-link h5">커뮤니티</a>
            				</li>
          				</ul>
        				<%} %>
        		</div>
      		</div>
    	</nav>
    	<!-- / navbar -->