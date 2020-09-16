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
									name="act_thumb"  onchange="get_thumb()" /> <label
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
								<p>모집인원</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=activity.getAct_pop()%>" name="act_pop" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>모임지역</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#regionModal').modal();"
									value="<%=manager.getTag(activity.getAct_reg())%>"
									id="act_reg_view"/>
							</div>
							<div class="col-md-2">
								<p>활동혜택</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#rewardModal').modal();"
									value="<%for (int act_reward : activity.getAct_reward()) {
															out.print(manager.getTag(act_reward) + " ");
									}%>"
									id="act_reward_view"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<p>활동분야</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#fieldModal').modal();"
									value="<%=manager.getTag(activity.getAct_field())%>"
									id="act_field_view"/>
							</div>
							<div class="col-md-2">
								<p>관심분야</p>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									onclick="$('#interestModal').modal();"
									value="<%for (int act_interest : activity.getAct_interest()) {
														out.print(manager.getTag(act_interest) + " ");
									}%>"
									id="act_interest_view"/>
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
				<input type="button" class="btn btn-cam btn-block" onclick="act_update(<%=act_num%>)" value="수정하기">
			</div>
			<br />
		</form>
	</div>

	<div class="modal" tabindex="-1" id="regionModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">모임지역</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="act_reg" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-sm-12 col-md-3">
								<input type="radio" name="act_reg" value="43" /> 지역제한없음
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="44" /> 서울
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="45" /> 부산
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="46" /> 대구
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="47" /> 인천
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="48" /> 광주
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="49" /> 대전
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="50" /> 울산
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="51" /> 경기
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="52" /> 강원
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="53" /> 충청
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="54" /> 전라
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="55" /> 경상
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="56" /> 제주
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="57" /> 세종
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_reg" value="58" /> 해외
							</div>
						</div>
					</form>
				</div>
			</div>
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
					<form id="act_reward" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="29" /> 활동비
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="30" /> 사은품지급
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="31" /> 실무교육
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="32" /> 봉사활동기간
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="33" /> 전문가/임직원
								멘토링
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="34" /> 행사 참여
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="35" /> 수료증 및 인증서
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="reward_num" value="36" /> 입사시 혜택
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
					<h5 class="modal-title">활동분야</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="act_field" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="1" /> 서포터즈
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="2" /> 해외탐방
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="3" /> 봉사단
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="4" /> 마케터
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="radio" name="act_field" value="5" /> 기자단
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="6" /> 강연
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="7" /> 멘토링
							</div>
							<div class="col-md-3">
								<input type="radio" name="act_field" value="8" /> 기타
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" tabindex="-1" id="interestModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-cam text-white">
					<h5 class="modal-title">관심분야</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="act_interest" onchange="getValue(this)" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="9" /> 여행/호텔/항공
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="10" /> 언론/미디어
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="11" /> 문화/역사
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="12" /> 행사/페스티벌
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="13" /> 교육
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="14" />
								디자인/사진/예술/영상
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="15" /> 경제/금융
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="16" />
								경영/컨설팅/마케팅
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="17" />
								정치/사회/법률
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="18" /> 체육/헬스
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="19" /> 의료/보건
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="20" />
								뷰티/미용/화장품
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="21" />
								과학/공학/기술/IT
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="22" /> 요리/식품
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="23" /> 창업/자기계발
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="24" /> 환경/에너지
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="25" /> 콘텐츠
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="26" /> 사회공헌/교류
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="27" /> 유통/물류
							</div>
							<div class="col-md-3">
								<input type="checkbox" name="interest_num" value="28" /> 기타
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp"%>
<script>
	$("#act_reg input[value=<%=activity.getAct_reg()%>]").prop("checked", true);
	$("#act_field input[value=<%=activity.getAct_field()%>]").prop("checked", true);
</script>
<%
	for (int act_reward : activity.getAct_reward()) {
		%>
		<script>
			$("#act_reward input[value=<%=act_reward%>]").prop("checked", true);
		</script>
		<%
	}
	for (int act_interest : activity.getAct_interest()) {
		%>
		<script>
			$("#act_interest input[value=<%=act_interest%>]").prop("checked", true);
		</script>
		<%
	}
%>
<script>
	$.cookie("act_type", <%=activity.getAct_type()%>);
</script>