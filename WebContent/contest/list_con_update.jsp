<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.ActivityBean"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	ActivityMgr manager = new ActivityMgr();
	ActivityBean activity = manager.getActivity(act_num);
	OrgBean org = manager.getOrg(act_num);
%>
<section>
	<div class="container">
		<form method="post" id="act_form" enctype="multipart/form-data">
			<div class="section">
				<div>
					<p class="badge badge-secondary">
						D-<%=activity.getAct_dday()%></p>
				</div>
				<div class="d-flex">
					<h3 class="flex-grow-1">
						<input type="text" value="<%=activity.getAct_title()%>"
							name="act_title" class="form-control border-0">
					</h3>
					&nbsp;
					<h3>
						<i class="fas fa-eye" data-toggle="tooltip" data-placement="bottom" title="<%="조회수 : " + activity.getAct_hits() %>"></i>
						&nbsp;
						<%
							switch(activity.getAct_approve()) {
							case 0:
								%><i class="far fa-square" data-toggle="tooltip" data-placement="bottom" title="승인대기"></i><%
								break;
							case 1:
								%><i class="far fa-check-square" data-toggle="tooltip" data-placement="bottom" title="승인"></i><%
								break;
							}
						 %>
					</h3>
				</div>
			</div>
			<hr />

			<div class="section">
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
						<img src="../upload/<%=activity.getAct_thumb()%>" width="100%" id="thumb_image"/>
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">썸네일</div>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input form-control"
									name="act_thumb" onchange="get_thumb()" /> <label
									class="custom-file-label" id="thumb_filename"><%=activity.getAct_thumb()%></label>
							</div>
						</div>
					</div>
					<div class="col-md-8 d-flex flex-column">
						<div class="row">
							<div class="col-md-12">
								<h5><%=org.getName()%></h5>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>기관형태</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=manager.getTag(org.getType())%>" />
							</div>
							<div class="col-md-2">
								<p>참여대상</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=activity.getAct_target()%>" name="act_target" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>접수기간</p>
							</div>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">시작</span>
									</div>
									<input type="text" class="form-control"
										value="<%=activity.getAct_start()%>" name="act_start" />
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">마감</span>
									</div>
									<input type="text" class="form-control"
										value="<%=activity.getAct_end()%>" name="act_end" />
								</div>
							</div>
							<div class="col-md-2">
								<p>시상규모</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=activity.getAct_award()%>" name="act_award" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>수상혜택</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#rewardModal').modal();"
									value="<%for (int act_reward : activity.getAct_reward()) {
															out.print(manager.getTag(act_reward) + " ");
														}%>"
									id="act_reward_view" />
							</div>
							<div class="col-md-2">
								<p>공모분야</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#fieldModal').modal();"
									value="<%=manager.getTag(activity.getAct_field())%>"
									id="act_field_view" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>홈페이지</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="act_home" value="<%=activity.getAct_home()%>"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />

			<div class="section">
				<h5>상세내용</h5>
				<textarea id="act_content" name="act_content"><%=activity.getAct_content()%></textarea>
				<input type="button" class="btn btn-cam btn-block" onclick="con_update(<%=act_num%>)" value="수정하기">
			</div>
			<br />
		</form>
	</div>

	<div class="modal" tabindex="-1" id="rewardModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">수상혜택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="act_reward" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="78"> 입사시 가산점
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="79"> 인턴/정규직채용
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="80"> 해외연수, 전시기회
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="81"> 실제상용화
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="82"> 상장 수여
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="83"> 기타
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" tabindex="-1" id="fieldModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">공모분야</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="act_field" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="59" /> 기획/아이디어
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="60" /> 광고/마케팅
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="61" /> 사진/영상/UCC
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="62" /> 디자인/순수미술/공예
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="63" /> 네이밍/슬로건
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="64" /> 캐릭터/만화/게임
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="65" /> 건축/건설/인테리어
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="66" /> 과학/공학
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="67" /> 예체능/패션
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="68" /> 전시/페스티벌
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="69" /> 문학/시나리오
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="70" /> 해외
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="71" /> 학술
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="72" /> 창업
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="73" /> 기타
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp"%>
<%
	for (int act_reward : activity.getAct_reward()) {
		%>
		<script>
			$("#act_reward input[value=<%=act_reward%>]").prop("checked", true);
		</script>
		<%
	}
	%>
	<script>
		$("#act_field input[value=<%=activity.getAct_field()%>]").prop("checked", true);
	</script>
	<%
%>
<script>
	$.cookie("act_type", <%=activity.getAct_type()%>);
</script>