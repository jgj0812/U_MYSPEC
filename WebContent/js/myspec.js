
function twitter(comm_num) {
	window.location.href = 'https://twitter.com/intent/tweet?text=MySpec 공유하기&url=http://192.168.0.42:8086/U_MYSPEC/community/detailView.jsp?comm_num=' + comm_num;
}

function facebook(comm_num){
	window.location.href='https://www.facebook.com/sharer/sharer.php?u=http://192.168.0.42:8086/U_MYSPEC/community/detailView.jsp?comm_num=' + comm_num;
}
function line(comm_num){
	window.location.href='https://social-plugins.line.me/lineit/share?url=http://192.168.0.42:8086/U_MYSPEC/community/detailView.jsp?comm_num=' + comm_num;
}

// header 검색 버튼
$('#searchBtn').click(function(){
	if($('#search').val() == "") {
		alert("검색어를 입력해주세요.");
		$('#search').focus;
		return false;
	}
});

var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식
var birthExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; // 생년월일 정규식
var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식

//datepicker 공통
$.datepicker.setDefaults({
	dateFormat: "yy-mm-dd",
	yearRange: "c-100:c+10",
	nextText: "다음 달",
	prevText: "이전 달",
	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dayNamesMin: ['일','월','화','수','목','금','토'],
	dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	showMonthAfterYear: true,
	yearSuffix: '년'
});

// 개인회원 생년월일 datepicker
$("#person_birth").datepicker({
	changeMonth: true,
	changeYear: true,
});

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
	var order = $("#activityListOrder option:selected").val();
	var data = $("#tagForm").serialize() + "&act_type=" + $.cookie("act_type") +"&order=" + order + "&pageNum=" + $.cookie("pageNum");
	var list;
	var tag;
	switch($.cookie("act_type")) {
		case "1":
			list = "list_actPro.jsp";
			tag = "list_act_tagPro.jsp";
			break;
		case "2":
			list = "list_conPro.jsp";
			tag = "list_con_tagPro.jsp";
			break;
	}
	$.ajax({
		url: tag,
		data: data,
		dataType: "json",
		cache: false,
		success: function(data) {
			var htmlStr = "";
			$.each(data, function(key, val) {
				htmlStr += "<input type='button' class='choiceButton' onclick='tagRemove(" + val.tag_num + ")' value='" + val.tag + "'>";
			});
			$("#choicetag").html(htmlStr);
		}
	});
	$.ajax({
		url: list,
		data: data,
		dataType: "json",
		cache: false,
		success: function(data) {
			len = Object.keys(data).length;
			getActivityList(data);
			makePagination(data[len - 1]);
		}
	});
}

function tagReset() {
	$("#tagForm")[0].reset();
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
			}
		}
    });
	
	$("#act_form input[name='act_start']").datepicker();
	$("#act_form input[name='act_end']").datepicker();
	$("#comm_content").summernote({
			lang: "ko-KR",
	      	height: "20em",
	});
});

function sendFile(file, editor) {
	data = new FormData();
	data.append("uploadFile", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "../activity/act_content_imageUpload.jsp",
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			$(editor).summernote("insertImage", data.url);
		}
	});
}


// 활동 리스트
function getActivityList(data) {
	var htmlStr = "";
	var detailUrl;
	switch($.cookie("act_type")) {
		case "1":
			detailUrl = "list_act_detail.jsp"
			break;
		case "2":
			detailUrl = "list_con_detail.jsp"
			break;
		break;
	}
	len = Object.keys(data).length;
	for(var i = 0; i < len - 1; i++) {
		if(i % 4 == 0) {
			htmlStr += "<div class='row'>";
		}
		htmlStr += "<div class='col-6 col-sm-6 col-lg-3' id='col'>";
		htmlStr += "<a href='" + detailUrl +"?act_num=" + data[i].act_num + "'><img src='../upload/" + data[i].act_thumb + "'></a>";
		htmlStr += "<br>";
		htmlStr += "<div class='list_explain'>";
		htmlStr += "<a href='" + detailUrl +"?act_num=" + data[i].act_num + "'><div class='list_explain_title'>" + data[i].act_title + "<br></div></a>";
		htmlStr += data[i].org_name + "<br>";
		htmlStr += "D-" + data[i].act_dday + "&nbsp;조회수&nbsp;" + data[i].act_hits;
		htmlStr += "</div></div>";
		if(i % 4 == 3) {
			htmlStr += "</div>";
		}
	}
	$("#activityList").html(htmlStr);
}

