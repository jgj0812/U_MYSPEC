<%@page import="mySpec.ActivityBean"%>
<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="actMgr" class="mySpec.ActivityMgr" />
<%
	ArrayList<CommunityBean> searchComArr = mgr.Community_list(1, 5, keyField, keyWord);
	ArrayList<ActivityBean> searchActArr = actMgr.searchActivity(1, 5, keyField1, keyWord);
%>
	<div class="container" >
		<div style="text-align: center; margin-top: 20px; margin-bottom: 20px">
			<h3>'<%=keyWord %>' 검색결과</h3>
		</div>
     
      	<!-- navbar (card 방식) -->
      	<nav class="navbar card-header" style="background-color: white; border: 0px">
        
        	<a href="search.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>"
          	class="p-4 col-lg-4 text-center d-none d-lg-table-cell rounded-left"  style="border: 1px solid #1dcdff; color:#1dcdff;">
          		전체
          	</a>
          	<a href="searchAct.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>"
          	class="p-4 col-lg-4 text-center border border-lightgray d-none d-lg-table-cell">
          		모집중인 활동
          	</a>

          	<a class="p-4 col-lg-4 text-center border border-lightgray d-none d-lg-table-cell rounded-right"
          	href="searchCom.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
            	커뮤니티
          	</a>
          	
          	<!-- navbar mobile -->
          	<a href="search.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>"
          	class=" col-3 col-xs-4 text-center d-block d-sm-none rounded-left p-3" style="border: 1px solid #1dcdff; color:#1dcdff;">
          		<small>전체</small>
          	</a>
          	<a class=" col-5 col-sm-4 text-center border border-lightgray d-block d-sm-none  p-3"
          	href="searchAct.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
          		<small>모집중인 활동 </small>
          	</a>

          	<a class=" col-4 col-xs-4 text-center border border-lightgray d-block d-sm-none rounded-right  p-3"
          	href="searchCom.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
          		<small>커뮤니티</small>
          	</a>
          	<!-- /navbar mobile -->
      	</nav>
      	<!-- /navbar -->
	</div>
	<br>
	<!-- 활동 -->
    <div class="container " style="padding:0px; border: 1px solid lightgray;">
    	<div class="col-lg-12 bg-light p-3" style="text-align: center; font-size: 22px">모집중인 활동
    		<button class="d-flex ml-auto btn btn-secondary btn-sm" onclick = "location.href = 'searchAct.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>'">더보기</button>
    	</div>
        <div class="col-lg-12 border border-light" style="padding: 0px">
        	<div class="table-responsive">
            	<table class="table table-sm table-hover">
              		<tbody>
              			<%
              				for(ActivityBean bean : searchActArr) {
              					String actType = bean.getAct_type() == 1 ? "대외활동" : "공모전";
              			%>
                		<tr class="d-flex">
                  			<td class="col-md-1 col-4">
                  				<div class="thumbnail">
                    				<img class="" width="100%" src="./upload/<%=bean.getAct_thumb() %>"  alt="썸네일" />
                    			</div>
                  			</td>
                  			<td class="col-md-1 d-none d-lg-table-cell"><%=actType %></td>
                  			<td class="col-md-5">
                    			<a class="h5  d-none d-lg-table-cell"><%=bean.getAct_title() %></a>
                    			<a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;"><%=bean.getAct_title() %></a>
                    			<div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill"><%=actType %></span></div>
                    			<p class="d-block d-sm-none">
                      				<small> <%=bean.getOrg_name() %> ~<%=bean.getAct_end() %> <%=bean.getAct_hits() %></small>                       
                    			</p>
                  			</td>
                  			<td class="col-md-2 d-none d-lg-table-cell"><%=bean.getOrg_name() %></td>
                  			<td class="col-md-2 d-none d-lg-table-cell">~<%=bean.getAct_end() %></td>
                  			<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getAct_hits() %></td>
                		</tr>
                		<%} %>
              		</tbody>
            	</table>
          	</div>
        </div>
	</div>
    <!-- /활동 -->

    <!-- 커뮤니티 -->
    <div class="container mt-5" style="padding:0px; border: 1px solid lightgray;">
    	<div class="col-lg-12 bg-light p-3" style="text-align: center; font-size: 22px">커뮤니티
    		<button class="d-flex ml-auto btn btn-secondary btn-sm" onClick="location.href = 'searchCom.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>'">더보기</button></div>
        <div class="col-lg-12 border border-light" style="padding: 0px">
        	<div class="table-responsive">
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
              			for(CommunityBean bean : searchComArr) {
              				String person = bean.getComm_admin() != null ? "관리자" : bean.getComm_nick();
            				String Type =bean.getComm_type()==0?"공지사항":"일반게시판";
            				String datestr = bean.getComm_date();
            				String [] date = datestr.split(" ");
            				String date_1 = date[0];
              		%>
                		<tr class="d-flex">
                			<%if(bean.getComm_type() == 0) {%>	 
                  			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  			<%}else { %>
		 					<td class="col-md-1 d-none d-lg-table-cell"> <%=bean.getComm_num() %></td>
		 					<%} %>
                  			<td class="col-md-1 d-none d-lg-table-cell"><%=Type %></td>
                  			<td class="col-md-5">
                    			<a class="h5 d-none d-lg-table-cell">
                    				<%=bean.getComm_title() %>
                    			</a>
                    			<a class="d-block d-sm-none text-truncate" style="max-width: 300px;"><%=bean.getComm_title() %></a>
                    			<p class="d-block d-sm-none">
                    				<small><%=person %> <%=date_1%> 조회 <%=bean.getComm_hits() %></small>
                    			</p>
                  			</td>
                  			<td class="col-md-2 d-none d-lg-table-cell"><%=person %></td>
                  			<td class="col-md-2 d-none d-lg-table-cell"><%=date_1 %></td>
                  			<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_hits() %></td>
                		</tr>
                	<%	} %>
              		</tbody>
            	</table>
			</div>
		</div>
	</div>
    <!-- /커뮤니티 -->
    <br>
    <br>
<%@ include file="/footer.jsp" %>