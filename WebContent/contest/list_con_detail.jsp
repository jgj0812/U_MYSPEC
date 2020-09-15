<%@page import="java.sql.Date"%>
<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.ActivityBean"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	
	ActivityMgr manager = new ActivityMgr();
	ActivityBean activity = manager.getActivity(act_num);
	OrgBean org = manager.getOrg(act_num);
%>
<section>
	<div class="container">
		<div class="section">
			<p class="badge badge-secondary">D-<%=activity.getAct_dday() %></p>
			<div class="d-flex">
				<h3><%=activity.getAct_title() %></h3>
				<h3 class="ml-auto">
					<i class="fas fa-eye" data-toggle="tooltip" data-placement="bottom" title="<%="조회수 : " + activity.getAct_hits() %>"></i>&nbsp;<i class="fas fa-share-alt-square" onclick="$('#shareModal').modal();" data-toggle="tooltip" data-placement="bottom" title="공유하기"></i>
				</h3>
			</div>
		</div>
		<hr>

		<div class="section">
			<div class="row">
				<div class="col-md-4">
					<img src="../upload/<%=activity.getAct_thumb() %>" width="100%">
				</div>
				<div class="col-md-8 d-flex flex-column">
					<div class="row">
						<div class="col-md-12">
							<h5><%=org.getName() %></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>기관형태</p>
						</div>
						<div class="col-md-4">
							<p><%=manager.getTag(org.getType()) %></p>
						</div>
						<div class="col-md-2">
							<p>참여대상</p>
						</div>
						<div class="col-md-4">
							<p><%=activity.getAct_target() %></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>접수기간</p>
						</div>
						<div class="col-md-4">
							<p><%=activity.getAct_start() %> - <%=activity.getAct_end() %></p>
						</div>
						<div class="col-md-2">
							<p>시상규모</p>
						</div>
						<div class="col-md-4">
							<p><%=activity.getAct_award() %></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>활동혜택</p>
						</div>
						<div class="col-md-4">
							<p><%
							for(int act_reward : activity.getAct_reward()) {
								out.print(manager.getTag(act_reward) + " ");
							}
							%></p>
						</div>
						<div class="col-md-2">
							<p>공모분야</p>
						</div>
						<div class="col-md-4">
							<p><%=manager.getTag(activity.getAct_field()) %></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>홈페이지</p>
						</div>
						<div class="col-md-4">
							<p><%=activity.getAct_home() %></p>
						</div>
					</div>
					<div class="row h-100 align-content-end">
						<div class="col-md-12">
						  <button class="btn btn-cam btn-block" onclick="scrap('<%=id %>', <%=act_num %>)">스크랩</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="section">
			<h5>상세내용</h5>
			<%=activity.getAct_content() %>
		</div>
		<br>

		<div class="section">
			<div class="row">
				<div class="col-md-12">
					<h5>담당자 정보</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<p>담당자</p>
				</div>
				<div class="col-md-8"><%=org.getManager() %></div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<p>연락처</p>
				</div>
				<div class="col-md-8"><%=org.getPhone() %></div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<p>이메일</p>
				</div>
				<div class="col-md-8"><%=org.getEmail() %></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<input class="btn btn-cam btn-block" type="button" value="문의하기" onclick="location.href='mailto://<%=org.getEmail() %>'">
				</div>
			</div>
		</div>
		<br>

		<div class="section">
			<form>
				<h5>담당자 Q&A</h5>
				<div class="form-group">
					<textarea class="form-control"></textarea>
					<input class="btn btn-cam btn-block" type="button" value="등록">
				</div>
			</form>
		</div>
	</div>
	
	<div class="modal" tabindex="-1" id="shareModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">링크공유</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex flex-row justify-content-around">
						<i class="fab fa-facebook-square" onclick="facebook(<%=act_num %>)" style="font-size: 50px; color: #3b5998;"></i>	
						<i class="fab fa-twitter-square" onclick="twitter(<%=act_num %>)" style="font-size: 50px; color: #00acee;"></i>
						<img src="<%=request.getContextPath() %>/img/line.png" onclick="line(<%=act_num %>)" style="width: 50px; height: 50px;">
					</div>
					<hr>
					<div class="input-group">
						<input type="text" class="form-control" value="<%=request.getRequestURL() + "?" + request.getQueryString() %>" id="copyURL">
						<div class="input-group-append">
							<button class="btn btn-cam" onclick="copy_to_clipboard()">복사</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp" %>
<script>
	$.cookie("act_type", <%=activity.getAct_type()%>);
</script>
