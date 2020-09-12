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
		<form action="list_con_updatePro.jsp" method="post" id="act_form">
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
						<i class="fas fa-eye"></i> <i class="far fa-square"></i>
					</h3>
				</div>
			</div>
			<hr />

			<div class="section">
				<div class="row">
					<div class="col-md-4">
						<img src="../upload/<%=activity.getAct_post()%>" width="100%" />
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
								<input type="text" class="form-control"
									value="<%=activity.getAct_start()%>" name="act_start" /> - <input
									type="text" class="form-control"
									value="<%=activity.getAct_end()%>" name="act_end" />
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
								<p>활동혜택</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#rewardModal').modal();"
									value="<%for (int act_reward : activity.getAct_reward()) {
															out.print(manager.getTag(act_reward) + " ");
														}%>"
									name="act_reward" />
							</div>
							<div class="col-md-2">
								<p>공모분야</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#fieldModal').modal();"
									value="<%=manager.getTag(activity.getAct_field())%>"
									name="act_field" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>홈페이지</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="act_home" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />

			<div class="section">
				<h5>상세내용</h5>
				<textarea id="act_content"><%=activity.getAct_content()%></textarea>
				<button class="btn btn-cam btn-block">수정하기</button>
			</div>
			<br />
		</form>

		<div class="section">
			<form>
				<h5>담당자 Q&A</h5>
				<div class="form-group">
					<textarea class="form-control"></textarea>
					<input class="btn btn-cam btn-block" type="button" value="등록" />
				</div>
			</form>
		</div>
	</div>

	<div class="modal" tabindex="-1" id="rewardModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">활동혜택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="29" /> 활동비
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="30" /> 사은품지급
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="31" /> 실무교육
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="32" /> 봉사활동기간
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="33" /> 전문가/임직원
							멘토링
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="34" /> 행사 참여
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="35" /> 수료증 및 인증서
						</div>
						<div class="col-md-3">
							<input type="checkbox" name="act_reward" value="36" /> 입사시 혜택
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-cam">저장</button>
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
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-cam">저장</button>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp"%>