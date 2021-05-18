function email(){
		window.open("../check/mail.jsp", "이메일 확인", "width=600, height=400");
}

function test(){
	window.open("../check/FindId.jsp","중복확인","width=600, height=400");
}

function check_pw(){
	window.open("../members/check_pw.jsp", "비밀번호중복 확인", "width=600, height=200");
}


function clickMember()
{
	var regExpId=/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName = /^[가-힣|a-z|A-Z]*$/;
	var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	/*DOM 객체형의 멤버로 변수에 할당*/
	var form= document.AddMember;
	var id = form.user_id.value;
	var name= form.user_name.value;
	var phone = form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
	var email = form.user_email.value;
	var pw= form.user_pw.value;
	var birth=form.user_birth.value;
	var post= form.post_address.value;
	var detailaddress= form.detail_address.value;
	
	if(!regExpId.test(id))
		{
			alert("id는 문자로 시작해주세요");
			return;
		}
	if(pw=="")
	{
		alert("비밀번호는 필수로 입력하셔야 합니다");
		return;
	}
	
	if(name=="")
	{
		alert("이름은 비워두실 수 없습니다.");
		return;
	}
	
	if(!regExpName.test(name))
	{
		alert("이름 형식이 올바르지 않습니다");
		return;
	}
	
	if(birth=="")
	{
		alert("생일을 입력해주세요");
		return;
	}
	
	if(!regExpEmail.test(email))
	{
		alert("Email을 입력해주세요");
		return;
	}
	
	if(!regExpPhone.test(phone))
	{
		alert("연락처 입력을 확인해 주세요");
		return;
	}
	
	if(detailaddress.trim()=="" ||post=="")
	{
		alert("주소를 입력해주세요");
		return;
	}
	
	form.submit(); 
}


function checkUpdateMember(){
	var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
	var form= document.updateMember;
	var phone = form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
	var post= form.post_address.value;
	var detailaddress= form.detail_address.value;
	
	if(!regExpPhone.test(phone))
	{
		alert("연락처 입력을 확인해 주세요");
		return;
	}
	
	if(detailaddress.trim()=="" || !post)
	{
		alert("주소를 입력해주세요");
		return;
	}
	form.submit(); 	
}


function CheckDeleteMember() {
	
	if(confirm("삭제하시겠습니까?\nDo You Want to delete ID?"))
		{
			window.location.href="../members/deleteMember.jsp";
		}
	else
		{
			return;
		}
	
}
