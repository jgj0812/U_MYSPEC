<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="myspec.js"></script>
<jsp:useBean id="agr" class="mySpec.MemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	int act_type = Integer.parseInt(request.getParameter("act_type"));
	String org_id = (String) session.getAttribute("orgId");
	MemberMgr mgr = new MemberMgr();
%>
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/myPage/myPage_sidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			
			<!-- 내용 -->
			<div class="container">
				<div class="card-header">
				<%
					switch(act_type) {
					case 1:
						%><h4 class="title">대외활동</h4><%
						break;
					case 2:
						%><h4 class="title">공모전</h4><%
						break;
					}
				%>
            </div>

            <div class="container_search" >
              <div class="row">
              <%
		          	// 리스트로 활동들 불러오기
		          	ArrayList<ActivityBean> alist = agr.act_Org(act_type, org_id);
		          	
		          	for(int i = 0; i < alist.size(); i++) {
		          		if(alist.get(i).getAct_approve() == 1 ) {  // 승인여부 approve 가 1이면
              %>
                <div class="col-6 col-sm-6 col-lg-3" id="col<%=i %>">
                  <a href="../activity/list_act_detail.jsp?act_num=<%=alist.get(i).getAct_num() %>"
                    >
                    <div class="thumbnail">
                   		<img src="../upload/<%=alist.get(i).getAct_thumb() %>"/>
                    </div>
                  </a>
                  <br />
                  <div class="list_explain">
                    <a href="#"
                      ><div class="list_explain_title"><%=alist.get(i).getAct_title()  %><br /></div
                    ></a>
                    <%=alist.get(i).getOrg_name() %><br />
                       D-<%=alist.get(i).getAct_dday() %>   조회수 <%=alist.get(i).getAct_hits() %>
                  </div>
                  <a href="../activity/list_act_update.jsp?act_num=<%=alist.get(i).getAct_num() %>" class="btn btn-secondary btn-block mt-2" class="container">
                    수정하기
                  </a>
                  <br>
                </div>
               	<%	
		          		}
					}
				%>
              
              </div>
             </div>				
			</div>
			<!-- /내용 -->
		</div>
		<!-- /#page Content -->
	</div>

	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>