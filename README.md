# MYSPEC
### 부산 IT 교육센터 JSP 프로젝트

대외활동, 공모전 정보 사이트

ver 0.1
--------
* 로그인 및 회원가입 화면 및 기능구현
* 대외활동, 공모전 리스트 화면 구현
* 커뮤니티 게시판 화면 구현
* 마이페이지 화면 일부 구현
* 관리자 화면 일부 구현 및 로그인 기능 구현


* 톰캣 9.0 사용 server.xml 의 U_MYSPEC Context 태그 안에 다음 내용 입력하기

		<Resource 
			auth="Container" 
			driverClassName="oracle.jdbc.OracleDriver" 
			maxActive="100" 
			maxIdle="30" 
			maxWait="10000" 
			name="jdbc/oracle" 
			password="1234" 
			type="javax.sql.DataSource" 
			url="jdbc:oracle:thin:@localhost:1521:xe" 
			username="scott"/>