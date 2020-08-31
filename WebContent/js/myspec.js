// header 검색 버튼
$('#searchBtn').click(function(){
	if($('#search').value == "") {
		alert("검색어를 입력해주세요.");
		$('#search').focus;
		return false;
	}
});

var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식
var birthExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; // 생년월일 정규식
var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식

// 개인회원 Join
function person_Send() {
	if($("#person_id").val() == "") {
		alert("id를 입력해주세요.");
		$("#person_id").focus();
		return false;
	}
	if($("#person_id").val().length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		$("#person_id").focus();
		return false;
	}
	if($("#person_pwd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#person_pwd").focus();
		return false;
	}
	if($("#person_pwd").val() != $("#person_pwd_check").val()) {
		alert("비밀번호가 맞지 않습니다.");
		$("#person_pwd_check").focus();
		return false;
	}
	if($("#person_nick").val() == "") {
		alert("닉네임을 입력해주세요.");
		$("#person_nick").focus();
		return false;
	}
	if($("#person_birth").val() == "") {
		alert("생년월일을 입력해주세요.");
		$("#person_birth").focus();
		return false;
	}
	if(!$("#person_birth").val().match(birthExp)) {
		alert("생년월일 입력양식이 아닙니다.");
		$("#person_birth").focus();
		return false;
	}
	if($("#person_email").val() == "") {
		alert("이메일을 적어주세요.");
		$("#person_email").focus();
		return false;
	}
	if(!$("#person_email").val().match(emailExp)) {
		alert("이메일 입력양식이 아닙니다.");
		$("#person_email").focus();
		return false;
	}
	if($("#person_phone").val() == "") {
		alert("연락처를 적어주세요.");
		$("#person_phone").focus();
		return false;
	}
	if(!$("#person_phone").val().match(phoneExp)) {
		alert("연락처 입력 양식이 아닙니다.");
		$("#person_phone").focus();
		return false;
	}
	$("#personFrm").submit();
}

// 개인회원 id중복체크
function person_Check() {
	if($("#person_id").val() == "") {
		alert("아이디를 입력해주세요.")
		$("person_id").focus();
		return false;
	}
	if($("#person_id").val().length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		$("#person_id").focus();
		return false;
	}
	$.ajax({
		type:"post",
		url:"member/idCheck.jsp",
		data:{"memType" : $("#personFrm [name=\"memType\"]").val(),
			  "personid" : $("#person_id").val()},
		success:function(data){
			if(data.trim() == "yes") {
				alert("사용가능한 아이디입니다.");			
			}else if(data.trim() == "no") {
				alert("사용불가능한 아이디입니다.");
			}
		},
		error:function(e) {
			alert("error: " + e);
		}
	});
}

// 단체회원 Join
function org_Send() {
	if($("#org_id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_id").val().length < 4) {
		alert("아이디는 4글자 이상입력해주세요.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_pwd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#org_pwd").focus();
		return false;
	}
	if($("#org_pwd").val() != $("#org_pwd_check").val()) {
		alert("비밀번호가 맞지 않습니다.");
		$("#org_pwd").focus();
		return false;
	}
	if($("#org_name").val() == "") {
		alert("주최기관명을 입력해주세요.");
		$("#org_name").focus();
		return false;
	}
	if($("#org_type option:selected").val() == -1) {
		alert("기관형태를 선택해주세요.");
		return false;
	}
	if($("#org_manager").val() == "") {
		alert("담당자이름을 입력해주세요.");
		$("#org_manager").focus();
		return false;
	}
	if($("#org_email").val() == "") {
		alert("담당자이메일을 입력해주세요.");
		$("#org_email").focus();
		return false;
	}
	if(!$("#org_email").val().match(emailExp)) {
		alert("이메일 입력양식이 아닙니다.");
		$("#org_email").focus();
		return false;
	}
	if($("#org_phone").val() == "") {
		alert("담당자연락처를 입력해주세요.");
		$("#org_phone").focus();
		return false;
	}
	if(!$("#org_phone").val().match(phoneExp)) {
		alert("연락처 입력 양식이 아닙니다.");
		$("#org_phone").focus();
		return false;
	}
	$("#orgFrm").submit();
}

