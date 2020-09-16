# MYSPEC
### 부산 IT 교육센터 JSP 프로젝트

대외활동, 공모전 정보 사이트

> 공통
>	* 작성하는 폼에는 javascript alert을 이용하여 유효성 검사

> 관리자 
>	* DB(admin 테이블)에 직접 ID와 비밀번호를 등록
>	* adminLogin.jsp에서 시작하여 로그인하여 사용
>	* 회원목록을 리스트로 볼 수 있고 삭제가 가능
>	* 대외활동과 공모전 리스트를 볼 수 있고 상세내용을 확인하고 승인 or 삭제 가능
>	* 커뮤니티에 공지글의 리스트를 볼 수 있고 공지글을 작성, 수정, 삭제 가능
>	* 커뮤니티 일반글의 리스트를 볼 수 있고 상세내용을 확인하고 삭제 가능 

* 관리자외 다른 사용자들은 index.jsp에서 시작

> index(메인화면)
>	* 공지사항 최근것 5개 표시
>	* 인기 대외활동, 공모전 슬라이더를 이용하여 표시

> 회원가입
>	* 개인회원과 단체회원 탭을 나누어서 표시
>	* 아이디는 4글자 이상 중복체크

> 로그인
>	* 개인회원과 단체회원 탭으로 나누어서 표시
>	* id/비밀번호 찾기를 누르면 id/비밀번호 찾기 페이지로 이동
>	* 로그인에 성공하면 index.jsp로 이동
>	* 회원가입 버튼을 누르면 회원가입 페이지로 이동

> id/비밀번호 찾기
>	> id찾기
>	>	* 회원 유형을 선택하면 그에 따른 입력폼 표시
>	>	* 입력폼에 적는내용은 회원정보와 동일해야한다
>	>	* id찾기를 누르면 id가 적힌 이메일을 전송
>	> 비밀번호 찾기
>	>	* 회원유형과 id, 이메일을 입력(회원정보와 동일해야함)
>	>	* 비밀번호 찾기 버튼을 누르면 비밀번호가 적힌 이메일을 전송

> 대외활동, 공모전
>	* 단체회원이 로그인하여 상단 네브바에 있는 활동등록으로 대외활동, 공모전 게시
>	* 상세내용을 적을때 summernote를 이용하여 이미지 업로드 가능
>	* 태그를 선택하여 태그와 연관된 대외활동과 공모전 리스트 표시
>	* 관리자에게 승인받지 않은 게시물은 리스트에 표시가 되지 않는다
>	* 상세보기에서 내용을 확인하고 담당자에게 메일보내기가 가능(메일프로그램 이용)
>	* 공유아이콘을 클릭하면 twitter, facebook, line 에 글 주소 공유가능
>	* 개인회원과 단체회원은 상세보기의 담당자 Q&A 이용이 가능
>	* 자신이 작성한 Q&A의 수정과 삭제 가능

> 커뮤니티
>	* 상단에 최신공지글 5개를 표시하고 나머지는 일반글
>	* 개인회원만 글작성이 가능하다.
>	* 글작성시 summernote로 이미지 업로드 가능
>	* 글제목, 글내용, 닉네임으로 검색 가능
>	* 상세보기에서 내용확인
>	* 상세보기에서 댓글 작성가능
>	* 댓글의 댓글 작성가능 내용앞에 상대의 이름을 표시함
>	* 자기가 작성한글, 댓글이면 수정과 삭제 가능

> 마이페이지
>	> 개인회원
>	>	* 자신이 작성한글과 댓글을 작성한 글의 리스트 확인
>	>	* 스크랩한 대외활동, 공모전 리스트 확인
>	>	* 글을 클릭하면 상세보기로 이동

>	> 단체회원
>	>	* 승인받아 모집중인 대외활동과 공모전 리스트 확인
>	>	* 승인 대기중인 대외활동과 공모전 리스트 확인
>	>	* 수정 버튼을 눌러서 수정가능

>	> 공통
>	>	* 회원정보 변경 가능
>	>	* 회원 탈퇴 가능

> 상단 검색
>	* 검색창에 검색어를 입력
>	* 커뮤니티 일반글 제목, 대외활동/공모전 제목이 일치하는 리스트를 띄운다.

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
			
* sever.xml의 connector 태그의 URIencoding을 UTF-8로 적용해야 한글 검색 가능