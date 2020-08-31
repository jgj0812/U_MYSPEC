<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<section class="py-3" id="Finder">
      <h1 class="text-center">id/비밀번호 찾기</h1>
      <div class="container">
        <div class="row">
          <div class="col-md-6 mx-auto">
            <div class="card">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item col">
                    <a class="nav-link active text-center" data-toggle="tab" href="#idfind"
                      >id 찾기</a
                    >
                  </li>
                  <li class="nav-item col-7">
                    <a class="nav-link text-center" href="#pwdfind" data-toggle="tab"
                      >비밀번호 찾기</a
                    >
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content mt-3">
                  <div class="tab-pane fade show active" id="idfind">
                    <form method="post" id="findIdFrm">
                      <input type="hidden" name="findType" value="0"/>
                      <div class="form-group">
                      	<label for="member">회원 유형을 선택해주세요</label>
                      	<select class="form-control" name="memType" id="findIdMemtype" onchange="find_Id_mem()">
                      		<option value="-1">선택</option>
                      		<option value="0">개인회원</option>
                      		<option value="1">단체회원</option>
                      	</select>
                      </div>
                      <div id="idTypeGroup">
                      </div>
                      <input
                        type="button"
                        id="idFindBtn"
                        value="id 찾기"
                        class="btn btn-cam btn-block mt-3"
                        onclick="id_Find()"
                      />
                    </form>
                  </div>
                  <div class="tab-pane fade" id="pwdfind">
                    <form method="post" id="findPwdFrm">
                      <input type="hidden" name="findType" value="1"/>
                      <div class="form-group">
                      	<label for="member">회원 유형을 선택해주세요</label>
                      	<select class="form-control" name="memType" id="findPwdMem">
                      		<option value="-1">선택</option>
                      		<option value="0">개인회원</option>
                      		<option value="1">단체회원</option>
                      	</select>
                      </div>
                      <div class="form-group">
                        <label for="id">id</label>
                        <input type="text" name="id" id="findId" class="form-control" />
                      </div>
                      <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" name="email" id="findEmail" class="form-control" />
                      </div>
                      <input
                        type="button"
                        id="pwdFindBtn"
                        value="비밀번호 찾기"
                        class="btn btn-cam btn-block mt-3"
                        onclick="pwd_Find()"
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