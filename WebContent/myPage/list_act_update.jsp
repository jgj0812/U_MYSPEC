<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/myPage/myPage_sidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
                <h2>MY 페이지</h2>
			</nav>
			
			<!-- 내용 -->
			<div class="container">
				<div class="section">
			        <div>
			          <p class="badge badge-secondary">D-DAY</p>
			        </div>
			        <div class="d-flex">
			          <h3>제목</h3>
			          <h3 class="ml-auto">
			            <i class="fas fa-eye"></i>
			            <i class="far fa-square"></i>
			          </h3>
			        </div>
			      </div>
			      <hr />
			
			      <div class="section">
			        <form>
			          <div class="row">
			            <div class="col-md-4">
			              <img src="https://via.placeholder.com/150" width="100%" />
			            </div>
			            <div class="col-md-8 d-flex flex-column">
			              <div class="row">
			                <div class="col-md-12">
			                  <h5>주최기관</h5>
			                </div>
			              </div>
			              <div class="row">
			                <div class="col-md-2">
			                  <p>기관형태</p>
			                </div>
			                <div class="col-md-4">
			                  <input type="text" class="form-control" />
			                </div>
			                <div class="col-md-2">
			                  <p>참여대상</p>
			                </div>
			                <div class="col-md-4">
			                  <input type="text" class="form-control" />
			                </div>
			              </div>
			              <div class="row">
			                <div class="col-md-2">
			                  <p>활동기간</p>
			                </div>
			                <div class="col-md-4">
			                  <input type="text" class="form-control" />
			                </div>
			                <div class="col-md-2">
			                  <p>모집인원</p>
			                </div>
			                <div class="col-md-4">
			                  <input type="text" class="form-control" />
			                </div>
			              </div>
			              <div class="row">
			                <div class="col-md-2">
			                  <p>모임지역</p>
			                </div>
			                <div class="col-md-4">
			                  <input
			                    type="text"
			                    class="form-control"
			                    onclick="$('#regionModal').modal();"
			                  />
			                </div>
			                <div class="col-md-2">
			                  <p>참여대상</p>
			                </div>
			                <div class="col-md-4">
			                  <input type="text" class="form-control" />
			                </div>
			              </div>
			              <div class="row">
			                <div class="col-md-2">
			                  <p>활동혜택</p>
			                </div>
			                <div class="col-md-4">
			                  <input
			                    type="text"
			                    class="form-control"
			                    onclick="$('#rewardModal').modal();"
			                  />
			                </div>
			                <div class="col-md-2">
			                  <p>활동분야</p>
			                </div>
			                <div class="col-md-4">
			                  <input
			                    type="text"
			                    class="form-control"
			                    onclick="$('#fieldModal').modal();"
			                  />
			                </div>
			              </div>
			              <div class="row">
			                <div class="col-md-2">
			                  <p>홈페이지</p>
			                </div>
			                <div class="col-md-10">
			                  <input type="text" class="form-control" />
			                </div>
			              </div>
			              <div class="row h-100 align-content-end">
			                <div class="col-md-12">
			                  <button class="btn btn-cam btn-block">수정하기</button>
			                </div>
			              </div>
			            </div>
			          </div>
			        </form>
			      </div>
			      <br />
			
			      <div class="section">
			        <form>
			          <h5>상세내용</h5>
			          <textarea id="content"></textarea>
			          <button class="btn btn-cam btn-block">수정하기</button>
			        </form>
			      </div>
			      <br />
			
			      <div class="section">
			        <form>
			          <h5>담당자 Q&A</h5>
			          <div class="form-group">
			            <textarea class="form-control"></textarea>
			            <input
			              class="btn btn-cam btn-block"
			              type="button"
			              value="등록"
			            />
			          </div>
			        </form>
			      </div>			
			</div>
			<!-- /내용 -->
			<!-- 모달 -->
			<div class="modal" tabindex="-1" id="regionModal">
		      <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		          <div class="modal-header bg-primary text-white">
		            <h5 class="modal-title">모임지역</h5>
		            <button
		              type="button"
		              class="close"
		              data-dismiss="modal"
		              aria-label="Close"
		            >
		              <span aria-hidden="true" class="text-white">&times;</span>
		            </button>
		          </div>
		          <div class="modal-body">
		            <div class="row">
		              <div class="col-md-3"><input type="radio" /> 지역제한없음</div>
		              <div class="col-md-3"><input type="radio" /> 서울</div>
		              <div class="col-md-3"><input type="radio" /> 부산</div>
		              <div class="col-md-3"><input type="radio" /> 대구</div>
		            </div>
		            <div class="row">
		              <div class="col-md-3"><input type="radio" /> 인천</div>
		              <div class="col-md-3"><input type="radio" /> 광주</div>
		              <div class="col-md-3"><input type="radio" /> 대전</div>
		              <div class="col-md-3"><input type="radio" /> 울산</div>
		            </div>
		            <div class="row">
		              <div class="col-md-3"><input type="radio" /> 경기</div>
		              <div class="col-md-3"><input type="radio" /> 강원</div>
		              <div class="col-md-3"><input type="radio" /> 충청</div>
		              <div class="col-md-3"><input type="radio" /> 전라</div>
		            </div>
		            <div class="row">
		              <div class="col-md-3"><input type="radio" /> 경상</div>
		              <div class="col-md-3"><input type="radio" /> 제주</div>
		              <div class="col-md-3"><input type="radio" /> 세종</div>
		              <div class="col-md-3"><input type="radio" /> 해외</div>
		            </div>
		          </div>
		          <div class="modal-footer">
		            <button
		              type="button"
		              class="btn btn-secondary"
		              data-dismiss="modal"
		            >
		              취소
		            </button>
		            <button type="button" class="btn btn-cam">저장</button>
		          </div>
		        </div>
		      </div>
		    </div>
		
		    <div class="modal" tabindex="-1" id="rewardModal">
		      <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		          <div class="modal-header bg-primary text-white">
		            <h5 class="modal-title">활동혜택</h5>
		            <button
		              type="button"
		              class="close"
		              data-dismiss="modal"
		              aria-label="Close"
		            >
		              <span aria-hidden="true" class="text-white">&times;</span>
		            </button>
		          </div>
		          <div class="modal-body">
		            <div class="row">
		              <div class="col-md-3"><input type="checkbox" /> 활동비</div>
		              <div class="col-md-3"><input type="checkbox" /> 사은품지급</div>
		              <div class="col-md-3"><input type="checkbox" /> 실무교육</div>
		              <div class="col-md-3"><input type="checkbox" /> 봉사활동기간</div>
		            </div>
		            <div class="row">
		              <div class="col-md-3">
		                <input type="checkbox" /> 전문가/임직원멘토링
		              </div>
		              <div class="col-md-3"><input type="checkbox" /> 행사 참여</div>
		              <div class="col-md-3">
		                <input type="checkbox" /> 수료증 및 인증서
		              </div>
		              <div class="col-md-3"><input type="checkbox" /> 입사시 혜택</div>
		            </div>
		          </div>
		          <div class="modal-footer">
		            <button
		              type="button"
		              class="btn btn-secondary"
		              data-dismiss="modal"
		            >
		              취소
		            </button>
		            <button type="button" class="btn btn-cam">저장</button>
		          </div>
		        </div>
		      </div>
		    </div>
		
		    <div class="modal" tabindex="-1" id="fieldModal">
		      <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		          <div class="modal-header bg-primary text-white">
		            <h5 class="modal-title">활동분야</h5>
		            <button
		              type="button"
		              class="close"
		              data-dismiss="modal"
		              aria-label="Close"
		            >
		              <span aria-hidden="true" class="text-white">&times;</span>
		            </button>
		          </div>
		          <div class="modal-body">
		            <div class="row">
		              <div class="col-md-3"><input type="checkbox" /> 서포터즈</div>
		              <div class="col-md-3"><input type="checkbox" /> 해외탐방</div>
		              <div class="col-md-3"><input type="checkbox" /> 봉사단</div>
		              <div class="col-md-3"><input type="checkbox" /> 마케터</div>
		            </div>
		            <div class="row">
		              <div class="col-md-3"><input type="checkbox" /> 기자단</div>
		              <div class="col-md-3"><input type="checkbox" /> 강연</div>
		              <div class="col-md-3"><input type="checkbox" /> 멘토링</div>
		              <div class="col-md-3"><input type="checkbox" /> 기타</div>
		            </div>
		          </div>
		          <div class="modal-footer">
		            <button
		              type="button"
		              class="btn btn-secondary"
		              data-dismiss="modal"
		            >
		              취소
		            </button>
		            <button type="button" class="btn btn-cam">저장</button>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- /모달 -->
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>