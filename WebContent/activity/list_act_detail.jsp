<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>

<%@page import="mySpec.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="Rmgr" class="mySpec.ActivityMgr" />
<jsp:useBean id="Rbean" class="mySpec.ActivityReplyBean" />
<jsp:setProperty property="*" name="Rbean"/>

<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	
	ActivityMgr manager = new ActivityMgr();
	ActivityBean activity = manager.getActivity(act_num);
	OrgBean org = manager.getOrg(act_num);
	
	manager.upHit(act_num);
	
	

	
	//댓글 리스트 보여주기
	ArrayList<ActivityReplyBean> actRe_arr  = Rmgr.act_reply_list(act_num);
	
		
%>
<section>
	<div class="container">
		<div class="section">
			<p class="badge badge-secondary">D-<%=activity.getAct_dday() %></p>
			<div class="d-flex">
				<h3><%=activity.getAct_title() %></h3>
				<h3 class="ml-auto">
					<i class="fas fa-eye" data-toggle="tooltip" data-placement="bottom" title="<%="조회수 : " + activity.getAct_hits() %>"></i>&nbsp;<i class="fas fa-share-alt-square" onclick="$('#shareModal').modal();"></i>
				</h3>
			</div>
		</div>
		<hr>

		<div class="section">
			<div class="row">
				<div class="col-md-4">
					<img src="../upload/<%=activity.getAct_post() %>" width="100%">
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
							<p>모집인원</p>
						</div>
						<div class="col-md-4">
							<p><%=activity.getAct_pop() %></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>모임지역</p>
						</div>
						<div class="col-md-4">
							<p><%=manager.getTag(activity.getAct_reg()) %></p>
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
							<p>활동분야</p>
						</div>
						<div class="col-md-4">
							<p><%=manager.getTag(activity.getAct_field()) %></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<p>관심분야</p>
						</div>
						<div class="col-md-4">
							<p><%
							for(int act_interest : activity.getAct_interest()) {
								out.print(manager.getTag(act_interest) + " ");
							}
							%></p>
						</div>
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
		
		<h5 class="p-3">담당자 Q&A</h5>
		<hr>
		
