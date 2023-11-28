<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<body>

<header style="position: fixed; top:0px; height: 60px; width:100%; text-align: center; line-height: 60px; 
			background-color: blue; color: white; font-size: 30px">수강신청 도우미 사이트</header>


<nav style="position: fixed; top: 60px; height: 30px; width: 100%; line-height: 30px;
			background-color: lightblue; color: white; ">
			<a href="<%= request.getContextPath() %>/subject/list.jsp" style="text-decoration: none; margin-left: 20px">교과목 목록 조회/수정</a>
			<a href="<%= request.getContextPath() %>/subject/insert.jsp" style="text-decoration: none; margin-left: 20px"">교과목 추가</a>
			<a href="<%= request.getContextPath() %>" style="text-decoration: none; margin-left: 40px"">홈으로.</a>
			
			
</nav>

</body>
</html>