<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<div class="container mt-3">
   <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 -->
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-field-tab" data-toggle="tab" href="#nav-field" role="tab"
          aria-controls="nav-field" aria-selected="true">공모분야</a>

        <a class="nav-item nav-link" id="nav-rewardScale-tab" data-toggle="tab" href="#nav-rewardScale" role="tab"
          aria-controls="nav-rewardScale" aria-selected="false">시상규모</a>

        <a class="nav-item nav-link" id="nav-reward-tab" data-toggle="tab" href="#nav-reward" role="tab"
          aria-controls="nav-reward" aria-selected="false">수상혜택</a>

        <a class="nav-item nav-link" id="nav-period-tab" data-toggle="tab" href="#nav-who" role="tab"
          aria-controls="nav-who" aria-selected="false">응모대상</a>

          <a class="nav-item nav-link" id="nav-Agency-tab" data-toggle="tab" href="#nav-Agency" role="tab"
          aria-controls="nav-Agency" aria-selected="false">주최기관</a>
      </div>
      
	<!--360미만이면 보이는 modal 띄우는 버튼 -->
      <div class="modalbutton">
        <button class="btn" data-toggle="modal" data-target="#field"> 공모분야 </button>
        <button class="btn" data-toggle="modal" data-target="#rewardScale"> 시상규모 </button>
        <button class="btn" data-toggle="modal" data-target="#reward"> 수상혜택 </button>
        <button class="btn" data-toggle="modal" data-target="#who"> 응모대상 </button>
        <button class="btn" data-toggle="modal" data-target="#Agency"> 주최기관 </button>

      </div>
    </nav>

    <!-- -360미만이면 보이는 modal -->
    <div class="modal fade" id="field" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="myModalLabel">공모분야 </h5>
          </div>

          <div class="modal-body">
            <label class="btn">
              <input type="checkbox"> 기획/아이디어
            </label>
            <label class="btn">
              <input type="checkbox"> 광고/마케팅
            </label>
            <label class="btn">
              <input type="checkbox"> 사진/영상/UCC
            </label>
            <label class="btn">
              <input type="checkbox"> 디자인/순수미술/공예
            </label>
            <label class="btn">
              <input type="checkbox"> 네이밍/슬로건
            </label>
            <label class="btn">
              <input type="checkbox"> 캐릭터/만화/게임
            </label>
            <label class="btn">
              <input type="checkbox"> 건축/건설/인테리어
            </label>
            <label class="btn">
              <input type="checkbox"> 과학/공학
            </label>
            <label class="btn">
              <input type="checkbox"> 예체능/패션
            </label>
            <label class="btn">
              <input type="checkbox"> 전시/페스티벌
            </label>
            <label class="btn">
              <input type="checkbox"> 문학/시나리오
            </label>
            <label class="btn">
              <input type="checkbox"> 해외
            </label>
            <label class="btn">
              <input type="checkbox"> 학술
            </label>
            <label class="btn">
              <input type="checkbox"> 창업
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

    <div class="modal fade" id="rewardScale" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="myModalLabel">시상규모</h5>
          </div>
          <div class="modal-body">
            <label class="btn">
              <input type="checkbox"> 1천만원 미만
            </label>
            <label class="btn">
              <input type="checkbox"> 1천만원 ~ 3천만원
            </label>
            <label class="btn">
              <input type="checkbox"> 3천만원 ~ 5천만원
            </label>
            <label class="btn">
              <input type="checkbox"> 5천만원 이상
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
              <input type="checkbox"> 입사시 가산점
            </label>
            <label class="btn">
              <input type="checkbox"> 인턴/정규직채용
            </label>
            <label class="btn">
              <input type="checkbox"> 해외연수, 전시기회
            </label>
            <label class="btn">
              <input type="checkbox"> 실제상용화
            </label>
            <label class="btn">
              <input type="checkbox"> 상장 수여
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

    <div class="modal fade" id="who" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="myModalLabel">활동기간</h5>
          </div>
          <div class="modal-body">
            <label class="btn">
              <input type="checkbox"> 청소년
            </label>
            <label class="btn">
              <input type="checkbox"> 대상 제한 없음
            </label>
            <label class="btn">
              <input type="checkbox"> 대학생
            </label>
            <label class="btn">
              <input type="checkbox"> 직장인/일반인
            </label>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn modal_reset"> <i class="fas fa-redo"></i> 초기화</button>
            <button type="button" class="btn modal_search">검색</button>

          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="Agency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="myModalLabel">주최기관</h5>
          </div>
          <div class="modal-body">
            <label class="btn">
              <input type="checkbox"> 대기업
            </label>
            <label class="btn">
              <input type="checkbox"> 중소기업/스타트업
            </label>
            <label class="btn">
              <input type="checkbox"> 공공기관/공기업
            </label>
            <label class="btn">
              <input type="checkbox"> 외국계기업
            </label>
            <label class="btn">
              <input type="checkbox"> 중견기업
            </label>
            <label class="btn">
              <input type="checkbox"> 비영리단체/협회/교육재단
            </label>
            <label class="btn">
              <input type="checkbox"> 동아리/학생자치단체
            </label>
            <label class="btn">
              <input type="checkbox"> 병원
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


     <!-- 태그: 활동분야, 관심분야, 활동혜택, 활동기간, 모임지역 의 서브태그-->
    <form action="list2.html">
      <div class="tab-content" id="nav-tabContent">

        <div class="tab-pane fade show active btn-group-toggle" id="nav-field" role="tabpanel"
          aria-labelledby="nav-field-tab">

          <label class="btn btn-tag">
            <input type="checkbox"> 기획/아이디어
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 광고/마케팅
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 사진/영상/UCC
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 디자인/순수미술/공예
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 네이밍/슬로건
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 캐릭터/만화/게임
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 건축/건설/인테리어
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 과학/공학
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 예체능/패션
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 전시/페스티벌
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 문학/시나리오
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 해외
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 학술
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 창업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 기타
          </label>
        </div>
        <div class="tab-pane fade btn-group-toggle" id="nav-rewardScale" role="tabpanel"
          aria-labelledby="nav-rewardScale-tab">
          <label class="btn btn-tag">
            <input type="checkbox"> 1천만원 미만
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 1천만원 ~ 3천만원
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 3천만원 ~ 5천만원
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 5천만원 이상
          </label>
        </div>
        <div class="tab-pane fade btn-group-toggle" id="nav-reward" role="tabpanel" aria-labelledby="nav-reward-tab">
          <label class="btn btn-tag">
            <input type="checkbox"> 입사시 가산점
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 인턴/정규직채용
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 해외연수, 전시기회
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 실제상용화
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 상장 수여
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 기타
          </label>
        </div>
        <div class="tab-pane fade btn-group-toggle" id="nav-who" role="tabpanel" aria-labelledby="nav-who-tab">
          <label class="btn btn-tag">
            <input type="checkbox"> 청소년
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 대상 제한 없음
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 대학생
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 직장인/일반인
          </label>
        </div>
        <div class="tab-pane fade btn-group-toggle" id="nav-Agency" role="tabpanel" aria-labelledby="nav-Agency-tab">
          <label class="btn btn-tag">
            <input type="checkbox"> 대기업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 중소기업/스타트업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 공공기관/공기업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 외국계기업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 중견기업
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 비영리단체/협회/교육재단
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 동아리/학생자치단체
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 병원
          </label>
          <label class="btn btn-tag">
            <input type="checkbox"> 기타
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
          	 <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
          <br>
          <div class="list_explain">
           <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
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
<%@ include file="/footer.jsp" %>