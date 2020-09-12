<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="container py-3">
	<form action="list_act_writePro.jsp" method="post" id="act_form"
		enctype="multipart/form-data" onchange="setForm()">
		<h3>활동개요</h3>
		<hr />
		<h5>제목</h5>
		<input type="text" placeholder="제목" class="form-control"
			name="act_title" /> <br />

		<h5>종류</h5>
		<div class="row">
			<div class="col-md-3">
				<input type="radio" name="act_type" value="1" /> 대외활동
			</div>
			<div class="col-md-3">
				<input type="radio" name="act_type" value="2" /> 공모전
			</div>
		</div>
		<br />

		<div class="all">
			<h5>참여대상</h5>
			<input type="text" placeholder="참여대상" class="form-control"
				name="act_target" /> <br />

			<h5>접수기간</h5>
			<div class="row">
				<div class="col-md-6 input-group">
					<input type="text" placeholder="YYYY-MM-DD" class="form-control"
						name="act_start" />
					<div class="input-group-append">
						<div class="input-group-text">부터</div>
					</div>
				</div>
				<div class="col-md-6 input-group">
					<input type="text" placeholder="YYYY-MM-DD" class="form-control"
						name="act_end" />
					<div class="input-group-append">
						<div class="input-group-text">까지</div>
					</div>
				</div>
			</div>
			<br />

			<div class="activity">
				<h5>모집인원</h5>
				<input type="text" placeholder="모집인원" class="form-control"
					name="act_pop" /> <br />

				<h5>모임지역</h5>
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
				<br />
			</div>

			<h5>활동분야</h5>
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
			<br />

			<h5>관심분야</h5>
			<div class="row">
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="9" /> 여행/호텔/항공
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="10" /> 언론/미디어
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="11" /> 문화/역사
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="12" /> 행사/페스티벌
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="13" /> 교육
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="14" />
					디자인/사진/예술/영상
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="15" /> 경제/금융
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="16" />
					경영/컨설팅/마케팅
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="17" /> 정치/사회/법률
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="18" /> 체육/헬스
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="19" /> 의료/보건
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="20" /> 뷰티/미용/화장품
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="21" />
					과학/공학/기술/IT
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="22" /> 요리/식품
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="23" /> 창업/자기계발
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="24" /> 환경/에너지
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="25" /> 콘텐츠
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="26" /> 사회공헌/교류
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="27" /> 유통/물류
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="act_interest" value="28" /> 기타
				</div>
			</div>
			<br />

			<h5>홈페이지</h5>
			<input type="text" placeholder="홈페이지" class="form-control"
				name="act_home" /> <br /> <br />

			<h3>시상정보</h3>
			<hr />
			<div class="contest">
				<h5>시상규모</h5>
				<input type="text" placeholder="시상규모" class="form-control"
					name="act_award" /> <br />
			</div>

			<h5>활동혜택</h5>
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
					<input type="checkbox" name="act_reward" value="33" /> 전문가/임직원 멘토링
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
			<br /> <br />

			<h3>상세내용</h3>
			<textarea id="act_content" name="act_content"></textarea>
			<br /> <br />

			<h3>이미지</h3>
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<div class="input-group-text">썸네일</div>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input form-control"
						name="act_thumb" onchange="get_thumb_filename()" /> <label
						class="custom-file-label" id="thumb_filename">썸네일</label>
				</div>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<div class="input-group-text">포스터</div>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input form-control"
						name="act_post" onchange="get_post_filename()" /> <label
						class="custom-file-label" id="post_filename">포스터</label>
				</div>
			</div>
			<br /> <br />
		</div>
		<input type="button" class="btn btn-cam btn-block"
			onclick="act_submit()" value="게시 요청">
	</form>
</div>
<%@ include file="../footer.jsp"%>
<script src="../js/activity.js"></script>
<script>
	$(document).ready(function() {
		$(".all").hide();
	});
	function setForm() {
		switch ($("#act_form input[name='act_type']:checked").val()) {
		case "1":
			$(".all").show();
			$(".contest").hide();
			$(".activity").show();
			$("#act_form input[name='act_award']").val(null);
			break;
		case "2":
			$(".all").show();
			$(".activity").hide();
			$(".contest").show();
			$("#act_form input[name='act_pop']").val(null);
			$("#act_form input[name='act_reg']").prop("checked", false);
			break;
		}
	}
</script>