function makePagination(data) {
	var count = data.act_count;
	var startPage = data.act_startPage;
	var endPage = data.act_endPage;
	var page = data.act_page;
	var pageBlock = 4;
	
	htmlStr = "<li class='page-item' onclick='getPage(startPage - pageBlock)'>";
	htmlStr += "<a class='page-link' href='#' aria-label='Previous'>";
	htmlStr += "<span aria-hidden='true' class='text-dark' style='font-weight:bolder;'>이전</span>";
	htmlStr += "<span class='sr-only'>이전</span>";
	htmlStr += "</a></li>";
	for(var i = startPage; i <= endPage; i++) {
		if(i == page) {
			htmlStr += "<li class='page-item active' onclick='getPage(" + i + ")'><a class='page-link text-dark' href='#'>" + i + "</a></li>";
			continue;
		}
		htmlStr += "<li class='page-item' onclick='getPage(" + i + ")'><a class='page-link text-dark' href='#'>" + i + "</a></li>";
	}
	htmlStr += "<a class='page-link' href='#'' aria-label='Next'>";
	htmlStr += "<span aria-hidden='true' class='text-dark' style='font-weight:bolder;' onclick='getPage(startPage + pageBlock)'>다음</span>";
	htmlStr += "<span class='sr-only'>다음</span>";
	htmlStr += "</a></li>";
	
	$("#activityCount").html("검색결과 " + count + "건");
	$(".pagination").html(htmlStr);
}

function getPage(pageNum) {
	var url;
	switch($.cookie("act_type")) {
		case "1":
			url = "list_actPro.jsp";
			break;
		case "2":
			url = "list_conPro.jsp";
			break;
	}
	$.cookie("pageNum", pageNum);
	$.ajax({
		url: url,
		data: {
			act_type: $.cookie("act_type"),
			order: $("#activityListOrder option:selected").val(),
			pageNum: $.cookie("pageNum")
		},
		dataType: "json",
		cache: false,
		success: function(data) {
			len = Object.keys(data).length;
			getActivityList(data);
			makePagination(data[len - 1]);
		}
	});
}

function scrap(person_id, act_num) {
	var url;
	switch($.cookie("act_type")) {
		case "1":
			url = "list_act_scrapPro.jsp";
			break;
		case "2":
			url = "list_con_scrapPro.jsp";
			break;			
	}
	$.ajax({
		url: url,
		data: {
			person_id: person_id,
			act_num: act_num
		},
		success: function(data) {
			switch(data) {
				case '-1':
					alert("스크랩에 오류가 발생했습니다.");
					break;
				case '0':
					alert("이미 스크랩한 활동입니다.");
					break;
				case '1':
					alert("스크랩 했습니다.");
					break;
			}
		}
	});
}

// list_act_write.jsp
function get_thumb_filename() {
	var filename = $("#act_form input[name='act_thumb']")[0].files[0].name;
	$("#thumb_filename").html(filename);
}

function get_post_filename() {
	var filename = $("#act_form input[name='act_post']")[0].files[0].name;
	$("#post_filename").html(filename);
}

