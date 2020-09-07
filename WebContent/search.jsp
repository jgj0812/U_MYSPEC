<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
	<div class="container">
      <h2>검색</h2>
     
      <!-- navbar (card 방식) -->
      <nav class="navbar  bg-light card-header  ">
        
          <button
            class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell rounded-left"
            type="button"
          >
            전체
          </button>
          <button
          class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell"
          type="button"
          >
          모집중인 활동
           </button>

           <button
            class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell rounded-right"
            type="button"
          >
            커뮤니티
          </button>
          <!-- navbar mobile -->
            <button
            class=" col-3 col-xs-4 text-center border border-white d-block d-sm-none rounded-left"
            type="button"
          >
            <small>전체</small>
          </button>
          <button
          class=" col-5 col-sm-4 text-center border border-white d-block d-sm-none"
          type="button"
          >
          <small>모집중인 활동 </small>
          </button>

          <button
            class=" col-4 col-xs-4 text-center border border-white d-block d-sm-none rounded-right"
            type="button"
          >
          <small>커뮤니티</small>
          </button>
           <!-- /navbar mobile -->
      </nav>
      <!-- /navbar -->

      
      

   <!-- 활동 -->
      </div>
      <div class="container ">
        <div class="col-lg-12 bg-light p-4">모집중인 활동<button class="d-flex ml-auto btn btn-secondary btn-sm">더보기</button></div>
        <div class="col-lg-12 border border-light">
          <div class="table-responsive">
            <table class="table table-sm table-hover">
              <tbody>
                <tr class="d-flex">
                  <td class="col-md-1 col-4 d-flex align-items-center">
                    <img class="" width="100%" src="img/exam.png"  alt="" />
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">대외활동</td>
                  <td class="col-md-5">
                    <a class="h5  d-none d-lg-table-cell">검색 결과로 나온 대외활동의 제목입니다.</a>
                    <a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;">검색 결과로 나온 대외활동의 제목입니다(mobile).</a>
                    <div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill">대외활동</span></div>
                    <p class="d-block d-sm-none">
                      <small> 글쓴이 등록일 조회수</small>
                       
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">대한대외활동</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 col-4 d-flex align-items-center ">
                    <img src="img/exam.png" width="100%" alt="" />
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">
                    <a href="detailView.jsp" class="text-dark">대외활동</a>
                  </td>
                  <td class="col-md-5">
                    <a href="detailView.jsp" class="h5 d-none d-lg-table-cell">제목</a>
                    <a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;">제목(mobile)</a>
                    <div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill">대외활동</span></div>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
                  <td class="col-md-2 d-none d-lg-table-cell">등록일</td>
                  <td class="col-md-1 d-none d-lg-table-cell">조회수</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 col-4 d-flex align-items-center">
                    <img src="img/exam.png" width="100%" alt="" />
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">대외활동</td>
                  <td class="col-md-5">
                    <a href="detailView.jsp" class="h5 d-none d-lg-table-cell">제목이 제법 긴 대외활동 & 대외활동 대외활동</a>
                    <a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;">제목이 제법 긴 대외활동 & 대외활동 대외활동(mobile)</a>
                    <div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill">대외활동</span></div>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 col-4 d-flex align-items-center">
                    <img src="img/exam.png" width="100%" alt="" />
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">공모전</td>
                  <td class="col-md-5">
                    <a href="detailView.jsp" class="h5 d-none d-lg-table-cell">공모전 제목입니다.</a>
                    <a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;">공모전 제목(mobile)</a>
                    <div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill">공모전</span></div>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">대한공모전</td>
                  <td class="col-md-2 d-none d-lg-table-cell">등록일</td>
                  <td class="col-md-1 d-none d-lg-table-cell">조회수</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 col-4 d-flex align-items-center">
                    <img src="img/exam.png" width="100%" alt="" />
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">공모전</td>
                  <td class="col-md-5">
                    <a href="detailView.jsp" class="h5 d-none d-lg-table-cell">제4회 MYSPEC 포스터 공모전</a>
                    <a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;">제4회 MYSPEC 포스터 공모전(mobile)</a>
                    <div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill">공모전</span></div>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- /활동 -->

      <!-- 커뮤니티 -->
      <div class="container mt-5">
        <div class="col-lg-12 bg-light p-4">커뮤니티<button class="d-flex ml-auto btn btn-secondary btn-sm">더보기</button></div>
          <div class="col-lg-12 border border-light">
          <div class="table-responsive">
            <table class="table table-sm table-hover">
              <thead>
                <tr class="d-flex">
                  <th class="col-md-1 d-none d-lg-table-cell">번호</th>
                  <th class="col-md-1 d-none d-lg-table-cell">게시판명</th>
                  <th class="col-md-5 d-none d-lg-table-cell">제목</th>
                  <th class="col-md-2 d-none d-lg-table-cell">글쓴이</th>
                  <th class="col-md-2 d-none d-lg-table-cell">등록일</th>
                  <th class="col-md-1 d-none d-lg-table-cell">조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell"
                      >MYSPEC 사이트를 오픈하였습니다. 어렵다 ㅋㅋㅋ</a
                    >
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">MYSPEC 사이트를 오픈하였습니다. 어렵다 ㅋㅋㅋ</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">
                    <a href="detailView.jsp" class="text-dark">공지</a>
                  </td>
                  <td class="col-md-1 d-none d-lg-table-cell">
                    <a href="detailView.jsp" class="text-dark">게시판명</a>
                  </td>
                  <td class="col-md-5">
                    <a href="detailView.jsp" class="h5 d-none d-lg-table-cell">제목</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">제목</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
                  <td class="col-md-2 d-none d-lg-table-cell">등록일</td>
                  <td class="col-md-1 d-none d-lg-table-cell">조회수</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">커뮤니티에서 제법 긴 제목입니다.</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">커뮤니티에서 중간 정도 제목입니다.</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">번호</td>
                  <td class="col-md-1 d-none d-lg-table-cell">게시판명</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">제목</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">제목</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
                  <td class="col-md-2 d-none d-lg-table-cell">등록일</td>
                  <td class="col-md-1 d-none d-lg-table-cell">조회수</td>
                </tr>
                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">MYSPEM 커뮤니티</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">MYSPEM 커뮤니티</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>

                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">힘든 하루지만 모두 즐겁고 긍정적으로 보내요.</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">힘든 하루지만 모두 즐겁고 긍정적으로 보내요.</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>

                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">링커리어</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">링커리어</a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>

                <tr class="d-flex">
                  <td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  <td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
                  <td class="col-md-5">
                    <a class="h5 d-none d-lg-table-cell">myspec!제목 myspec!제목 myspec!제목 myspec!제목</a>
                    <a class="d-block d-sm-none text-truncate" style="max-width: 300px;">myspec!제목 myspec!제목 myspec!제목 myspec!제목 </a>
                    <p class="d-block d-sm-none">
                      <small>글쓴이 등록일 조회수</small>
                    </p>
                  </td>
                  <td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
                  <td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
                  <td class="col-md-1 d-none d-lg-table-cell">507</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        </div>
      </div>
      <!-- /커뮤니티 -->
    </div>
<%@ include file="/footer.jsp" %>