<%
		int i = 0;

		for(ActivityReplyBean actRB :actRe_arr){
      	String repPerson = actRB.getRep_org() != null ? actRB.getRep_orgName() : actRB.getRep_nick();

			int wid=0;
			int h=0;
			int fontwid=0;
			int wid_margin=0;
			i++;
			 
			if(actRB.getRep_depth() > 0){

				wid = 25*(actRB.getRep_depth());
				fontwid=15;
				h=15;
				wid_margin = 25*(actRB.getRep_depth());
			}
%>	
	
	<div class ="reply_div">
		
		
		<!-- 문의 div  -->
		<div id="basic<%=i%>" style="display: block">
			<div class="row" style="font-size:0.75rem;" >
				<img src="" style="margin-left: 16px; width: <%=wid%>px;  height:<%=h%>px;"> <!-- 레벨 -->
				<i class="fas fa-reply" style="margin-left: 5px; font-size:<%=fontwid%>px "></i> <!-- 답글 이모지 -->
				<p style="margin-left:25px;"><%=repPerson %></p> <!-- 닉네임 -->
				<p style="margin-left:20px;"><%=actRB.getRep_date()%></p> <!-- 날짜 -->
			</div>
			
			<div style="margin-left:25px; font-size:1rem;">
				<img src="" style="margin-left: <%=wid_margin%>px; height:<%=h%>px;">
				<%=actRB.getRep_content()%>
			</div> <!-- 문의 내용 -->
			
			<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> <!-- 삭제 수정 답글 -->
				<!-- 삭제  -->
				<form action="list_actreply_deletePro.jsp">  
					<!-- 원래글로 돌아가기위한 글번호  -->
					<input type="hidden" name="act_num" value="<%= act_num%>">
					<input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
					<input type="submit" style="border: 0px" value="삭제">  
				</form>
				
				<!-- 수정  -->			
				<form> 
					<input type="hidden" name="act_num" value="<%= act_num%>">
					<input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
					<input type="button" style="border: 0px" value="수정"  onclick="update(<%=i%>)"> 
				</form> 
				 
				<!-- 답글 달기  -->
				<input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
			</div>
			<br>
		<hr> 
		</div>
		
		<!-- 구분선 -->

		<!-- 문의 수정 div -->
		
		<div id="update<%=i %>" style="display: none">
			<form action ="list_actreply_updatePro.jsp" method="post"> 
				<div style="margin-bottom: 5px">
					<input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=actRB.getRep_content()%>"> 
					<input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
					<input type="hidden" name="act_num" value="<%= act_num%>">
				</div>
				
				<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> <!-- 삭제 수정 답글 -->			
					<input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem"  value="취소" onclick="updatecancel(<%=i%>)"> 
					<input type="submit" class="btn btn-danger" style="font-size: 0.75rem" value="수정">  
					
				</div>
				<br>
				<hr> 
			</form>  	
		</div>

		<!-- 답글 입력폼  -->
		
		<div id="rereply<%=i%>" style="display: none">
			<form action="list_act_replyPro.jsp" name="act_reply_form" method="post">
				
				<input type="hidden" name="act_num" value="<%= act_num%>">
				<input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
				<input type="hidden" name="rep_ref" value="<%=actRB.getRep_ref() %>">
				<input type="hidden" name="rep_pos" value="<%=actRB.getRep_pos() %>">
				<input type="hidden" name="rep_depth" value="<%=actRB.getRep_depth() %>">
				
				<div class="form-row">
					 <i class="fas fa-reply" style="margin-left: 20px; font-size:25" ></i> <!-- 답글 이모지  -->
					 
					 <!-- 답글 입력창 -->
					 <div class="col-8">
					   <input name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요." > 
					 </div>
					 
					<!-- 답글 등록버튼 -->
					<div class="col-2">
						<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" type="submit" class="form-control" value="등록">
					</div>
				</div>
				
			</form>
			
			<hr style="margin-top: 0px">
		</div>
		
		
</div>

	
<%
		}

		if(id != null) {
%>				
	<!-- 댓글 입력폼  -->
	<form action="list_act_replyPro.jsp" name="act_reply_form" method="post">
	  	<!-- 글번호를 넘긴다 -->
	  	<input type="hidden" name="act_num" value="<%= act_num%>">
			  	
		<div class="form-row">
			 <div class="col-10">
			   <input name="rep_content" style="margin-left:20px; height:70px; font-weight:bolder;" 
			   type="text" class="form-control" placeholder="문의 내용을 입력해주세요." >
			</div>
			
			<div class="col-2">
				<input style="width:75px; margin-left:20px; margin-bottom:40px; height:70px;" 
				type="submit" class="form-control btn btn-cam btn-block" value="등록">
			</div>
<%		}else { %>
		<div class="container p-5">
			<p>문의 하시려면 로그인을 해야합니다.</p>
			<br>
		</div>
	</form>

		
	</div>

		
		
	
	<div class="modal" tabindex="-1" id="shareModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">링크공유</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex flex-row justify-content-around">
						<img src="img/share-facebook.png">
						<img src="img/share-naver.png">
						<img src="img/share-kakao.png">
					</div>
					<hr>
					<div class="input-group">
						<input type="text" class="form-control">
						<div class="input-group-append">
							<button class="btn btn-cam">복사</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%		} %>
</section>
<script src="../js/activity.js"></script>
<script type="text/javascript">

function rereply(i){
	var con = document.getElementById("rereply" + i);
	if(con.style.display =='none'){
		con.style.display = 'block';
	}else if(con.style.display =='block'){
		con.style.display = 'none';
	}
}

function update(i){
	var update = document.getElementById("update" + i);
	var basic = document.getElementById("basic" + i);
	
	if(update.style.display =='none'){
		update.style.display = 'block';
		basic.style.display = 'none';
	}else if(update.style.display =='block'){
		update.style.display = 'none';
		basic.style.display = 'block';
	}
}

function updatecancel(i){
	var update = document.getElementById("update" + i);
	var basic = document.getElementById("basic" + i);
	if(update.style.display =='block'){
		update.style.display = 'none';
		basic.style.display = 'block';
	}
}



</script>


<%@ include file="../footer.jsp" %>