<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("adminId");
%>
<html lang="ko" class="h-100">
	<head>
    	<meta charset="UTF-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<title>MYSPEC!</title>
	    <!-- 부트스트랩 CSS -->
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
	    <!-- jquery-ui -->
	    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	    <!-- summernote css -->
	    <link href="${pageContext.request.contextPath}/summernote/summernote-bs4.min.css" rel="stylesheet" />
	    <!-- mySpec css -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myspec.css" />
	</head>
  	<body class="d-flex flex-column h-100">
  		<!-- admin header -->
	    <header>
	    	<nav class="navbar navbar-expand-sm bg-cam navbar-dark flex-md-nowrap">
	        	<a class="navbar-brand col-md-3 mr-10 px-3 py-3" href="#">MYSPEC!</a>
	        	<span class="col font-weight-bolder text-white h1">ADMIN</span>
	      	</nav>
	    </header>
	    <!-- /admin header -->