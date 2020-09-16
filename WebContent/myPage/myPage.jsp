<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>

.mypage_button{
	width: 250px;
	height: 150px;
	margin: 20px;
	border: 1px solid lightgray;
	background-color: #f2faff;
}

.button_title{
	margin-top:5px;
	font-size: 23px;
	font-weight: bold
}
.button_Explanation{
	color: gray;
	font-size: 13px;
	font-weight: lighter;
}

@media (max-width:360px) {
	.mypage_button{
	width: 200px;
	height: 100px;
	margin: 20px;
	border: 1px solid lightgray;
	background-color: #f2faff;
	}
	
	.button_title{
		font-size: 20px;
		font-weight: bold
	}
	.button_Explanation{
		color: gray;
		font-size: 11px;
	}
}
</style>
<main>
	<div class="d-flex" id="wrapper">
		
		<%-- <%@ include file="/myPage/myPage_sidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			 --%>
			 <br>
			<div class="container" style="text-align: center;">
			
			<div class="container py-3 bg-light" style="text-align: center;">
				<h4 style="margin-top: 8px;">마이페이지</h4>
			</div>
			
			<button class="mypage_button" onclick = "location.href = 'myPage_myList.jsp'">
				<p class="button_title">내가 작성한 글<p>
				<p class="button_Explanation">커뮤니티에 작성한 글 목록을<br> 볼 수 있습니다<p>
			</button>
			<button class="mypage_button" onclick = "location.href = 'myPage_myComment.jsp'">
				<p class="button_title">댓글 작성한 글<p>
				<p class="button_Explanation">커뮤니티에 작성한 댓글이 달린 글 목록을<br> 볼 수 있습니다<p>
			</button>
			<button class="mypage_button" onclick = "location.href = 'myPage_actScrap.jsp'">
				<p class="button_title">스크랩한 대외활동<p>
				<p class="button_Explanation">스크랩한 대외활동 목록을<br> 볼 수 있습니다<p>
			</button>
			<button class="mypage_button" onclick = "location.href = 'myPage_conScrap.jsp'">
				<p class="button_title">스크랩한 공모전<p>
				<p class="button_Explanation">스크랩한 공모전 목록을<br> 볼 수 있습니다<p>
			</button>
			<button class="mypage_button" onclick = "location.href = 'myPage_info.jsp'">
				<p class="button_title">회원정보 변경<p>
				<p class="button_Explanation">닉네임, 연락처, 이메일, 비밀번호를<br> 변경할 수 있습니다<p>
			</button>
			<button class="mypage_button" onclick = "location.href = 'myPage_delete.jsp'">
				<p class="button_title">회원탈퇴<p>
				<p class="button_Explanation">MySpec!을 회원탈퇴<br> 할 수 있습니다 <p>
			</button>
	
			</div>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>