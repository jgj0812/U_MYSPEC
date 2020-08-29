// header �˻� ��ư
$('#searchBtn').click(function(){
	if($('#search').value == null) {
		alert("�˻�� �Է����ּ���.");
		$('#search').focus;
		return false;
	}
});

var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // �ڵ�����ȣ ���Խ�
var birthExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; // ������� ���Խ�
var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // �̸��� ���Խ�

// ����ȸ�� Join
$("#personSend").click(function(){
	if($("#person_id").val() == "") {
		alert("id�� �Է����ּ���.");
		$("#person_id").focus();
		return false;
	}
	if($("#person_id").val().length < 4) {
		alert("���̵�� 4���� �̻��̾�� �մϴ�.");
		$("#person_id").focus();
		return false;
	}
	if($("#person_pwd").val() == "") {
		alert("��й�ȣ�� �Է����ּ���.");
		$("#person_pwd").focus();
		return false;
	}
	if($("#person_pwd").val() != $("#person_pwd_check").val()) {
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		$("#person_pwd_check").focus();
		return false;
	}
	if($("#person_nick").val() == "") {
		alert("�г����� �Է����ּ���.");
		$("#person_nick").focus();
		return false;
	}
	if($("#person_birth").val() == "") {
		alert("��������� �Է����ּ���.");
		$("#person_birth").focus();
		return false;
	}
	if(!$("#person_birth").val().match(birthExp)) {
		alert("������� �Է¾���� �ƴմϴ�.");
		$("#person_birth").focus();
		return false;
	}
	if($("#person_email").val() == "") {
		alert("�̸����� �����ּ���.");
		$("#person_email").focus();
		return false;
	}
	if(!$("#person_email").val().match(emailExp)) {
		alert("�̸��� �Է¾���� �ƴմϴ�.");
		$("#person_email").focus();
		return false;
	}
	if($("#person_phone").val() == "") {
		alert("����ó�� �����ּ���.");
		$("#person_phone").focus();
		return false;
	}
	if(!$("#person_phone").val().match(phoneExp)) {
		alert("����ó �Է� ����� �ƴմϴ�.");
		$("#person_phone").focus();
		return false;
	}
	$("#personFrm").submit();
});

// ����ȸ�� id�ߺ�üũ
$("#person_idCheck").click(function(){
	if($("#person_id").val() == "") {
		alert("���̵� �Է����ּ���.")
		$("person_id").focus();
		return false;
	}
	if($("#person_id").val().length < 4) {
		alert("���̵�� 4���� �̻��̾�� �մϴ�.");
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
				alert("��밡���� ���̵��Դϴ�.");			
			}else if(data.trim() == "no") {
				alert("���Ұ����� ���̵��Դϴ�.");
			}
		},
		error:function(e) {
			alert("error: " + e);
		}
	});
});

// ��üȸ�� Join
$("#orgSend").click(function(){
	if($("#org_id").val() == "") {
		alert("���̵� �Է����ּ���.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_id").val().length < 4) {
		alert("���̵�� 4���� �̻��Է����ּ���.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_pwd").val() == "") {
		alert("��й�ȣ�� �Է����ּ���.");
		$("#org_pwd").focus();
		return false;
	}
	if($("#org_pwd").val() != $("#org_pwd_check").val()) {
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		$("#org_pwd").focus();
		return false;
	}
	if($("#org_name").val() == "") {
		alert("���ֱ������ �Է����ּ���.");
		$("#org_name").focus();
		return false;
	}
	if($("#org_type option:selected").val() == -1) {
		alert("������¸� �������ּ���.");
		return false;
	}
	if($("#org_manager").val() == "") {
		alert("������̸��� �Է����ּ���.");
		$("#org_manager").focus();
		return false;
	}
	if($("#org_email").val() == "") {
		alert("������̸����� �Է����ּ���.");
		$("#org_email").focus();
		return false;
	}
	if(!$("#org_email").val().match(emailExp)) {
		alert("�̸��� �Է¾���� �ƴմϴ�.");
		$("#org_email").focus();
		return false;
	}
	if($("#org_phone").val() == "") {
		alert("����ڿ���ó�� �Է����ּ���.");
		$("#org_phone").focus();
		return false;
	}
	if(!$("#org_phone").val().match(phoneExp)) {
		alert("����ó �Է� ����� �ƴմϴ�.");
		$("#org_phone").focus();
		return false;
	}
	$("#orgFrm").submit();
});

