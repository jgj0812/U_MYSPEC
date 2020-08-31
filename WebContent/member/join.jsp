<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<section class="py-3" id="join">
      <h1 class="text-center">회원가입</h1>
      <div class="container">
        <div class="row">
          <div class="col-md-10 mx-auto">
            <div class="card">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item col">
                    <a
                      href="#personJoin"
                      class="nav-link active text-center"
                      data-toggle="tab"
                    >
                      개인회원</a
                    >
                  </li>
                  <li class="nav-item col">
                    <a href="#orgJoin" class="nav-link text-center" data-toggle="tab"
                      >단체회원</a
                    >
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content mt-3">
                  <div class="tab-pane fade show active" id="personJoin">
                    <form action="joinPro.jsp" id="personFrm" method="post">
                      <input type="hidden" name="memType" value="0"/>
                      <div class="form-group">
                        <label for="id">id (4글자 이상)</label>
                        <input type="text" name="id" id="person_id" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="person_idCheck"
                        value="중복확인"
                        class="btn btn-cam col-md-4"
                        onclick="person_Check()"
                      />
                      <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="pwd" id="person_pwd" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="passwordCheck">비밀번호 확인</label>
                        <input type="password" name="pwd_check" id="person_pwd_check" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="nickName">닉네임</label>
                        <input type="text" name="nick" id="person_nick" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="birthDay">생년월일 (ex: 19581030)</label>
                        <input type="text" name="birth" id="person_birth" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" name="email" id="person_email" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="phone">연락처 (ex: 010-1111-2222)</label>
                        <input type="text" name="phone" id="person_phone" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="personSend"
                        value="가입"
                        class="btn btn-cam col-md-4"
                        onclick="person_Send()"
                      />
                      &nbsp;
                      <input
                        type="reset"
                        value="취소"
                        class="btn btn-danger col-md-4"
                      />
                    </form>
                  </div>
                  <div class="tab-pane fade" id="orgJoin">
                    <form action="joinPro.jsp" method="post" id="orgFrm">
                      <input type="hidden" name="memType" value="1"/>
                      <div class="form-group">
                        <label for="id">id (4글자 이상)</label>
                        <input type="text" name="id" id="org_id" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="org_idCheck"
                        value="중복확인"
                        class="btn btn-cam col-md-4"
                        onclick="org_Check()"
                      />
                      <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="pwd" id="org_pwd" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="passwordCheck">비밀번호 확인</label>
                        <input type="password" name="pwd_check" id="org_pwd_check" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="nickName">주최기관명</label>
                        <input type="text" name="name" id="org_name" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="nickName">기관형태</label>
                        <select class="form-control" name="type" id="org_type">
                          <option value="-1">선택</option>
                          <option value="88">대기업</option>
                          <option value="89">중소기업/스타트업</option>
                          <option value="90">공공기관/공기업</option>
                          <option value="91">외국계기업</option>
                          <option value="92">중견기업</option>
                          <option value="93">비영리단체/협회/교육재단</option>
                          <option value="94">병원</option>
                          <option value="95">동아리/학생자치단체</option>
                          <option value="96">기타</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="nickName">담당자이름</label>
                        <input type="text" name="manager" id="org_manager" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="email">담당자 이메일</label>
                        <input type="email" name="email" id="org_email" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="phone"
                          >담당자 연락처 (ex: 010-1111-2222)</label
                        >
                        <input type="text" name="phone" id="org_phone" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="orgSend"
                        value="가입"
                        class="btn btn-cam col-md-4"
                        onclick="org_Send()"
                      />
                      &nbsp;
                      <input
                        type="reset"
                        value="취소"
                        class="btn btn-danger col-md-4"
                      />
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>