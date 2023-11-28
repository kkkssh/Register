function addCheck(){
	
	if(frm.name.value.length == 0){
		alert("과목명을 입력하세요.");
		frm.name.focus();
		return false;
	}
	
	else if(frm.credit.value.length == 0){
		alert("학점을 입력하세요.");
		frm.credit.focus();
		return false;
	}
	
	else if(frm.lecturer.value == 0){
		alert("담당강사를 선택해주세요.");
		frm.lecturer.focus();
		return false;
	}
	
	else if(frm.week[0].checked==false && frm.week[1].checked==false && frm.week[2].checked==false && frm.week[3].checked==false && 
			frm.week[4].checked==false ){
		alert("요일을 선택하세요.");
		frm.week.focus();
		return false;
	}
	
	else if(frm.start_hour.value.length == 0){
		alert("시작시간을 입력하세요.");
		frm.start_hour.focus();
		return false;
	}
	
	else if(frm.end_hour.value.length == 0){
		alert("종료시간을 입력하세요.");
		frm.end_hour.focus();
		return false;
	}
	else{
		alert("교과목 추가를 완료했습니다!");
		document.frm.submit();
		return true;
		
	}
	

	
}


function search(){
	window.location = 'list.jsp';
}

function modify(){
	alert("교과목 수정을 완료했습니다!");
	document.frm.submit();
}

function res(){
	alert("교과목 수정이 취소되었습니다.");
	document.frm.reset();
}