// ��üȸ�� id�ߺ�üũ
$("#org_idCheck").click(function(){
	if($("#org_id").val() == "") {
		alert("���̵� �Է����ּ���.");
		$("#org_id").focus();
		return false;
	}
	if($("#org_id").val().length < 4) {
		alert("���̵�� 4���� �̻��Է����ּ���.");
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
				alert("��밡���� ���̵��Դϴ�.");
			}else if(data.trim() == "no") {
				alert("���Ұ����� ���̵��Դϴ�.");
			}
		},
		error: function(e) {
			alert("error: " + e);
		}
	});
});

// ����ȸ�� �α���
$("#personLogin").click(function(){
	if($("#person_login_id").val() == "") {
		alert("���̵� �Է����ּ���");
		$("#person_login_id").focus();
		return false;
	}
	if($("person_login_pwd").val() == "") {
		alert("��й�ȣ�� �Է����ּ���");
		$("#person_login_pwd").focus();
		return false;
	}
	$("#personLoginFrm").submit();
});

// ��üȸ�� �α���
$("#orgLogin").click(function(){
	if($("#org_login_id").val() == "") {
		alert("���̵� �Է����ּ���");
		$("#org_login_id").focus();
		return false;
	}
	if($("org_login_pwd").val() == "") {
		alert("��й�ȣ�� �Է����ּ���");
		$("#org_login_pwd").focus();
		return false;
	}
	$("#orgLoginFrm").submit();
});

// idã�� ȭ��ǥ��
$("#findIdMemtype").change(function(){
	var selected = $("#findIdMemtype option:selected");
	var output = "";
	if(selected.val() == 0) {
		output += "<div class=\"form-group\">"
		output += "<label for=\"email\">email</label>"
		output += "<input type=\"email\" name=\"email\" id=\"findPEmail\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"birth\">������� (ex: 19581030)</label>"
		output += "<input type=\"text\" name=\"birth\" id=\"findPBirth\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"phone\">����ó</label>"
		output += "<input type=\"text\" name=\"phone\" id=\"findPPhone\" class=\"form-control\" />"
		output += "</div>"
	}
	else if(selected.val() == 1) {
		output += "<div class=\"form-group\">"
		output += "<label for=\"email\">email</label>"
		output += "<input type=\"email\" name=\"email\" id=\"findOEmail\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"orgName\">���ֱ���̸�</label>"
		output += "<input type=\"text\" name=\"name\" id=\"findOName\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"orgManager\">������̸�</label>"
		output += "<input type=\"text\" name=\"manager\" id=\"findOManager\" class=\"form-control\" />"
		output += "</div>"
		output += "<div class=\"form-group\">"
		output += "<label for=\"phone\">����ڿ���ó</label>"
		output += "<input type=\"text\" name=\"phone\" id=\"findOPhone\" class=\"form-control\" />"
		output += "</div>"
	}
	$("#idTypeGroup").html(output);
});

// idã�� ��ư����
$("#idFindBtn").click(function(){
	var selected = $("#findIdMemtype option:selected");
	if(selected.val() == -1) {
		alert("ȸ�������� �������ּ���.");
		return false;
	}
	if(selected.val() == 0) {
		if($("#findPEmail").val() == "") {
			alert("�̸����� �Է����ּ���");
			$("#findPEmail").focus();
			return false;
		}
		if($("#findPBirth").val() == "") {
			alert("��������� �Է����ּ���");
			$("#findPBirth").focus();
			return false;
		}
		if($("#findPPhone").val() == "") {
			alert("����ó�� �Է����ּ���");
			$("#findPPhone").focus();
			return false;
		}
	}
	else if(selected.val() == 1) {
		if($("#findOEmail").val() == "") {
			alert("�̸����� �Է����ּ���");
			$("#findOEmail").focus();
			return false;
		}
		if($("#findOName").val() == "") {
			alert("���ֱ���̸��� �Է����ּ���");
			$("#findOName").focus();
			return false;
		}
		if($("#findOManager").val() == "") {
			alert("������̸��� �Է����ּ���");
			$("#findOManager").focus();
			return false;
		}
		if($("#findOPhone").val() == "") {
			alert("����ڿ���ó�� �Է����ּ���");
			$("#findOPhone").focus();
			return false;
		}
	}
	$("#findIdFrm").submit();
});

// ��й�ȣ ã�� ��ư����
$("#pwdFindBtn").click(function(){
	var selected = $("#findPwdMemtype option:selected");
	if(selected.val() == -1) {
		alert("ȸ�� ������ �������ּ���");
		return false;
	}
	else {
		if($("#findId").val() == "") {
			alert("���̵� �Է����ּ���");
			$("#findId").focus();
			return false;
		}
		if($("#findEmail").val() == "") {
			alert("�̸����� �Է����ּ���");
			$("#findEmail").focus();
			return false;
		}
	}
	$("#findPwdFrm").submit();
});

// ���������� sidebar ����
$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

// ����ȭ�� �����̴� ����
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