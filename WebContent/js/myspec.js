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
$("#personSend").click(function(){
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
	if($("#person_id").attr("check_result") == "fail") {
		alert("아이디 중복체크를 해주시기 바랍니다.");
		$("#person_id").focus();
		return false;
	}
	$("#personFrm").submit();
});

// 개인회원 id중복체크
$("#person_idCheck").click(function(){
	$("#person_id").change(function(){
		$("#person_idCheckOk").hide();
		$("#person_idCheck").show();
		$("#person_id").attr("check_result", "fail");
	});
	
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
		url:"idCheck.jsp",
		data:{"memType" : $("#personFrm [name=\"memType\"]").val(),
			  "personid" : $("#person_id").val()},
		success:function(data){
			if(data.trim() == "yes") {
				alert("사용가능한 아이디입니다.");
				$("#person_id").attr("check_result", "success");
				$("#person_idCheckOk").show();
				$("#person_idCheck").hide();
				return;		
			}else if(data.trim() == "no") {
				alert("중복된 아이디입니다.");
				$("person_id").focus();
			}
		},
		error:function(e) {
			alert("error: " + e);
		}
	});
});

// 단체회원 Join
$("#orgSend").click(function(){
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
	if($("#org_id").attr("check_result") == "fail") {
		alert("아이디 중복체크를 해주세요");
		$("#org_id").focus();
		return false;
	}
	$("#orgFrm").submit();
});

// 단체회원 id중복체크
$("#org_idCheck").click(function(){
	$("#org_id").change(function(){
		$("#org_idCheckOk").hide();
		$("#org_idCheck").show();
		$("#org_id").attr("check_result", "fail");
	});
	
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
		url: "idCheck.jsp",
		data: {"memType" : $("#orgFrm [name=\"memType\"]").val(),
			   "orgid" : $("#org_id").val()},
		success: function(data) {
			if(data.trim() == "yes") {
				alert("사용가능한 아이디입니다.");
				$("#org_idCheckOk").show();
				$("#org_idCheck").hide();
				$("#org_id").attr("check_result", "success");
				return;
			}else if(data.trim() == "no") {
				alert("중복된 아이디입니다.");
				$("#org_id").focus();
				return;
			}
		},
		error: function(e) {
			alert("error: " + e);
		}
	});
});

// 개인회원 로그인
$("#personLogin").click(function(){
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
});

// 단체회원 로그인
$("#orgLogin").click(function(){
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
});

// id찾기 화면표시
$("#findIdMemtype").change(function(){
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
});

// id찾기 버튼동작
$("#idFindBtn").click(function(){
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
	$("#findIdFrm").submit();
});

// 비밀번호 찾기 버튼동작
$("#pwdFindBtn").click(function(){
	var selected = $("#findPwdMemtype option:selected");
	if(selected.val() == -1) {
		alert("회원 유형을 선택해주세요");
		return false;
	}
	else {
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
	}
	$("#findPwdFrm").submit();
});

// admin 개인회원 삭제
function person_del(id) {
	$.getJSON("adminDeletePro.jsp?memType=0&id=" + id, function(data){
		var htmlStr = "";
		$.each(data, function(key, val){
			htmlStr += "<tr>";
			htmlStr += "<td>" + val.id + "</td>";
			htmlStr += "<td>" + val.nick + "</td>";
			htmlStr += "<td>" + val.birth + "</td>";
			htmlStr += "<td>" + val.email + "</td>";
			htmlStr += "<td>" + val.phone + "</td>";
			htmlStr += "<td><button onclick=\"person_del('<%=pb.getId() %>')\" class=\"btn btn-danger m-2\">삭제</button></td>";
			htmlStr += "</tr>";
		});
		$("table tbody").html(htmlStr);
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

// 대외활동, 공모전 리스트 체크박스 동작
function tagSearch() {
	var data = $("#tagForm").serialize();
	$.ajax({
		url: "list_act_tagPro.jsp",
		data: data,
		dataType: "html",
		cache: false,
		success: function(data) {
			$("#choicetag").html(data);
		}
	});
}

function tagReset() {
	$("#tagForm").each(function(){
		this.reset();
	});
	$("#tagForm").change();
}

function tagRemove(tag_num) {
	$("#tagForm input:checkbox[value=" + tag_num + "]").prop("checked", false);
	$("#tagForm").change();
}

// summernote
$(document).ready(function () {
	$("#act_content").summernote({
		lang: "ko-KR",
		callbacks : {
			onImageUpload : function(files) {
				sendFile(files[0], this);
			},
		}
    });
	$("#act_form input[name='act_start']").datepicker({
		dateFormat: "yy-mm-dd"
	});
	$("#act_form input[name='act_end']").datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function sendFile(file, editor) {
	data = new FormData();
	data.append("uploadFile", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "act_content_imageUpload.jsp",
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			$(editor).summernote("insertImage", data.url);
		}
	});
}

//커뮤니티 글쓰기
function comm_write() {
	window.location = "write.jsp";
}

// 활동 리스트
$(document).ready(function() {
	$.ajax({
		url: "list_actPro.jsp",
		data: {
			act_type: 1
		},
		dataType: "json",
		cache: false,
		success: function(data) {
			var htmlStr = "";
			$.each(data, function(key, val) {
				if(key % 4 == 0) {
					htmlStr += "<div class='row'>";
				}
				htmlStr += "<div class='col-6 col-sm-6 col-lg-3' id='col'>";
				htmlStr += "<a href='list_act_detail.jsp?act_num=" + val.act_num + "'><img src='../upload/" + val.act_thumb + "'></a>";
				htmlStr += "<br>";
				htmlStr += "<div class='list_explain'>";
				htmlStr += "<a href='list_act_detail.jsp?act_num=" + val.act_num + "'><div class='list_explain_title'>" + val.act_title + "<br></div></a>";
				htmlStr += val.org_name + "<br>";
				htmlStr += "D-" + val.act_dday + "&nbsp;조회수&nbsp;" + val.act_hits;
				htmlStr += "</div></div>";
				if(key % 4 == 3) {
					htmlStr += "</div>";
				}
			});
			$("#activityList").html(htmlStr);
		}
	});
});