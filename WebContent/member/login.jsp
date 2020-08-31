<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<section class="flex-shrink-0 py-5" id="login">
      <h1 class="text-center">로그인</h1>
      <div class="container">
        <div class="row">
          <div class="col-md-6 mx-auto">
            <div class="card">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item col">
                    <a class="nav-link active text-center" data-toggle="tab" href="#member"
                      >개인회원</a
                    >
                  </li>
                  <li class="nav-item col">
                    <a class="nav-link text-center" href="#org" data-toggle="tab"
                      >단체회원</a
                    >
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content mt-3">
                  <div class="tab-pane fade show active" id="member">
                    <form action="member/loginPro.jsp" id="personLoginFrm" method="post">
                      <input type="hidden" name="memType" value="0" />
                      <div class="form-group">
                        <label for="id">id</label>
                        <input type="text" name="person_id" id="person_login_id" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="person_pwd" id="person_login_pwd" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="personLogin"
                        value="로그인"
                        class="btn btn-cam btn-block"
                        onclick="person_Login()"
                        
                      />
                      <input
                        type="button"
                        value="회원가입"
                        class="btn btn-cam-white btn-block"
                        onclick="join()"
                      />
                      <br />
                      <a onclick="finder()">id/비밀번호 찾기</a>
                    </form>
                  </div>
                  <div class="tab-pane fade" id="org">
                    <form action="member/loginPro.jsp" method="post" id="orgLoginFrm">
                      <input type="hidden" name="memType" value="1" />
                      <div class="form-group">
                        <label for="id">id</label>
                        <input type="text" name="org_id" id="org_login_id" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="org_pwd" id="org_login_pwd" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="orgLogin"
                        value="로그인"
                        class="btn btn-cam btn-block"
                        onclick="org_Login()"
                      />
                      <input
                        type="button"
                        value="회원가입"
                        class="btn btn-cam-white btn-block"
                        onclick="join()"
                      />
                      <br />
                      <a onclick="finder()">id/비밀번호 찾기</a>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>