function act_submit() {
	var currDate = new Date(new Date().getYear() + 1900, new Date().getMonth(), new Date().getDate());
	var startDate = Date.parse($("#act_form input[name='act_start']").val());
	var endDate = Date.parse($("#act_form input[name='act_end']").val());

	if($("#act_form input[name='act_title']").val().length == 0) {
		alert("제목을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_target']").val().length == 0) {
		alert("참여대상을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_type']:checked").length == 0) {
		alert("종류를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_start']").val().length == 0) {
		alert("시작기간을 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_end']").val().length == 0) {
		alert("마감기간을 입력해주세요.");
		return;
	}
	if(startDate < currDate || startDate > endDate) {
		alert("날짜를 정확하게 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_type']:checked").val() == "1") {
		if($("#act_form input[name='act_pop']").val().length == 0) {
			alert("모집인원을 입력해주세요.");
			return;
		}
		if(isNaN($("#act_form input[name='act_pop']").val()) || $("#act_form input[name='act_pop']").val() < 1) {
			alert("모집인원을 정확하게 입력해주세요.");
			return;
		}
		if($("#act_form input[name='act_reg']:checked").length == 0) {
			alert("모임지역을 선택해주세요.");
			return;
		}
	}
	if($("#act_form input[name='act_field']:checked").length == 0) {
		alert("활동분야를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_type']:checked").val() == "1") {
		if($("#act_form input[name='act_interest']:checked").length == 0) {
			alert("관심분야를 선택해주세요.");
			return;
		}
	}
	if($("#act_form input[name='act_home']").val().length == 0) {
		alert("홈페이지를 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_type']:checked").val() == "2") {
		if($("#act_form input[name='act_award']").val().length == 0) {
			alert("시상규모을 입력해주세요.");
			return;
		}
		if($("#act_form input[name='act_award']").val() < 0) {
			alert("시상규모을 정확하게 입력해주세요.");
			return;
		}
	}
	if($("#act_form input[name='act_reward']:checked").length == 0) {
		alert("활동혜택을 선택해주세요.");
		return;
	}
	if($("#act_form textarea[name='act_content']").val().length == 0) {
		alert("상세내용을 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_thumb']").val().length == 0) {
		alert("썸네일을 선택해주세요.");
		return;
	}
	$("#act_form").submit();
}

// list_act_update.jsp
function getValue(frm) {
	var url;
	switch($.cookie("act_type")) {
		case "1":
			url = "list_act_tagPro.jsp";
			break;
		case "2":
			url = "list_con_tagPro.jsp";
			break;
	}
	var data = $(frm).serialize();
	$.ajax({
		url: url,
		data: data,
		dataType: "json",
		cache: false,
		success: function(data) {
			var htmlStr = "";
			$.each(data, function(key, val) {
				htmlStr += val.tag + " ";
			});
			$("#" + frm.id + "_view").val(htmlStr);
		}
	});
}

function act_update(act_num) {
	var currDate = new Date(new Date().getYear() + 1900, new Date().getMonth(), new Date().getDate());
	var startDate = Date.parse($("#act_form input[name='act_start']").val());
	var endDate = Date.parse($("#act_form input[name='act_end']").val());
	var data = new FormData();
	var formData;
	
	if($("#act_form input[name='act_title']").val().length == 0) {
		alert("제목을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_target']").val().length == 0) {
		alert("참여대상을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_start']").val().length == 0) {
		alert("시작기간을 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_end']").val().length == 0) {
		alert("마감기간을 입력해주세요.");
		return;
	}
	if(startDate < currDate || startDate > endDate) {
		alert("날짜를 정확하게 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_pop']").val().length == 0) {
		alert("모집인원을 입력해주세요.");
		return;
	}
	if(isNaN($("#act_form input[name='act_pop']").val()) || $("#act_form input[name='act_pop']").val() < 1) {
		alert("모집인원을 정확하게 입력해주세요.");
		return;
	}
	if($("#act_reg input[name='act_reg']:checked").length == 0) {
		alert("모임지역을 선택해주세요.");
		return;
	}
	if($("#act_field input[name='act_field']:checked").length == 0) {
		alert("활동분야를 선택해주세요.");
		return;
	}
	if($("#act_interest input[name='interest_num']:checked").length == 0) {
		alert("관심분야를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_home']").val().length == 0) {
		alert("홈페이지를 입력해주세요.");
		return;
	}
	if($("#act_reward input[name='reward_num']:checked").length == 0) {
		alert("활동혜택을 선택해주세요.");
		return;
	}
	if($("#act_form textarea[name='act_content']").val().length == 0) {
		alert("상세내용을 입력해주세요.");
		return;
	}
	
	data.append("act_num", act_num);
	formData= new FormData($("#act_form")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}

	formData = new FormData($("#act_reg")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}

	formData = new FormData($("#act_reward")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}
	
	formData = new FormData($("#act_field")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}
	
	formData = new FormData($("#act_interest")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}
	
	/*
	for(var key of data.keys()) {
		alert(key + ":" + data.get(key));
	}
	*/
	$.ajax({
		url: "list_act_updatePro.jsp",
		type : "POST",
		enctype: "multipart/form-data",
		data: data,
		cache: false,
		processData: false,
    	contentType: false,
		success: function() {
			alert("수정했습니다.");
		},
	});
}

