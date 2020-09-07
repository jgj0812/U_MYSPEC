<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
	<!-- 로그인 -->
	<section class="flex-shrink-0 py-5" id="login">
    	<h1 class="text-center">로그인</h1>
    	<div class="container">
        	<div class="row">
        		<div class="col-md-6 mx-auto">
        			<!-- card -->
            		<div class="card">
              			<div class="card-header">
                			<ul class="nav nav-tabs card-header-tabs">
                				<!-- 개인회원 tab -->
                  				<li class="nav-item col">
                    				<a class="nav-link active text-center" data-toggle="tab" href="#member">
                    					개인회원
                    				</a>
                  				</li>
                  				<!-- /개인회원 tab -->
                  				<!-- 단체회원 tab -->
                  				<li class="nav-item col">
                    				<a class="nav-link text-center" href="#org" data-toggle="tab">
                    					단체회원
                    				</a>
                  				</li>
                  				<!-- /단체회원 tab -->
                			</ul>
              			</div>
              			<!-- card-body -->
              			<div class="card-body">
              				<!-- tab-content -->
                			<div class="tab-content mt-3">
                				<!-- 개인회원 로그인 -->
                  				<div class="tab-pane fade show active" id="member">
                    				<form action="loginPro.jsp" id="personLoginFrm" method="post">
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
				                        	class="btn btn-cam btn-block"/>
		                      			<input
		                        			type="button"
		                        			value="회원가입"
		                        			class="btn btn-cam-white btn-block"
		                        			onclick="javascript:window.location.href='join.jsp'"/>
		                      			<br />
		                      			<a href="finder.jsp" style="color:#000">id/비밀번호 찾기</a>
		                    		</form>
                				</div>
                				<!-- /개인회원 로그인 -->
                				<!-- 단체회원 로그인 -->
                  				<div class="tab-pane fade" id="org">
                    				<form action="loginPro.jsp" method="post" id="orgLoginFrm">
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
                        					class="btn btn-cam btn-block"/>
                      					<input
                        					type="button"
                        					value="회원가입"
                        					class="btn btn-cam-white btn-block"
                        					onclick="javascript:window.location.href='join.jsp'"/>
                      					<br />
                      					<a href="finder.jsp" style="color:#000">id/비밀번호 찾기</a>
                   					 </form>
                  				</div>
                  				<!-- /단체회원 로그인 -->
                			</div>
                			<!-- /tab-content -->
              			</div>
              			<!-- /card-body -->
            		</div>
            		<!-- /card -->
          		</div>
        	</div>
      	</div>
    </section>
    <!-- /로그인 -->
<%@ include file="/footer.jsp" %>