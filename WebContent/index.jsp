<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position:fixed; top:90px; width:100%; height:100%; background-color: lightgray; padding-top: 30px; ">
<h2 style="text-align: center;">수강신청 관리 프로그램</h2>
<ol style="margin-top: 50px">
<li>총 10개의 교과목이 있습니다.</li>
<li>교과목 목록을 확인하려면 교과목 목록 조회/수정 메뉴를 클릭하세요.</li>
<li>교과목을 추가하려면 교과목 추가 메뉴를 클릭하세요.</li>
<li>교과목을 수정하려면 교과목 목록 메뉴에서 과목코드를 클릭하세요.</li>

</ol>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>