function con_update(act_num) {
	var currDate = new Date(new Date().getYear() + 1900, new Date().getMonth(), new Date().getDate());
	var startDate = Date.parse($("#act_form input[name='act_start']").val());
	var endDate = Date.parse($("#act_form input[name='act_end']").val());
	var data = new FormData();
	var formData;
	
	if($("#act_form input[name='act_title']").val().length == 0) {
		alert("제목을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_target']").val().length == 0) {
		alert("참여대상을 입력해주세요");
		return;
	}
	if($("#act_form input[name='act_start']").val().length == 0) {
		alert("시작기간을 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_end']").val().length == 0) {
		alert("마감기간을 입력해주세요.");
		return;
	}
	if(startDate < currDate || startDate > endDate) {
		alert("날짜를 정확하게 입력해주세요.");
		return;
	}
	if($("#act_field input[name='act_field']:checked").length == 0) {
		alert("활동분야를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_home']").val().length == 0) {
		alert("홈페이지를 입력해주세요.");
		return;
	}
	if($("#act_form input[name='act_award']").val().length == 0) {
			alert("시상규모을 입력해주세요.");
			return;
	}
	if($("#act_form input[name='act_award']").val() < 0) {
		alert("시상규모을 정확하게 입력해주세요.");
		return;
	}
	if($("#act_reward input[name='reward_num']:checked").length == 0) {
		alert("활동혜택을 선택해주세요.");
		return;
	}
	if($("#act_form textarea[name='act_content']").val().length == 0) {
		alert("상세내용을 입력해주세요.");
		return;
	}
	
	data.append("act_num", act_num);
	formData= new FormData($("#act_form")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}

	formData = new FormData($("#act_reward")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}
	
	formData = new FormData($("#act_field")[0]);
	for(var key of formData.keys()) {
		data.append(key, formData.get(key));
	}
	
	/*
	for(var key of data.keys()) {
		alert(key + ":" + data.get(key));
	}
	*/
	$.ajax({
		url: "list_con_updatePro.jsp",
		type : "POST",
		enctype: "multipart/form-data",
		data: data,
		cache: false,
		processData: false,
    	contentType: false,
		success: function() {
			alert("수정했습니다.");
			history.go(0);
		}
	});
}

function get_thumb() {
	var filename = $("#act_form input[name='act_thumb']")[0].files[0].name;
	var reader = new FileReader();
	
	$("#thumb_filename").html(filename);
	reader.onload = function(e) {
		$("#thumb_image").attr("src", e.target.result);
	}
	reader.readAsDataURL($("#act_form input[name='act_thumb']")[0].files[0]);
}

function get_post() {
	var filename = $("#act_form input[name='act_post']")[0].files[0].name;
	var reader = new FileReader();
	
	$("#post_filename").html(filename);
	reader.onload = function(e) {
		$("#post_image").attr("src", e.target.result);
	}
	reader.readAsDataURL($("#act_form input[name='act_post']")[0].files[0]);
}

function copy_to_clipboard() {
	document.getElementById("copyURL").select();
	document.execCommand("copy");
}

// 개인 리스트 검색(admin)
$("#personSearchBtn").click(function(){
	if($("#personSearch").val() == "") {
		alert("검색어를 입력하세요");
		$("#personSearch").focus();
		return false;
	}
	$("#personSearchFrm").submit();
});

// 단체 리스트 검색(admin)
$("#orgSearchBtn").click(function(){
	if($("#orgSearch").val() == "") {
		alert("검색어를 입력하세요");
		$("#orgSearch").focus();
		return false;
	}
	$("#orgSearchFrm").submit();
});

//-------------------------------커뮤니티 js--------------------------------------
// 커뮤니티 공지글 검색(admin)
$("#noticeSearchBtn").click(function(){
	if($("#noticeSearch").val() == "") {
		alert("검색얼르 입력하세요");
		$("#noticeSearch").focus();
		return false;
	}
	$("#noticeSearchFrm").submit();
});

