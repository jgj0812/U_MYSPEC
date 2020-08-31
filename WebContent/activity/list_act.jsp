<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container mt-3">
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 -->
	    <nav>
	      <div class="nav nav-tabs tab-a" id="nav-tab" role="tablist">
	        <a class="nav-item nav-link active" id="nav-field-tab" data-toggle="tab" href="#nav-field" role="tab"
	          aria-controls="nav-field" aria-selected="true">활동분야</a>
	        <a class="nav-item nav-link" id="nav-interest-tab" data-toggle="tab" href="#nav-interest" role="tab"
	          aria-controls="nav-profile" aria-selected="false">관심분야</a>
	        <a class="nav-item nav-link" id="nav-reward-tab" data-toggle="tab" href="#nav-reward" role="tab"
	          aria-controls="nav-reward" aria-selected="false">활동혜택</a>
	        <a class="nav-item nav-link" id="nav-period-tab" data-toggle="tab" href="#nav-period" role="tab"
	          aria-controls="nav-period" aria-selected="false">활동기간</a>
	        <a class="nav-item nav-link" id="nav-region-tab" data-toggle="tab" href="#nav-region" role="tab"
	          aria-controls="nav-region" aria-selected="false">모임지역</a>
	      </div>
	      
	   		<!--360미만이면 보이는 modal 띄우는 버튼 -->
	      <div class="modalbutton">
	        <button class="btn" data-toggle="modal" data-target="#field"> 활동분야 </button>
	        <button class="btn" data-toggle="modal" data-target="#interest"> 관심분야 </button>
	        <button class="btn" data-toggle="modal" data-target="#reward"> 활동혜택 </button>
	        <button class="btn" data-toggle="modal" data-target="#period"> 활동기간 </button>
	        <button class="btn" data-toggle="modal" data-target="#region"> 모임지역 </button>
	      </div>
	    </nav>
	
	    <!-- -360미만이면 보이는 modal -->
	    <div class="modal fade" id="field" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">활동분야 </h5>
	          </div>
	
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox"> 서포터즈
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 해외탐방
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 봉사단
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 마케터
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 기자단
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 강연
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 멘토링
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 기타
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
	              <input type="checkbox"> 여행/호텔/항공
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 언론/미디어
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 문화/역사
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 행사/페스티벌
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 교육
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 디자인/사진/예술/영상
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 경제/금융
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 경영/컨설팅/마케팅
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 정치/사회/법률
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 체육/헬스
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 의료/보건
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 뷰티/미용/화장품
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 과학/공학/IT
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 요리/식품
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 창업/자기계발
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 환경/에너지
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 콘텐츠
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 사회공헌/교류
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 유통/물류
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 기타
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
	              <input type="checkbox"> 활동비
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 사은품지급
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 실무교육
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 봉사활동시간
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 전문가/임직원멘토링
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 행사참여
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 수료증및인증서
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 입사시혜택
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 인턴쉽기회
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 교통비
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="modal fade" id="period" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	
	            <h5 class="modal-title" id="myModalLabel">활동기간</h5>
	          </div>
	          <div class="modal-body">
	            <label class="btn">
	              <input type="checkbox"> 3개월이하
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 3개월~6개월
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 6개월~1년
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 1년이상
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
	              <input type="checkbox"> 지역제한없음
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 서울
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 부산
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 대구
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 인천
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 광주
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 대전
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 울산
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 경기
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 강원
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 충청
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 전라
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 경상
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 제주
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 세종
	            </label>
	            <label class="btn">
	              <input type="checkbox"> 해외
	            </label>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
	            <button type="button" class="btn modal_search">검색</button>
	          </div>
	        </div>
	      </div>
	    </div>
	
	
	    <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 의 서브태그-->
	    <form action="list2.html">
	      <div class="tab-content" id="nav-tabContent">
	
	        <div class="tab-pane fade show active btn-group-toggle" id="nav-field" role="tabpanel"
	          aria-labelledby="nav-field-tab">
	
	          <label class="btn btn-tag">
	            <input type="checkbox"> 서포터즈
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">해외탐방
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">봉사단
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">마케터
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">기자단
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">강연
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">멘토링
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-interest" role="tabpanel"
	          aria-labelledby="nav-interest-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox">여행/호텔/항공
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">언론/미디어
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">문화/역사
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">행사/페스티벌
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">교육
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">디자인/사진/예술/영상
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">경제/금융
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">경영/컨설팅/마케팅
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">정치/사회/법률
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">체육/헬스
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">의료/보건
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">뷰티/미용/화장품
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">과학/공학/IT
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">요리/식품
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">창업/자기계발
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">환경/에너지
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">콘텐츠
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">사회공헌/교류
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">유통/물류
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">기타
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-reward" role="tabpanel" aria-labelledby="nav-reward-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox">활동비
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">사은품지급
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">실무교육
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">봉사활동시간
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">전문가/임직원멘토링
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">행사참여
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">수료증및인증서
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">입사시혜택
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">인턴쉽기회
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">교통비
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-period" role="tabpanel" aria-labelledby="nav-period-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox">3개월이하
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">3개월~6개월
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">6개월~1년
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">1년이상
	          </label>
	        </div>
	        <div class="tab-pane fade btn-group-toggle" id="nav-region" role="tabpanel" aria-labelledby="nav-region-tab">
	          <label class="btn btn-tag">
	            <input type="checkbox">지역제한없음
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">서울
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">부산
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">대구
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">인천
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">광주
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">대전
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">울산
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">경기
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">강원
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">충청
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">전라
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">경상
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">제주
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">세종
	          </label>
	          <label class="btn btn-tag">
	            <input type="checkbox">해외
	          </label>
	        </div>
	
	      </div>
	    </form>
	
	    <!-- 선택한 서브태그 보이는 부분-->
	    <div class="choice">
	      <div id="choicetag">
	
	      </div>
	      <button type="button" id="reset" onclick="reset()"> <i class="fas fa-redo"></i> 초기화</button>
	    </div>
	
	    <br>
	    <br>
	    <!-- 검색 결과 -->
	    <div class="search_Result">
	      <div class="dropdown">
	        검색결과 000건
	        <button style="float: right;" class="btn dropdown-toggle" type="button" id="dropdownMenuButton"
	          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          최신순
	        </button>
	
	        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	          <a class="dropdown-item" href="#">최신순</a>
	          <a class="dropdown-item" href="#">마감순</a>
	          <a class="dropdown-item" href="#">스크랩순</a>
	          <a class="dropdown-item" href="#">댓글순</a>
	        </div>
	
	      </div>
	    </div>
	    <br>
	
	    <div class="container_search">
	      <div class="row">
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	          	 <a onclick="act_detail()"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a onclick=""><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            D-12 조회12 댓글43 스크랩255
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	        <div class="col-6 col-sm-6 col-lg-3" id="col">
	           <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	          <br>
	          <div class="list_explain">
	           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	            주최기관<br>
	            디데이 조회수 댓글수 스크랩수
	          </div>
	        </div>
	      </div>
	    </div>
	     
	
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