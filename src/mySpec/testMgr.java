package mySpec;

import java.sql.*;
import java.util.ArrayList;

public class testMgr {
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "1234";
	
	
	// 관리자 등록
	public void admin() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into admin values(?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			pstmt.setString(2, "admin");
			pstmt.executeUpdate();
			System.out.println("관리자 등록 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 개인회원 16명 등록
	public void personUser() {
		String id[] = {"p100", "p101", "p102", "p103", "p104", "p105", "p106", "p107", "p108", "p109", "p110", "p111", "p112", "p113", "p114", "p115"};
		String pwd = "1234";
		String nickname[] = {"닉네임1", "닉네임2", "닉네임3", "닉네임4", "닉네임5", "닉네임6", "닉네임7", "닉네임8", "닉네임9", "닉네임10", "닉네임11", "닉네임12", "닉네임13","닉네임14", "닉네임15", "닉네임16"};
		String birth[] = {"1990-10-30", "1990-09-30", "1988-08-13", "1995-09-10", "2001-03-04", "2004-04-05", "2001-05-05", "1994-04-07", "2000-10-10", "1999-09-09", "1998-06-10", "1986-10-11", "1991-01-02", "2001-03-15", "2002-06-06", "1999-09-29"};
		String email[] = {"nick1@naver.com", 
						  "nick2@naver.com", 
						  "nick3@naver.com", 
						  "nick4@naver.com", 
						  "nick5@naver.com", 
						  "nick6@naver.com", 
						  "nick7@naver.com", 
						  "nick8@naver.com", 
						  "nick9@naver.com", 
						  "nick10@naver.com", 
						  "nick11@naver.com",
						  "nick12@naver.com",
						  "ncik13@naver.com",
						  "nick14@naver.com",
						  "nick15@naver.com",
						  "nick16@naver.com"};
		String phone[] = {"010-0000-0000", "016-0000-0000", "017-0000-0000", "018-0000-0000",
						  "019-0000-0000", "010-1111-1111", "016-1111-1111", "017-1111-1111",
						  "018-1111-1111", "019-1111-1111", "010-2222-2222", "016-2222-2222",
						  "017-2222-2222", "018-2222-2222", "019-2222-2222", "010-3333-3333"};
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into person_user values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			for(int i = 0; i < id.length; i++) {
				pstmt.setString(1, id[i]);
				pstmt.setString(2, pwd);
				pstmt.setString(3, nickname[i]);
				pstmt.setString(4, birth[i]);
				pstmt.setString(5, email[i]);
				pstmt.setString(6, phone[i]);
				pstmt.executeUpdate();
			}
			System.out.println("개인회원 16명 입력 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 단체회원 등록
	public void orgUser() {
		String id[] = {"o100", "o101", "o102", "o103", "o104", "o105", "o106", "0107", "o108", "o109", "o110", "o111", "o112", "o113", "o114", "o115"};
		String pwd = "1234";
		String orgName[] = {"삼성전자", "LG전자", "마미다", "경기 부천시",
				            "서울특별시", "일러스트레이션코리아", "닥터자르트", "한국인터넷소통협회",
				            "부산광역시", "샤플", "디노마드", "스마트도시협회",
				            "오리고", "아이콘스", "(주)오픈놀", "XR Campus"};
		int org_type[] = {88, 88, 89, 90, 90, 96, 92, 93, 90, 89, 93, 93, 89, 89, 89, 96};
		String manager[] = {"삼성매니저", "LG매니저", "마미다매니저", "경기 부천시 담당자",
							"서울시담당자", "일러레코리아매니저", "닥터자르트매니저", "한인소매니저",
							"부산시담당자", "샤플매니저", "디노마드매니저", "스도협매니저",
							"오리고매니저", "아이콘스매니저", "오픈놀매니저", "XR매니저"};
		String email[] = {"org1@naver.com", 
						  "org2@naver.com", 
						  "org3@naver.com", 
						  "org4@naver.com", 
						  "org5@naver.com", 
						  "org6@naver.com", 
						  "org7@naver.com", 
						  "org8@naver.com", 
						  "org9@naver.com", 
						  "org10@naver.com", 
						  "org11@naver.com",
						  "org12@naver.com",
						  "org13@naver.com",
						  "org14@naver.com",
						  "org15@naver.com",
						  "org16@naver.com"};
		String phone[] = {"010-0000-0000", "016-0000-0000", "017-0000-0000", "018-0000-0000",
						  "019-0000-0000", "010-1111-1111", "016-1111-1111", "017-1111-1111",
						  "018-1111-1111", "019-1111-1111", "010-2222-2222", "016-2222-2222",
						  "017-2222-2222", "018-2222-2222", "019-2222-2222", "010-3333-3333"};
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into org_user values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			for(int i = 0; i < id.length; i++) {
				pstmt.setString(1, id[i]);
				pstmt.setString(2, pwd);
				pstmt.setString(3, orgName[i]);
				pstmt.setInt(4, org_type[i]);
				pstmt.setString(5, manager[i]);
				pstmt.setString(6, email[i]);
				pstmt.setString(7, phone[i]);
				pstmt.executeUpdate();
			}
			System.out.println("단체회원 16명 입력 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 대외활동 등록
	public void Activity() {
		int actType = 1;
		String actThumb[] = {"mamida.jpg", "대외1-도시재생 .jpg", "대외3-lg.png"};
		String actTitle[] = {"마미다 서포터즈 14기 모집", 
							"2020 부천시 심곡본동 도시재생 현장 활동가 모집",
							"LG전자 LG WING SWIVEL HOLIC 모집"
		};
		String actOrg[] = {"o102", "o103", "o101"};
		String actTarget[] = {"대학생", "대상 제한 없음", "대상 제한 없음"};
		String actStart[] = {"2020-09-14", "2020-09-15", "2020-09-07"};
		String actEnd[] = {"2020-09-20", "2020-12-31", "2020-09-18"};
		int actPop[] = {10, 0, 300};
		int actReg[] = {43, 51, 43};
		int actField[] = {1, 8, 8};
		String actHome[] = {"https://blog.naver.com/nabizamcafe/222088888265",
							"https://m.blog.naver.com/PostList.nhn?blogId=sosa1720",
							"https://lgwing.co.kr/swivelholic/"
		};
		String actContent[] = {"<p><img src=\"http://localhost:8080/U_MYSPEC/upload/mamida.jpg\"></p><p><br></p><p>마미다 서포터즈 14기 모집</p><p><br></p><p>■ 모집인원 : 10명</p><p><br></p><p>■ 모집기간 : 2020.9.14 ~ 9.20</p><p><br></p><p>■ 지원자격 : 육아중인 부모라면 누구나</p><p><br></p><p>■ 발표 : 2020.9.23 마미다 블로그&nbsp;</p><p><br></p><p>■ 지원방법</p><p>1. 마미다 공식 블로그와 서로 이웃 맺기</p><p>2. SNS에 서포터즈 소식 스크랩 및 블로그 댓글 신청과 이웃 소환</p><p>3. 신청서 작성 http://forms.gle/XEYXWCJkfoYUKnjB8</p><p><br></p><p>■ 활동기간 : 2020년 10월 한 달간</p><p><br></p><p>■ 활동내용 :</p><p>[필수 활동 내용]</p><p>&nbsp;- 1개월 지원 제품 개봉기 (1주차)</p><p>&nbsp;- 제품 실사용 리뷰 (나비잠/하늘수/아라문) (2~4주차)</p><p>[선택 활동 내용]</p><p>&nbsp;- 마미다 제품을 1개월간 사용하면서 느낀 점 : 총평 (4주차)</p><p><br></p><p>■ 활동혜택</p><p>- 체험제품 : 나비잠 매직소프트 팬티형 4팩 + 하늘수 프리미엄 물티슈 6팩 + 아라문 베베 치약 1개</p>",
							   "<h5 class=\"ActivityDetailTab__ContentDetailTitle-jmpzn9-4 ldfmZA title is-5\">상세내용</h5><div><p>2020 부천시 심곡본동 도시재생 현장 활동가 모집</p><p><br></p><p>심곡본동 일원 도시재생 뉴딜사업의 성공적인 추진을 위하여 도시재생 뉴딜사업에 관심과 열정이 있는 심곡본동 일원 주민을 현장활동가로 지정하여 도시재생의 중추적인 인적자원으로 활용하고자 ‘심곡본동 도시재생 현장활동가 모집’ 공고를 하오니 주민 여러분들의 많은 참여 바랍니다.</p><p><br></p><p>■ 모집기간 : 공고일 ~ 2020. 12. 31.</p><p><br></p><p>■ 업무형태 : 첨부 된 약정서 참조</p><p><br></p><p>■ 활동기간 : 심곡본동 도시재생뉴딜사업 종료 시(2023년)</p><p><br></p><p>■ 신청자격 : 심곡본동 도시재생 뉴딜사업지를 *생활권으로 하는 주민·상인 및 관내 소재 대학(교) 재학생</p><p>&nbsp;① 심곡본동에 거주 혹은 출퇴근하는 자</p><p>&nbsp;② 부천시 관내 대학 및 대학원 재학생, 휴학생</p><p><br></p><p>■ 접수방법 : 전자우편(E-mail) noh0317@korea.kr</p><p><br></p><p>■ 제출서류</p><p>- 붙임 1. 심곡본동 도시재생 현장 활동가 지원양식</p><p>&nbsp;* 신청서, 자기소개서, 개인정보 수집·활용 동의서</p><p>- 붙임 2. 심곡본동 도시재생 현장 활동가 약정서</p><p><br></p><p>■ 활동내용</p><p>- 첨부 된 모집공고 및 약정서 참조</p><p><br></p><p>■ 선발통보 : 접수에 따라 수시 안내</p><p><br></p><p>■ 지원내용</p><p>- 도시재생관련 교육, 선진지 답사 등 역량강화 기회 제공</p><p>- 제작한 콘텐츠 게재 시 소정의 원고료 지급</p><p><br></p><p>■ 문의처 : 부천시 도시재생과 심곡본동 도시재생현장지원센터 노윤건 주무관 (☎032-625-7687)</p></div>",
							   "<p><img src=\"http://localhost:8080/U_MYSPEC/upload/대외3-lg.png\" style=\"width: 1088px;\"></p><p><br></p><p>LG전자 LG WING SWIVEL HOLIC 모집&nbsp;</p><p><br></p><p>■ 모집인원 : 총 300명</p><p><br></p><p>■ 모집기간 : 2020.9.7 ~ 9.17</p><p><br></p><p>■ 지원자격 : LG WING을 직접 체험하고 본인 SNS를 통해 함께 커뮤니케이션하시길 원하시는 모든 분</p><p><br></p><p>■ 발표 : 2020.9.21 SMS 개별 안내</p><p><br></p><p>■ 지원방법</p><p>1. 희망하는 모집 분야 선태 (Explorer, Creator, Player 중 택 1)</p><p>2. 커뮤니케이션할 메인 sns 채널 선택(블로그, 인스타그램, 유튜브 중 택 1)</p><p>3. 지원 양식에 맞춰 정보 입력</p><p><br></p><p>■ 체험기간 : 2020.9.25 ~ 총 4주간</p><p><br></p><p>■ 활동내용</p><p>- LG WING 제품 수령</p><p>- 신청 시 제출한 개인 SNS 채널에 주차별 미션 결과물 업로드</p><p>- 모든 미션 수행 종료 후 우수 활동자 발표</p><p><br></p><p>■ 활동혜택</p><p>- 미션을 모두 수행하신 분들께는 체험하신 LG WING을 증정</p><p>- 체험 기간 동안 우수한 콘텐츠로 커뮤니케이션한 분은 별도로 선정해 특별한 혜택 지급</p>"
		};
		ArrayList<int[]> act_interest = new ArrayList<int[]>();
		int[] interArr1 = {25, 28};
		int[] interArr2 = {26, 28};
		int[] interArr3 = {21};
		act_interest.add(interArr1);
		act_interest.add(interArr2);
		act_interest.add(interArr3);
		ArrayList<int[]> act_reward = new ArrayList<int[]>();
		int[] rewardArr1 = {30};
		int[] rewardArr2 = {29};
		int[] rewardArr3 = {30};
		act_reward.add(rewardArr1);
		act_reward.add(rewardArr2);
		act_reward.add(rewardArr3);
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			for(int i = 0; i < actThumb.length; i ++) {
				sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_pop, act_reg, act_field, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, actType);
				pstmt.setString(2, actThumb[i]);
				pstmt.setString(3, actTitle[i]);
				pstmt.setString(4, actOrg[i]);
				pstmt.setString(5, actTarget[i]);
				pstmt.setString(6, actStart[i]);
				pstmt.setString(7, actEnd[i]);
				pstmt.setInt(8, actPop[i]);
				pstmt.setInt(9, actReg[i]);
				pstmt.setInt(10, actField[i]);
				pstmt.setString(11, actHome[i]);
				pstmt.setString(12, actContent[i]);
				pstmt.executeUpdate();
				
				sql = "insert into act_interest values(act_seq.currval, ?)";
				pstmt = con.prepareStatement(sql);
				for(int actInter : act_interest.get(i)) {
					pstmt.setInt(1, actInter);
					pstmt.executeUpdate();
				}
				
				sql = "insert into act_reward values(act_seq.currval, ?)";
				pstmt = con.prepareStatement(sql);
				for(int actReward : act_reward.get(i)) {
					pstmt.setInt(1, actReward);
					pstmt.executeUpdate();
				}
			}
			System.out.println("입력");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 공모전 등록
	public void contest() {
		int act_type = 2;
		String actThumb[] = {"공모1-인공지능.jpg", "공모2-할로윈.png"};
		String actTitle[] = {"제2회 대학생 동아리 인공지능(AI) 아이디어 경진대회",
							 "[2020 일러스트레이션코리아] 할로윈 포토존 일러스트 공모전"
		};
		String actOrg[] = {"o108", "o105"};
		String actTarget[] = {"대학생", "대상 제한 없음"};
		String actStart[] = {"2020-09-14", "2020-09-14"};
		String actEnd[] = {"2020-10-07", "2020-10-04"};
		int actField[] = {66, 62};
		int actAward[] = {800, 700};
		String actHome[] = {"http://www.bitle.kr/board/view.bitle?boardId=BBS_0000006&menuCd=DOM_000000104001000000&orderBy=REGISTER_DATE%20DESC&startPage=1&dataSid=2456",
							"http://illustrationkorea.co.kr/"
		};
		String actContent[] = {"<p><img src=\"http://localhost:8080/U_MYSPEC/upload/공모1-인공지능.jpg\" style=\"width: 750px;\"></p><p>제2회 대학생 동아리 인공지능(AI) 아이디어 경진대회</p><p><br></p><p>인공지능, 사물인터넷, 빅데이터, 모바일 등 첨단 정보통신기술이 경제·사회 전반에 융합되어 혁신적인 변화가 나타나는 4차 산업혁명 시대에 대비하기 위해, 대학생(동아리, LAB)들과 함께 아이디어 발굴을 통한 AI학습분위기 조성 및 확산, 혁신성장의 기회를 마련하고자&nbsp; 「제2회 대학생 동아리 인공지능(AI) 아이디어 경진대회」를 다음과 같이 개최하오니 부산지역 대학생들의 많은 참여를 바랍니다.</p><p><br></p><p>■ 대회명 : 「대학생 동아리 인공지능(AI) 아이디어 경진대회」</p><p>◈ 아이디어 주제</p><p>&nbsp;- AI(인공지능)를 활용한 공공서비스 개선</p><p>&nbsp;- AI(인공지능)를 활용한 제조공정, 난제기술, 사회문제, 생활문제 해결 등</p><p>&nbsp;- 4차 산업혁명 대비 AI(인공지능)를 활용한 市-대학의 역할과 미래</p><p><br></p><p>■ 응모자격 : 부산지역 대학(원)생 동아리 or LAB(연구실, 실험실 등) / 팀별 3~5명 이내 구성</p><p>&nbsp;(참여를 위한 동아리 신규 결성 및 타 대학과 연합도 가능)</p><p><br></p><p>■ 주최 : 부산광역시</p><p><br></p><p>■ 주관 : (재)부산인재평생교육진흥원</p><p><br></p><p>■ 후원 : 부산지방중소벤처기업청, 기술보증기금, 부산창조경제혁신센터</p><p><br></p><p>■ 대회일정</p><p>- 접수기간 : 2020년 9월 14일(월) ~ 10월 7일(수) 18:00까지</p><p>- 1차 심사(10월) : 지원대상 동아리(LAB) 선정(20팀±∝:아이디어 수준에 따라 심사 후 결정)</p><p>- 선정 동아리(LAB) 활동비 지원 : 10월 중 예정</p><p>&nbsp;※ 지원대상 동아리(LAB) 활동비 ±50만원(교통비, 회의비, 제작비 등) 지원 : 총10,000천원</p><p>&nbsp;※ 아이디어에 따라 활동지원비 차등 지급 가능</p><p>- 결과보고서[붙임4] 제출 : 12월 초순경</p><p>- 2차 심사(12월) : 수상작 선정&nbsp; * 발표심사[12.9(수) 예정]</p><p>- 결과발표 : 2020년 12월경 수상작 발표 및 시상 ※부산인재평생교육진흥원 홈페이지 ‘고시공고’ 게재</p><p>- 발표 및 시상 : 12월 중~말경</p><p><br></p><p>■ 제출방법</p><p>- 아이디어 제출 : 동아리(LAB) 대표 학생이 E-mail로 제출</p><p>(부산인재평생교육진흥원 담당자 메일 : jinyb@bitle.kr)</p><p>&nbsp;※ 제출서류 : 참가신청서, 아이디어 제안서, 개인정보 수집·활용동의서, 경진대회 약관 확인서, 재학(휴학) 증명서 1부.</p><p><br></p><p>■ 심사기준 : 독창성, 기술성, 사업성, 활용성, 실현가능성 등</p><p><br></p><p>■ 시상내역 : 9개 작품,&nbsp; 총 시상금 8,000천원 ▷ 12월 중(예정)</p><p>- 대상(1개 작품) : 2,000,000원 / 부산광역시장상</p><p>- 우수</p><p>&nbsp;* 1개 작품 : 1,000,000원 / 부산지방중소벤처기업청장상</p><p>&nbsp;* 1개 작품 : 1,000,000원 / 기술보증기금이사장상</p><p>&nbsp;* 1개 작품 : 1,000,000원 / 부산창조경제혁신센터장상</p><p>&nbsp;* 1개 작품 : 1,000,000원 / 부산인재평생교육진흥원장상</p><p>- 장려</p><p>&nbsp;* 2개 작품 : 500,000원 / 기술보증기금이사장상</p><p>&nbsp;* 2개 작품 : 500,000원 / 부산인재평생교육진흥원장상</p><p>※ 추진상황에 따라 시상내용 및 훈격이 조정될 수 있음</p><p><br></p><p>■ 기타문의</p><p>- 기타 자세한 사항은 아래 연락처로 문의하여 주시기 바랍니다.</p><p>&nbsp;* (재)부산인재평생교육진흥원 사업담당자 ☏ 051) 580-9034</p>",
							   "<h5 class=\"ActivityDetailTab__ContentDetailTitle-jmpzn9-4 ldfmZA title is-5\">상세내용</h5><div><p>[2020 일러스트레이션코리아] 할로윈 포토존 일러스트 공모전</p><p><br></p><p><br></p><p>■ 주최 : 일러스트레이션코리아</p><p><br></p><p>■ 출품 자격 : 누구나!</p><p>- 연령제한 없음, 개인/단체 모두 가능, 1인 다수 작품 응모가능</p><p><br></p><p>■ 주제 : 할로윈 포토존 일러스트</p><p><br></p><p>■&nbsp; 응모분야 : 일러스트, 디자인</p><p><br></p><p>■ 작품 규격</p><p>1) 할로윈 컨셉의 포토존 뒷벽(현수막) 디자인</p><p>2) 현수막 사이즈: 가로 2960mm*세로 2440mm</p><p>3) 파일형식: 시안=jpg or png 등 이미지 파일, 1차 심사 통과 작품=ai 파일&nbsp;</p><p><br></p><p>■ 공모 일정</p><p>1) 참가신청 및 시안 제출(이미지 파일): 9.14(월) ~ 10.4(일)</p><p>2) 심사: 10.5(월) ~ 10.7(수)</p><p>3) 심사 결과 발표: 10.8(목)</p><p>4) 전시 및 현장 투표: 10.29(목) ~ 11.1(일)</p><p>5) 특별상 발표: 11.6(금) *개별 연락</p><p><br></p><p>■ 신청 방법 : 일러스트레이션코리아 홈페이지 &gt;&gt; 관람포인트 &gt;&gt; 부대행사&nbsp; &gt;&gt; 공모전&nbsp; &nbsp;&gt;&gt; 참가신청 바로가기 (http://illustrationkorea.co.kr/viewpoint/contest/)&nbsp;</p><p><br></p><p>■ 발표</p><p>- 수상작 발표 : 2020년 11월 중 수상자 개별 통보</p><p><br></p><p>■ 시상내역</p><p><br></p><p>&lt;심사 통과자 전원(4~6명)&gt;</p><p>1) 2020 일러스트레이션코리아 부스참가비 면제 (목공 1부스, 880,000원 상당)</p><p>2) 목공 부스 뒷벽 현수막 6m*2m (포토존 3m+자체부스 3m+자체부스 날개벽 2m, 150,000원 상당 )</p><p>&nbsp; * 예시 홈페이지 공모전 페이지 참조 (http://illustrationkorea.co.kr/viewpoint/contest/)&nbsp;&nbsp;</p><p><br></p><p>&lt;특별상&gt;</p><p>- 인기상(2명): 2021 일러스트레이션코리아 부스참가비 면제 (목공 ½부스 1부스, 440,000원 상당)&nbsp;</p><p><br></p><p>■ 참가비 : 무료</p><p><br></p><p>■ 문의 : 02-6121-6447 ilko@esgroup.net<br><br><br><br><br></p><p>[메쎄이상 소개]</p><p>\"메쎄이상\"은 남다른 기획력과 인프라를 통해 건축, 인테리어, 베이비, 펫, 의료, VR 등 총 18개 산업에서 연간 43회의 전시회를 열고 있는 우리나라에서 가장 크고 대표적인 전시주최자입니다.</p><p><br></p><p>[일러스트레이션코리아 소개]</p><p>펀포유! 일코가 판 깔아줄게, 넌 놀기만 해!</p><p><br></p><p>연령불문, 취향소비자 모두 모여라! 모두를 만족시킬 단 하나의 플랫폼, 일러스트레이션코리아.</p><p><br></p><p>메쎄이상이 주최하는 \"일러스트레이션코리아\"는 참여작가와의 동반 성장을 핵심가치로 두고 일러스트레이션 콘텐츠 산업의 발판이 되는 전시회입니다.</p></div>"
		};
		ArrayList<int[]> act_reward = new ArrayList<int[]>();
		int[] rewardArr1 = {82};
		int[] rewardArr2 = {82, 83};
		act_reward.add(rewardArr1);
		act_reward.add(rewardArr2);
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			for(int i = 0; i < actThumb.length; i++) {
				sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_field, act_award, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, act_type);
				pstmt.setString(2, actThumb[i]);
				pstmt.setString(3, actTitle[i]);
				pstmt.setString(4, actOrg[i]);
				pstmt.setString(5, actTarget[i]);
				pstmt.setString(6, actStart[i]);
				pstmt.setString(7, actEnd[i]);
				pstmt.setInt(8, actField[i]);
				pstmt.setInt(9, actAward[i]);
				pstmt.setString(10, actHome[i]);
				pstmt.setString(11, actContent[i]);
				pstmt.executeUpdate();
				
				sql = "insert into act_reward values(act_seq.currval, ?)";
				pstmt = con.prepareStatement(sql);
				for(int actReward : act_reward.get(i)) {
					pstmt.setInt(1, actReward);
					pstmt.executeUpdate();
				}
			}
			System.out.println("입력");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		testMgr mgr = new testMgr();
//		mgr.admin();
//		mgr.personUser();
//		mgr.orgUser();
//		mgr.Activity();
		mgr.contest();
		System.out.println("입력 성공");
	}
}
