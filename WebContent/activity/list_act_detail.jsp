<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>

<%@page import="mySpec.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="Rmgr" class="mySpec.ActivityMgr" />
<jsp:useBean id="Rbean" class="mySpec.ActivityReplyBean" />
<jsp:setProperty property="*" name="Rbean"/>

<style>
 .recontent{
 	width: 800px; 
 	margin-left:20px; 
 	height:60px; 
 	font-weight:bolder;
 }
 .rebtn{
 	width:75px; 
 	margin-left:10px; 
 	margin-bottom:40px; 
 	height:60px; 
 	background-color:#aaaaaa; 
 	color:white;
 }
 
@media (max-width:360px) {
	.recontent{
		width: 200px;
		height:55px;
	 }
	 .rebtn{
	 	width:60px; 	
	 	height:55px; 
	
	 }
 
}
</style>

<%
	int member = -1;
	if(id != null) {
		member = (int)session.getAttribute("member");
	}
	request.setCharacterEncoding("utf-8");
	//act_num 글번호
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	ActivityMgr manager = new ActivityMgr();
	ActivityBean activity = manager.getActivity(act_num);
	OrgBean org = manager.getOrg(act_num);
	
	//댓글 리스트 보여주기
	ArrayList<ActivityReplyBean> actRe_arr  = Rmgr.act_reply_list(act_num);
	
	//댓글 수
	int count = Rmgr.act_reply_count(act_num);
		