//커뮤니티 글쓰기로 가기
function comm_write(id) {
	if(id == 'null') {
		alert("로그인을 해야 글쓰기가 가능합니다.");
		window.location = "../member/login.jsp";
	}else {
		window.location = "write.jsp";	
	}
}

// 커뮤니티 글쓰기 유효성
$("#comm_write").click(function(){
	if($("#comm_title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#comm_content").focus();
		return false;
	}
	if($("#comm_content").val() == "") {
		alert("내용을 입력해주세요");
		$("#comm_content").focus();
		return false;
	}
	$("#comm_form").submit();
});

//이전글
function prev(prev_comm){
 	if(prev_comm == 0){
		alert("이전 글이 없습니다.");
	}else{
		window.location = "detailView.jsp?comm_num=" + prev_comm;
	}
}

//다음글
function next(next_comm){
 	if(next_comm == 0){
		alert("다음 글이 없습니다.");
	}else{
		window.location = "detailView.jsp?comm_num=" + next_comm;
	}
}

//댓글 유효성
function reply_ok() {
	if($("#replyFrm [name=rep_content]").val() == "") {
		alert("댓글 내용을 입력해주세요.");
		$("#replyFrm [name=rep_content]").focus();
		return false;
	}
	$("#replyFrm").submit();
}

// 대댓글 유효성
function rereply_ok(i) {
	if($("#rereplyFrm" + i +" [name=rep_content]").val() == "") {
		alert("답글 내용을 입력해주세요.");
		$("#rereplyFrm" + i +" [name=rep_content]").focus();
		return false;
	}
	$("#rereplyFrm" + i).submit();
}

// 답글 입력폼
function rereply(i){
	var rereply = document.getElementById("rereply" + i);
	if(rereply.style.display =='none'){
		rereply.style.display = 'block';
	}else if(rereply.style.display =='block'){
		rereply.style.display = 'none';
	}
}

// 댓글 수정 폼
function update(i){
	var update = document.getElementById("update" + i);
	var basic = document.getElementById("basic" + i);
	
	if(update.style.display =='none'){
		update.style.display = 'block';
		basic.style.display = 'none';
	}else if(update.style.display =='block'){
		update.style.display = 'none';
		basic.style.display = 'block';
	}
}

// 댓글 수정 취소
function updatecancel(i){
	var update = document.getElementById("update" + i);
	var basic = document.getElementById("basic" + i);
	if(update.style.display =='block'){
		update.style.display = 'none';
		basic.style.display = 'block';
	}
}

// myPage 수정 양식, 비밀번호 변경
$("#UpdateBtn").click(function(){
	
	// 개인 회원 닉네임
	if($("#nick_check").val() == "") {
	alert("닉네임이 입력해 주세요.");
	$("#nick_check").focus();
	return false;
	}
	
	// 단체 회원 담당자
	if($("#manager_check").val() == "") {
	alert("담당자 이름을 입력해 주세요.");
	$("#manager_check").focus();
	return false;
	}
	
	// 공용 
	if($("#phone_check").val() == "") {
	alert("연락처를 입력해 주세요.");
	$("#phone_check").focus();
	return false;
	}
	
	if(!$("#phone_check").val().match(phoneExp)) {
		alert("연락처 입력 양식이 아닙니다.");
		$("#phone_check").focus();
		return false;
	}
	
	if($("#email_check").val() == "") {
	alert("연락처를 입력해 주세요.");
	$("#email_check").focus();
	return false;
	}
	
	if(!$("#email_check").val().match(emailExp)) {
		alert("이메일 입력양식이 아닙니다.");
		$("#email_check").focus();
		return false;
	}
	
	// 기존 비밀번호는 필수적 입력
	if($("#old_pwd").val() == "") {
	alert("기존 비밀번호를 입력해 주세요.");
	return;
	}
	
	// 새로운 비밀번호칸이 빈칸이 아닐경우 실행
	if($("#password").val() != "") {
		if ($("#pwd_check").val() == "") {
		alert("새로운 비밀번호 확인을 입력해 주세요.");
		return;
		}
		if($("#pwd_check").val() != $("#password").val()) {
			alert("새로운 비밀번호 확인이 틀렸습니다.");
			return;
		}
	}
	$("#UpdateFrm").submit();
});