// 단체회원 id중복체크
function org_Check() {
	if($("#org_id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_id").val().length < 4) {
		alert("아이디는 4글자 이상입력해주세요.");
		$("#org_id").focus();
		return false;
	}
	$.ajax({
		type: "post",
		url: "member/idCheck.jsp",
		data: {"memType" : $("#orgFrm [name=\"memType\"]").val(),
			   "orgid" : $("#org_id").val()},
		success: function(data) {
			if(data.trim() == "yes") {
				alert("사용가능한 아이디입니다.");
			}else if(data.trim() == "no") {
				alert("사용불가능한 아이디입니다.");
			}
		},
		error: function(e) {
			alert("error: " + e);
		}
	});
}

// 개인회원 로그인
function person_Login() {
	if($("#person_login_id").val() == "") {
		alert("아이디를 입력해주세요");
		$("#person_login_id").focus();
		return false;
	}
	if($("person_login_pwd").val() == "") {
		alert("비밀번호를 입력해주세요");
		$("#person_login_pwd").focus();
		return false;
	}
	$("#personLoginFrm").submit();
}

// 단체회원 로그인
function org_Login() {
	if($("#org_login_id").val() == "") {
		alert("아이디를 입력해주세요");
		$("#org_login_id").focus();
		return false;
	}
	if($("org_login_pwd").val() == "") {
		alert("비밀번호를 입력해주세요");
		$("#org_login_pwd").focus();
		return false;
	}
	$("#orgLoginFrm").submit();
}

// id찾기 화면표시
function find_Id_mem() {
	var selected = $("#findIdMemtype option:selected");
	var output = "";
	if(selected.val() == 0) {
		output += "<div class=\"form-group\">"
		output += "<label for=\"email\">email</label>"
		output += "<input type=\"email\" name=\"email\" id=\"findPEmail\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"birth\">생년월일 (ex: 19581030)</label>"
		output += "<input type=\"text\" name=\"birth\" id=\"findPBirth\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"phone\">연락처</label>"
		output += "<input type=\"text\" name=\"phone\" id=\"findPPhone\" class=\"form-control\" />"
		output += "</div>"
	}
	else if(selected.val() == 1) {
		output += "<div class=\"form-group\">"
		output += "<label for=\"email\">email</label>"
		output += "<input type=\"email\" name=\"email\" id=\"findOEmail\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"orgName\">주최기관이름</label>"
		output += "<input type=\"text\" name=\"name\" id=\"findOName\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"orgManager\">담당자이름</label>"
		output += "<input type=\"text\" name=\"manager\" id=\"findOManager\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"phone\">담당자연락처</label>"
		output += "<input type=\"text\" name=\"phone\" id=\"findOPhone\" class=\"form-control\" />"
		output += "</div>"
	}
	$("#idTypeGroup").html(output);
}

// id찾기 버튼동작
function id_Find() {
	var selected = $("#findIdMemtype option:selected");
	if(selected.val() == -1) {
		alert("회원유형을 선택해주세요.");
		return false;
	}
	if(selected.val() == 0) {
		if($("#findPEmail").val() == "") {
			alert("이메일을 입력해주세요");
			$("#findPEmail").focus();
			return false;
		}
		if($("#findPBirth").val() == "") {
			alert("생년월일을 입력해주세요");
			$("#findPBirth").focus();
			return false;
		}
		if($("#findPPhone").val() == "") {
			alert("연락처를 입력해주세요");
			$("#findPPhone").focus();
			return false;
		}
	}
	else if(selected.val() == 1) {
		if($("#findOEmail").val() == "") {
			alert("이메일을 입력해주세요");
			$("#findOEmail").focus();
			return false;
		}
		if($("#findOName").val() == "") {
			alert("주최기관이름을 입력해주세요");
			$("#findOName").focus();
			return false;
		}
		if($("#findOManager").val() == "") {
			alert("담당자이름을 입력해주세요");
			$("#findOManager").focus();
			return false;
		}
		if($("#findOPhone").val() == "") {
			alert("담당자연락처를 입력해주세요");
			$("#findOPhone").focus();
			return false;
		}
	}
	var formData = $("#findIdFrm").serialize();
	$.ajax({
		url: "member/finderPro.jsp",
		type: "post",
		data: formData,
		success: function(data) {
			if(data.trim() == "false") {
				alert("이메일 발송에 실패하였습니다.");
			}else if(data.trim() == "true") {
				alert("아이디가 적힌 이메일을 발송하였습니다.");
				login();
			}
		},
		error: function(e) {
			alert("error: " + e);
		}
	});
}