%>
<section>
	<div class="container">
		<div class="section">
			<p class="badge badge-secondary">D-<%=activity.getAct_dday() %></p>
			<div class="d-flex">
				<h3><%=activity.getAct_title() %></h3>
				<h3 class="ml-auto">
					<i class="fas fa-eye" data-toggle="tooltip" data-placement="bottom" title="<%="조회수 : " + activity.getAct_hits() %>"></i>&nbsp;<i class="fas fa-share-alt-square" onclick="$('#shareModal').modal();" " data-toggle="tooltip" data-placement="bottom" title="공유하기"></i>
				</h3>
			</div>
		</div>
		<hr>

		<div class="section">
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img src="../upload/<%=activity.getAct_thumb() %>" width="100%">
					</div>
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
							<p><a href="<%=activity.getAct_home() %>" style="color: blue;">홈페이지 이동</a></p>
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
		<div class="reply" style="background-color:#eeeeee;">
		
		<h5 class="p-3">담당자 Q&A [<%=count %>]</h5>
		<hr>
			<%
			int i = 0;
			for(ActivityReplyBean actRB :actRe_arr){
				String repPerson = actRB.getRep_org() != null ? actRB.getRep_orgName() : actRB.getRep_nick();
										//rep_org가 널이 아니면 rep_orgName을, 널이면 글쓴사람 닉네임을
				int recount = Rmgr.act_rereply_count(act_num, actRB.getRep_num());
										
	      		i++;
	
		%>
		<div class="reply_div">
			<!-- 댓글 기본 div -->
			<div id="basic<%=i%>" style="display: block"> 
		        <!-- 닉네임 날짜 -->
		        <div class="row" style="font-size:0.85rem;" >
		            <p style="margin-left:40px;"><%=repPerson%></p> <!-- 닉네임 -->  
		            <p style="margin-left:20px;"><%=actRB.getRep_date()%></p> <!-- 날짜 -->
		        </div>
		      
		        <!-- 댓글내용 -->
		        <div style="margin-left:30px; font-size:1rem;" id="re_content<%=i %>"><%=actRB.getRep_content()%></div> 
		        <br>
		        <!-- 답글보기 삭제 수정 답글 -->
		        <div>
		            <!-- 답글 리스트 보기  -->
		            <div style="font-size:0.75rem; margin-left:20px; float: left;"> 
		                <input type="button" style="border: 0px" value="답글보기[<%=recount %>]" onclick="rereplylist(<%=i%>)">
		           
		            </div>
		        
		            <!-- 삭제 수정 답글 -->
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
		            
		            <!-- 일반회원일때 member 0 id = id.trim().equals(actRB.getRep_person())
		               	  단체회원일때 member 1 id = id.trim().equals(actRB.getRep_org()) -->
		            
		                <% if(member == 1){
		                	if(id != null &&id.trim().equals(actRB.getRep_org())){%>	
		                <!-- 삭제  -->
		                <form action="list_actreply_deletePro.jsp"> 
		                    <!-- 원래글로 돌아가기위한 글번호  -->
		                    <input type="hidden" name="act_num" value="<%= act_num%>">
		                    <input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
		                    <input type="hidden" name="rep_parent" value="<%=actRB.getRep_parent() %>">
		                    <input type="submit" style="border: 0px" value="삭제">  
		                </form>
		                
		                <!-- 수정  -->			
		                <form> 
		                    <input type="hidden" name="comm_num" value="<%= act_num%>">
		                    <input type="hidden" name="rep_num" value="<%=actRB.getRep_num()%>">
		                    <input type="button" style="border: 0px" value="수정"  onclick="update(<%=i%>)"> 
		                </form>	  
		                <%}}else if(member == 0){
		                	if(id != null &&id.trim().equals(actRB.getRep_person())){
		                %>	 
		                  <!-- 삭제  -->
		                <form action="list_actreply_deletePro.jsp"> 
		                    <!-- 원래글로 돌아가기위한 글번호  -->
		                    <input type="hidden" name="act_num" value="<%= act_num%>">
		                    <input type="hidden" name="rep_num" value="<%=actRB.getRep_num() %>">
		                    <input type="hidden" name="rep_parent" value="<%=actRB.getRep_parent() %>">
		                    <input type="submit" style="border: 0px" value="삭제">  
		                </form>
		                
		                <!-- 수정  -->			
		                <form> 
		                    <input type="hidden" name="comm_num" value="<%= act_num%>">
		                    <input type="hidden" name="rep_num" value="<%=actRB.getRep_num()%>">
		                    <input type="button" style="border: 0px" value="수정"  onclick="update(<%=i%>)"> 
		                </form>	  
		                <%}}%>
		                <!-- 답글달기  -->
		                <% if(id != null) { %>
		                <div>
		                    <input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
		                </div>	
		                <%} %>
		                
		            </div>	
		             <!-- 삭제 수정 답글 끝 -->
		             	            
		        </div>
		
		    <br>
		    <hr> 
		
		    </div> 
		    <!-- 댓글 기본 div끝  -->
		    	
		    <!-- 댓글 수정 div -->
		    <div id="update<%=i %>" style="display: none">
		        <form action ="list_actreply_updatePro.jsp" method="post" id="reply_update<%=i %>"> 
		            <div style="margin-bottom: 5px">
		                <input id="re_upcontent" name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=actRB.getRep_content()%>"> 
		                <input type="hidden" name="rep_num" value="<%=actRB.getRep_num()%>">
		                <input type="hidden" name="act_num" value="<%= act_num%>">
		            </div>
		            
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">			
		                <input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem" value="취소" onclick="updatecancel(<%=i%>)"> 
		                <input type="button" class="btn btn-danger" style="font-size: 0.75rem" value="수정" onclick="replyupdate_ok(<%=i%>)">  		
		            </div>
		            
		            <br>
		            <hr> 
		        </form>  	
		    </div>	
			<!-- 댓글 수정 div끝 -->
			
			<!-- 답글 입력폼  -->	
		    <div id="rereply<%=i%>" style="display: none">
		        <form action="list_act_replyPro.jsp" id="rereplyFrm<%=i %>" name="comm_rereply_form" method="post">
		            <input type="hidden" name="act_num" value="<%= act_num%>">
		            <!-- 부모댓글의 댓글번호를 부모댓글번호로 들고온다 -->
		            <input type="hidden" name="rep_parent" value="<%=actRB.getRep_num() %>">
		            
		            <div class="form-row">
		                 <img style="margin-left:30px; width: 15px; height: 20px" src="../img/rereply.png"> 
		                 
		                 <!-- 답글 입력창 -->
		                 <div id="rere_content">
		                   <input "id="rerep_content<%=i%>" name="rep_content"  type="text" class="form-control recontent" placeholder="답글을 입력해주세요." > 
		                 </div>
		                 
		                <!-- 답글 등록버튼 -->
		                <div id="rere_content">
		                    <input  
		                    type="button" onclick="rereply_ok(<%=i%>)" class="form-control rebtn" value="등록">
		                </div>
		            </div>		
		        </form>
		        <hr style="margin-top: 0px">
		    </div>
			<!-- 답글 입력폼   div끝 -->
			
			<!-- 답글 시작 -->
			
			 <div id="rereplylist<%=i %>" style="display: none">
		        <%
		    
		     	//답글 리스트 보여주기
		    	ArrayList<ActivityReplyBean> actRere_arr  = Rmgr.act_rereply_list(act_num, actRB.getRep_num());
		    
		        for(ActivityReplyBean actRB2 :actRere_arr){
					String repPerson2 = actRB2.getRep_org() != null ? actRB2.getRep_orgName() : actRB2.getRep_nick();
		             
		     	 %>
		     	 
		      	<div id="rereply_repeat<%=actRB2.getRep_num() %>" >
		       	 <!-- 닉네임 날짜 -->
		            <div class="row" style="font-size:0.85rem;" >
		                <img style="margin-left:50px; width: 15px; height: 20px" src="../img/rereply.png">
		                <p style="margin-left:10px;"><%=repPerson2%></p> <!-- 닉네임 -->
		                <p style="margin-left:20px;"><%=actRB2.getRep_date()%></p> <!-- 날짜 -->
		            </div>
		         
		         <!-- 댓글내용 -->
	            <div style="margin-left:65px; font-size:1rem;"><%=actRB2.getRep_content()%></div> 
		       
		        <!-- 답글보기 삭제 수정 답글 -->
            	<div>
               	 	<!-- 삭제 수정 답글 -->
	                <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
	                
	                   <% if(member == 1){
		                	if(id != null &&id.trim().equals(actRB2.getRep_org())){%>	
	                    <!-- 삭제  -->
	                    <form action="list_actreply_deletePro.jsp"> 
	                        <!-- 원래글로 돌아가기위한 글번호  -->
	                        <input type="hidden" name="act_num" value="<%=act_num%>">
	                        <input type="hidden" name="rep_num" value="<%=actRB2.getRep_num() %>">
	                        <input type="hidden" name="rep_parent" value="<%=actRB2.getRep_parent() %>">
	                        <input type="submit" style="border: 0px" value="삭제">  
	                    </form>
	                    
	                    <!-- 수정  -->			
	                    <form> 
	                        <input type="hidden" name="act_num" value="<%= act_num%>">
	                        <input type="hidden" name="rep_num" value="<%=actRB2.getRep_num() %>">
	                        <input type="button" style="border: 0px" value="수정"  onclick="rereupdate(<%=actRB2.getRep_num()%>)"> 
	                    </form>	  
	           			<%}}else if(member == 0){
		                	if(id != null &&id.trim().equals(actRB2.getRep_person())){
		                %>	
		                  <!-- 삭제  -->
	                    <form action="list_actreply_deletePro.jsp"> 
	                        <!-- 원래글로 돌아가기위한 글번호  -->
	                        <input type="hidden" name="act_num" value="<%=act_num%>">
	                        <input type="hidden" name="rep_num" value="<%=actRB2.getRep_num() %>">
	                        <input type="hidden" name="rep_parent" value="<%=actRB2.getRep_parent() %>">
	                        <input type="submit" style="border: 0px" value="삭제">  
	                    </form>
	                    
	                    <!-- 수정  -->			
	                    <form> 
	                        <input type="hidden" name="act_num" value="<%= act_num%>">
	                        <input type="hidden" name="rep_num" value="<%=actRB2.getRep_num() %>">
	                        <input type="button" style="border: 0px" value="수정"  onclick="rereupdate(<%=actRB2.getRep_num()%>)"> 
	                    </form>	 
	                     <%}}%> 
	                </div>  
	                
            	</div>	
        	
	        	<br>
	        	<hr>
        	</div> <!-- rereply_repeat -->
        	
        	<!-- 답글 수정 div -->
		    <div id="rereupdate<%=actRB2.getRep_num() %>" style="display: none">
		        <form action ="list_actreply_updatePro.jsp" method="post" id="rereply_update<%=actRB2.getRep_num() %>"> 
		            <div style="margin-bottom: 5px">
		                <input id="rere_upcontent" name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=actRB2.getRep_content()%>"> 
		                <input type="hidden" name="rep_num" value="<%=actRB2.getRep_num() %>">
		                <input type="hidden" name="act_num" value="<%= act_num%>">
		            </div>
		            
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">			
		                <input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem"  value="취소" onclick="rereupdatecancel(<%=actRB2.getRep_num() %>)"> 
		                <input type="button" class="btn btn-danger" style="font-size: 0.75rem" value="수정"  onclick="rereplyupdate_ok(<%=actRB2.getRep_num() %>)">  		
		            </div>
		            
		            <br>
		            <hr> 
		        </form>  	
		    </div>
        	<%} %>
		    </div>
		
		</div><!-- reply_div 끝 -->
		
		<% } //actRe_arr끝%>
		
	
		<!-- ----------------------댓글 입력폼--------------------- -->
		 <%
	        if(id != null) {
	    %>				
	    <form action="list_act_replyPro.jsp" id="replyFrm" name="comm_reply_form" method="post">
	        <!-- 글번호 -->
	        <input type="hidden" name="act_num" value="<%= act_num%>">
	        <!-- 부모댓글번호 -->
	        <input type="hidden" name="rep_parent" value="0">
	        
	        <div class="form-row" >
	            <div class="col-8">
	            <input id="rep_content" name="rep_content" style=" margin-left:20px; height:70px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력하세요"> 
	            
	            </div>
	            
	            <div class="col-2">
	                <input style="width:70px; margin-left:20px; margin-bottom:40px; height:70px; background-color:#aaaaaa; color:white;" type="button" onclick="reply_ok()" class="form-control" value="등록">
	            </div>
	
	    <%	}else { %>
	        <div class="container">
	            <p style="margin-left: 20px">댓글을 입력하려면 로그인을 해야합니다.</p>
	            <br>
	        </div>
	    </form>
	
	    <%	} %>
		</div> <!-- reply -->
  
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
