<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top:90px; width:100%; height:100%; background-color: lightgray; padding-top: 30px; ">
<h2 style="text-align: center;">교과목 목록 조회/수정</h2>
	<form name="frm" method="post" action="action.jsp"
		style="display:flex; align-items:center; justify-content: center; text-align: center;">
			
		<table border="1">
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>삭제</td>
			</tr>
			
			<%
			request.setCharacterEncoding("UTF-8");
			Connection conn = null;
			PreparedStatement pstmt = null;
			String week = "";
			String start_hour = "";
			String end_hour = "";
			
			try{
				conn = OracleUtil.getConnection();			
				String sql = "SELECT ct.ID , ct.NAME cname, ct.CREDIT , lt.NAME lname, ct.WEEK , ct.START_HOUR , ct.END_HOUR "+
						"FROM COURSE_TBL ct , LECTURER_TBL lt "+
						"WHERE ct.LECTURER = lt.IDX "+
						"ORDER BY ct.ID ";
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					week = rs.getString(5);
					switch(week){
					case "1":
						week = "월요일";
						break;
					case "2":
						week = "화요일";
						break;
					case "3":
						week = "수요일";
						break;
					case "4":
						week = "목요일";
						break;
					case "5":
						week = "금요일";
						break;
					
					}
					start_hour = rs.getString(6);
					while(start_hour.length()<4){
						start_hour = "0"+start_hour;
					}
					String start = start_hour.substring(0,2)+"시"+start_hour.substring(2,4)+"분";
					
					end_hour = rs.getString(7);
					while(end_hour.length()<4){
						end_hour = "0"+end_hour;
					}
					String end = end_hour.substring(0,2)+"시"+end_hour.substring(2,4)+"분";
					
				%>
				
				<tr>
				<td><a href="modify.jsp?id=<%= rs.getString(1) %>" style="text-decoration: none"><%= rs.getString(1) %></a></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= week %></td>
				<td><%= start %></td>
				<td><%= end %></td>
				<td><a href="action.jsp?id=<%=rs.getString(1)%>&mode=delete">삭제</a></td>
				<tr>
				
				<%	
					
					
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
			%>
			
		
			
</table>
</form>

</section>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>