// 비밀번호 찾기 버튼동작
function pwd_Find() {
	var selected = $("#findPwdMem option:selected");
	if(selected.val() == -1) {
		alert("회원 유형을 선택해주세요");
		return false;
	}
	if($("#findId").val() == "") {
		alert("아이디를 입력해주세요");
		$("#findId").focus();
		return false;
	}
	if($("#findEmail").val() == "") {
		alert("이메일을 입력해주세요");
		$("#findEmail").focus();
		return false;
	}
	var formData = $("#findPwdFrm").serialize();
	$.ajax({
		url: "member/finderPro.jsp",
		type: "post",
		data: formData,
		success: function(data) {
			if(data.trim() == "false") {
				alert("이메일 발송에 실패하였습니다.");
			}else if(data.trim() == "true") {
				alert("비밀번호가 적힌 이메일을 발송하였습니다.");
				login();
			}
		},
		error: function(e) {
			alert("error: " + e);
		}
	});
}

// 마이페이지 sidebar 동작
$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

// 메인화면 슬라이더 동작
$(document).ready(function () {
	$(".your-class").slick({
	  arrows: false,
	  infinite: false,
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  responsive: [
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1,
	        dots: true,
	      },
	    },
	  ],
	});
	$(".left").click(function () {
	  $(".your-class").slick("slickPrev");
	});
	$(".right").click(function () {
	  $(".your-class").slick("slickNext");
	});
	$(".your-class2").slick({
	  infinite: false,
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  responsive: [
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1,
	        dots: true,
	      },
	    },
	  ],
	});
	$(".left2").click(function () {
	  $(".your-class2").slick("slickPrev");
	});
	$(".right2").click(function () {
	  $(".your-class2").slick("slickNext");
	});
});

function reset() {
  $("#choicetag *").remove();
}

// 비동기 페이지 로딩 (navbar)
function activity() {
	$("main").load("activity/list_act.jsp");
}
function contest() {
	$("main").load("contest/list_gongmo.jsp");
}
function community() {
	$("main").load("community/community.jsp");
}
function mypage() {
	$("main").load("myPage/myPage.jsp");
}
function login() {
	$('main').load('member/login.jsp');
}
function join() {
	$("main").load("member/join.jsp");
}
function finder() {
	$("main").load("member/finder.jsp");
}
function act_detail() {
	$("main").load("activity/list_act_detailView.jsp");
}
function com_detail() {
	$("main").load("community/detailView.jsp");
}
function com_write() {
	$("main").load("community/write.jsp");
}
function my_com() {
	$("#myMain").load("myPage/myPage_community.jsp");
}
function my_info() {
	$("#myMain").load("myPage/myPage_info.jsp");
}
function my_delete() {
	$("#myMain").load("myPage/myPage_delete.jsp");
}
function my_orgReady() {
	$("#myMain").load("myPage/myPage_orgReady.jsp");
}
function my_orgRecru() {
	$("#myMain").load("myPage/myPage_orgRecru.jsp");
}
function act_update() {
	$("#myMain").load("activity/list_act_update.jsp");
}
function my_search() {
	$("main").load("search.jsp");
}

// 대외활동, 공모전 리스트 체크박스 동작
$("input:checkbox").click(function (e) {
  var id = $(e).attr("id");
  var str = "<button>" + id + "</button>";
  $("#choicetag").append(str);
});