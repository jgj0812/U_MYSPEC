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
	if($("#act_form input[name='act_field']:checked").length == 0) {
		alert("활동분야를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_interest']:checked").length == 0) {
		alert("관심분야를 선택해주세요.");
		return;
	}
	if($("#act_form input[name='act_home']").val().length == 0) {
		alert("홈페이지를 입력해주세요.");
		return;
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
	if($("#act_form input[name='act_post']").val().length == 0) {
		alert("포스터를 선택해주세요.");
		return;
	}
}