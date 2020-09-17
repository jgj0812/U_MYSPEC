<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container mt-3">
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 -->
	    <nav>
	      <div class="nav" id="nav-tab" role="tablist">
	        <a class="nav-item nav-link active" id="nav-field-tab" data-toggle="tab" href="#nav-field" role="tab"
	          aria-controls="nav-field" aria-selected="true">공모분야</a>
	        <a class="nav-item nav-link" id="nav-award-tab" data-toggle="tab" href="#nav-award" role="tab"
	          aria-controls="nav-award" aria-selected="false">시상규모</a>
	        <a class="nav-item nav-link" id="nav-reward-tab" data-toggle="tab" href="#nav-reward" role="tab"
	          aria-controls="nav-reward" aria-selected="false">수상혜택</a>
	        <a class="nav-item nav-link" id="nav-org-tab" data-toggle="tab" href="#nav-org" role="tab"
	          aria-controls="nav-org" aria-selected="false">주최기관</a>
	      </div>
	      
	   		<!--360미만이면 보이는 modal 띄우는 버튼 -->
	      <div class="modalbutton">
	        <button class="btn" data-toggle="modal" data-target="#field"> 공모분야 </button>
	        <button class="btn" data-toggle="modal" data-target="#award"> 시상규모 </button>
	        <button class="btn" data-toggle="modal" data-target="#reward"> 수상혜택 </button>
	        <button class="btn" data-toggle="modal" data-target="#org"> 주최기관 </button>
	      </div>
	    </nav>
		
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 의 서브태그-->
	    <form id="tagForm" onchange="tagSearch()">
	      <div class="tab-content" id="nav-tabContent">
	
	        <div class="tab-pane fade show active btn-group-toggle" id="nav-field" role="tabpanel"
	          aria-labelledby="nav-field-tab">
	
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="59"> 기획/아이디어
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="60"> 광고/마케팅
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="61"> 사진/영상/UCC
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="62"> 디자인/순수미술/공예
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="63"> 네이밍/슬로건
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="64"> 캐릭터/만화/게임
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="65"> 건축/건설/인테리어
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="66"> 과학/공학
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="67"> 예체능/패션
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="68"> 전시/페스티벌
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="69"> 문학/시나리오
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="70"> 해외
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="71"> 학술
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="72"> 창업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_field" value="73"> 기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-award" role="tabpanel"
	          aria-labelledby="nav-award-tab">
		      <label class="btn btn-tag">
	            <input type="checkbox" name="act_award" value="74"> 1천만원 미만
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_award" value="75"> 1천만원 ~ 3천만원
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_award" value="76"> 3천만원 ~ 5천만원
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="act_award" value="77"> 5천만원 이상
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-reward" role="tabpanel" aria-labelledby="nav-reward-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="78"> 입사시 가산점
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="79"> 인턴/정규직채용
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="80"> 해외연수, 전시기회
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="81"> 실제상용화
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="82"> 상장 수여
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="reward_num" value="83"> 기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-org" role="tabpanel" aria-labelledby="nav-org-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="88"> 대기업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="89"> 중소기업/스타트업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="90"> 공공기관/공기업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="91"> 외국계기업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="92"> 중견기업
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="93"> 비영리단체/협회/교육재단
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="94"> 동아리/학생자치단체
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="95"> 병원
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox" name="org_type" value="96"> 기타
	          </label>
	        </div>
	      </div>
	      
	      <!-- -360미만이면 보이는 modal -->
	    <div class="modal fade" id="field" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">공모분야</h5>
	          </div>
	
	          <div class="modal-body">
	            <label class="btn">
		            <input type="checkbox" name="act_field" value="59"> 기획/아이디어
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="60"> 광고/마케팅
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="61"> 사진/영상/UCC
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="62"> 디자인/순수미술/공예
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="63"> 네이밍/슬로건
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="64"> 캐릭터/만화/게임
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="65"> 건축/건설/인테리어
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="66"> 과학/공학
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="67"> 예체능/패션
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="68"> 전시/페스티벌
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="69"> 문학/시나리오
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="70"> 해외
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="71"> 학술
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="72"> 창업
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="act_field" value="73"> 기타
		          </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="award" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">시상규모</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn">
	            <input type="checkbox" name="act_award" value="74"> 1천만원 미만
	          </label>
	          <label class="btn">
	            <input type="checkbox" name="act_award" value="75"> 1천만원 ~ 3천만원
	          </label>
	          <label class="btn">
	            <input type="checkbox" name="act_award" value="76"> 3천만원 ~ 5천만원
	          </label>
	          <label class="btn">
	            <input type="checkbox" name="act_award" value="77"> 5천만원 이상
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
	
	            <h5 class="modal-title" id="myModalLabel">수상혜택</h5>
	          </div>
	          <div class="modal-body">
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="78"> 입사시 가산점
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="79"> 인턴/정규직채용
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="80"> 해외연수, 전시기회
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="81"> 실제상용화
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="82"> 상장 수여
		          </label>
		          <label class="btn">
		            <input type="checkbox" name="reward_num" value="83"> 기타
		          </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="org" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">주최기관</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="88"> 대기업
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="89"> 중소기업/스타트업
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="90"> 공공기관/공기업
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="91"> 외국계기업
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="92"> 중견기업
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="93"> 비영리단체/협회/교육재단
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="94"> 동아리/학생자치단체
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="95"> 병원
		          </label>
		          <label class="btn btn-tag">
		            <input type="checkbox" name="org_type" value="96"> 기타
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
		  </ul>
		</nav>
	</div>
<br>
</div>
<%@ include file="../footer.jsp" %>
<script>
	$.cookie("act_type", 2);
	$.cookie("pageNum", 1);
	
	$(document).ready(function() {
		getPage($.cookie("pageNum"));
	});
</script>