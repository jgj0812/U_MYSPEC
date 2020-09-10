<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container mt-3">
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 -->
	    <nav>
	      <div class="nav" id="nav-tab" role="tablist">
	        <a class="nav-item nav-link active" id="nav-field-tab" data-toggle="tab" href="#nav-field" role="tab"
	          aria-controls="nav-field" aria-selected="true">활동분야</a>
	        <a class="nav-item nav-link" id="nav-interest-tab" data-toggle="tab" href="#nav-interest" role="tab"
	          aria-controls="nav-profile" aria-selected="false">관심분야</a>
	        <a class="nav-item nav-link" id="nav-reward-tab" data-toggle="tab" href="#nav-reward" role="tab"
	          aria-controls="nav-reward" aria-selected="false">활동혜택</a>
	        <a class="nav-item nav-link" id="nav-region-tab" data-toggle="tab" href="#nav-region" role="tab"
	          aria-controls="nav-region" aria-selected="false">모임지역</a>
	      </div>
	      
	   		<!--360미만이면 보이는 modal 띄우는 버튼 -->
	      <div class="modalbutton">
	        <button class="btn" data-toggle="modal" data-target="#field"> 활동분야 </button>
	        <button class="btn" data-toggle="modal" data-target="#interest"> 관심분야 </button>
	        <button class="btn" data-toggle="modal" data-target="#reward"> 활동혜택 </button>
	        <button class="btn" data-toggle="modal" data-target="#region"> 모임지역 </button>
	      </div>
	    </nav>
		
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 의 서브태그-->
	    <form id="tagForm" onchange="tagSearch()">
	      <div class="tab-content" id="nav-tabContent">
	
	        <div class="tab-pane fade show active btn-group-toggle" id="nav-field" role="tabpanel"
	          aria-labelledby="nav-field-tab">
	
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="1"> 서포터즈
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="2">해외탐방
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="3">봉사단
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="4">마케터
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="5">기자단
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="6">강연
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="7">멘토링
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="8">기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-interest" role="tabpanel"
	          aria-labelledby="nav-interest-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="9">여행/호텔/항공
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="10">언론/미디어
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="11">문화/역사
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="12">행사/페스티벌
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="13">교육
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="14">디자인/사진/예술/영상
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="15">경제/금융
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="16">경영/컨설팅/마케팅
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="17">정치/사회/법률
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="18">체육/헬스
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="19">의료/보건
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="20">뷰티/미용/화장품
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="21">과학/공학/IT
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="22">요리/식품
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="23">창업/자기계발
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="24">환경/에너지
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="25">콘텐츠
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="26">사회공헌/교류
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="27">유통/물류
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="interest_num" value="28">기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-reward" role="tabpanel" aria-labelledby="nav-reward-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="29">활동비
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="30">사은품지급
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="31">실무교육
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="32">봉사활동시간
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="33">전문가/임직원멘토링
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="34">행사참여
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="35">수료증및인증서
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="36">입사시혜택
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="37">인턴쉽기회
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="38">교통비
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-region" role="tabpanel" aria-labelledby="nav-region-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="43">지역제한없음
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="44">서울
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="45">부산
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="46">대구
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="47">인천
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="48">광주
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="49">대전
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="50">울산
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="51">경기
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="52">강원
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="53">충청
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="54">전라
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="55">경상
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="56">제주
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="57">세종
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_reg" value="58">해외
	          </label>
	        </div>
	      </div>
	      
	      <!-- -360미만이면 보이는 modal -->
	    <div class="modal fade" id="field" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">활동분야 </h5>
	          </div>
	
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="1"> 서포터즈
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="2"> 해외탐방
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="3"> 봉사단
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="4"> 마케터
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="5"> 기자단
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="6"> 강연
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="7"> 멘토링
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_field" value="8"> 기타
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="interest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">관심분야</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="9"> 여행/호텔/항공
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="10"> 언론/미디어
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="11"> 문화/역사
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="12"> 행사/페스티벌
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="13"> 교육
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="14"> 디자인/사진/예술/영상
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="15"> 경제/금융
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="16"> 경영/컨설팅/마케팅
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="17"> 정치/사회/법률
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="18"> 체육/헬스
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="19"> 의료/보건
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="20"> 뷰티/미용/화장품
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="21"> 과학/공학/IT
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="22"> 요리/식품
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="23"> 창업/자기계발
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="24"> 환경/에너지
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="25"> 콘텐츠
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="26"> 사회공헌/교류
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="27"> 유통/물류
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="interest_num" value="28"> 기타
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="reward" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">활동혜택</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="29"> 활동비
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="30"> 사은품지급
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="31"> 실무교육
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="32"> 봉사활동시간
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="33"> 전문가/임직원멘토링
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="34"> 행사참여
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="35"> 수료증및인증서
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="36"> 입사시혜택
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="37"> 인턴쉽기회
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="reward_num" value="38"> 교통비
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="region" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">모임지역</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="43"> 지역제한없음
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="44"> 서울
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="45"> 부산
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="46"> 대구
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="47"> 인천
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="48"> 광주
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="49"> 대전
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="50"> 울산
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="51"> 경기
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="52"> 강원
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="53"> 충청
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="54"> 전라
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="55"> 경상
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="56"> 제주
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="57"> 세종
	            </label>
	            <label class="btn">
	              <input type="checkbox" name="act_reg" value="58"> 해외
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	    </form>

		<!-- 선택한 서브태그 보이는 부분-->
	    <div class="choice">
	      <div id="choicetag">
	      </div>
	      <button id="reset" onclick="tagReset()"><i class="fas fa-redo"></i> 초기화</button>
	      
	    </div>
	
		<br><br>
		<div class="d-flex justify-content-between">
		<div id="activityCount">검색결과 건</div>
		<select class="form-control" id="activityListOrder" style="width: 110px" onchange="tagSearch()">
			<option value="1">최신순</option>
			<option value="2">마감순</option>
			<option value="3">스크랩순</option>
			<option value="4">댓글순</option>
		</select>
        </div>
	    <br><br>
	    
		<!-- 리스트 -->
	    <div class="container_search" id="activityList">
    	</div>
    	<br>
    	<br>
	    <!--  페이징 -->
	   <div class="form-inline justify-content-center">		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true" class="text-dark" style="font-weight:bolder;">처음</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
		    <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
		    <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true" class="text-dark" style="font-weight:bolder;">끝</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
<br>
</div>
<%@ include file="../footer.jsp" %>
<script>
	$(document).ready(function() {
		$.ajax({
			url: "list_actPro.jsp",
			data: {
				act_type: 1,
				order: $("#activityListOrder option:selected").val(),
				start: 1,
				end: 16
			},
			dataType: "json",
			cache: false,
			success: function(data) {
				getActivityList(data);
			}
		});
	});
</script>