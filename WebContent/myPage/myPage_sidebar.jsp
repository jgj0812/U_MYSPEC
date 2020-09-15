<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int member = (int)session.getAttribute("member");
%>
		<!-- sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<%if(member == 0) {%>
			<!-- 개인회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                커뮤니티
              </h3>
			<div class="list-group list-group-flush">
				<a href="myPage_myList.jsp" class="list-group-item list-group-item-action bg-light">내가 쓴 글</a>
				<a href="myPage_myComment.jsp" class="list-group-item list-group-item-action bg-light">댓글 쓴 글</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                스크랩
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%}else { %>
			<!-- 단체회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                모집중인 활동
              </h3>
			<div class="list-group list-group-flush">
				<a href="myPage_orgRecru.jsp?act_type=1" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="myPage_orgRecru.jsp?act_type=2" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                승인 대기 중
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_orgReady.jsp?act_type=1" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="myPage_orgReady.jsp?act_type=2" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" id="memberDelete" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%} %>
		</div>
		<!-- /sidebar -->