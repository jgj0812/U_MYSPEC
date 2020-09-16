<%@page import="mySpec.ActivityBean"%>
<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="aMgr" class="mySpec.ActivityMgr" />
<%	
	ArrayList<CommunityBean> noticeArr = mgr.noticeList(1, 5, "", "");
	ArrayList<ActivityBean> popActArr = aMgr.popActivityList(1, 8);
	ArrayList<ActivityBean> popConArr = aMgr.popContestList(1, 8);
%>
<section class="py-3">
	<!-- 공지 -->
	<div class="container">
		<h3 style="text-align: center; margin-bottom: 20px">MySpec 공지사항</h3>
		<div class="table-responsive-sm">
			<table class="table table-sm table-hover">
		    	<thead>
		 			<tr class="d-flex">
		 				<th class="col-md-1 d-none d-lg-table-cell">번호</th>
		 				<th class="col-md-1 d-none d-lg-table-cell">게시판명</th>
		 				<th class="col-md-5 d-none d-lg-table-cell">제목</th>
		 				<th class="col-md-2 d-none d-lg-table-cell">글쓴이</th>
		 				<th class="col-md-2 d-none d-lg-table-cell">등록일</th>
		 				<th class="col-md-1 d-none d-lg-table-cell">조회수</th>
		 			</tr>
		 		</thead>
		    	<tbody>
		    		<%
		    			for(CommunityBean bean : noticeArr) {
			    			String date[] = bean.getComm_date().split(" ");
			    			String date1 = date[0];
		    		%>
		    		<tr class="d-flex">
		 				<td class="col-md-1 d-none d-lg-table-cell">공지</td>
		 				<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
		 				<td class="col-md-5 text-truncate">
		 					<a href="community/detailView.jsp?comm_num=<%=bean.getComm_num() %>" class="h5">
		 						<%=bean.getComm_title() %>
		 					</a>
		 					<p class="d-block d-sm-none"><small>관리자 <%=date1 %> 조회 <%=bean.getComm_hits() %></small></p>
		 				</td>
		 				<td class="col-md-2 d-none d-lg-table-cell">관리자</td>
		 				<td class="col-md-2 d-none d-lg-table-cell"><%=date1 %></td>
		 				<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_hits() %></td>
		 			</tr>
		 			<%	}%>
		    	</tbody>
		  	</table>
		</div>
	</div>
	<!-- /공지 -->
	<!-- 인기 대외활동 -->
    <div class="container bg-light my-3">
    	<!-- slick 컨트롤 -->
		<div style="display: flex; padding-top: 25px">
			<h3 class="c_title" >인기 대외활동</h3>

			<div class="row justify-content-end p-3">
				<button type="button" class="left mr-2" id="arrow_button">
					<i class="fas fa-angle-left"></i>
				</button>
				<button type="button" class="right" id="arrow_button">
					<i class="fas fa-angle-right"></i>
				</button>
			</div>
		</div>
		<!-- /slick 컨트롤 -->
		<!-- slick 내용물 -->
        <div class="your-class">
        	<%
        		for(ActivityBean bean : popActArr) {
        	%>
        	<a href="activity/list_act_detail.jsp?act_num=<%=bean.getAct_num() %>" class="card mb-2 mr-2">
            	<img
              		class="card-img-top"
              		src="upload/<%=bean.getAct_thumb() %>"
              		alt="Card image cap"
            	/>
            	<div class="card-body">
              		<h4 class="card-title"><%=bean.getAct_title() %></h4>
              		<p class="card-text">
                		<%=bean.getOrg_name() %><br>
                		D-<%=bean.getAct_dday() %> 조회수 <%=bean.getAct_hits() %> 댓글  <%=aMgr.activity_reply_count(bean.getAct_num()) %> 스크랩  <%=aMgr.activity_scrap_count(bean.getAct_num()) %>
              		</p>
            	</div>
          	</a>
          	<%	} %>
		</div>
        <!-- /slick 내용물 -->
    </div>
    <!-- /인기 대외활동 -->
    <!-- /인기 공모전 -->
    <div class="container bg-light my-3">
		<div style="display: flex; padding-top: 25px">
			<h3 class="c_title" >인기 공모전</h3>

			<div class="row justify-content-end p-3">
				<button type="button" class="left2 mr-2" id="arrow_button">
					<i class="fas fa-angle-left"></i>
				</button>
				<button type="button" class="right2" id="arrow_button">
					<i class="fas fa-angle-right"></i>
				</button>
			</div>
		</div>
        <div class="your-class2">
        	<%
        		for(ActivityBean bean : popConArr) {
        	%>
        	<a href="contest/list_con_detail.jsp?act_num=<%=bean.getAct_num() %>" class="card mb-2 mr-2">
            	<img
              		class="card-img-top"
              		src="upload/<%=bean.getAct_thumb() %>"
              		alt="Card image cap"
            	/>
            	<div class="card-body">
              		<h4 class="card-title"><%=bean.getAct_title() %></h4>
              		<p class="card-text">
                		<%=bean.getOrg_name() %><br>
                		D-<%=bean.getAct_dday() %> 조회수 <%=bean.getAct_hits() %> 댓글 스크랩
              		</p>
            	</div>
          	</a>
          	<%	} %>
        </div>
    </div>
</section>
<br>
<%@ include file="/footer.jsp" %>