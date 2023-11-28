<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top:90px; width:100%; height:100%; background-color: lightgray; padding-top: 30px; ">
<h2 style="text-align: center;">교과목 수정</h2>
	<form name="frm" method="post" action="action.jsp"
		style="display:flex; align-items:center; justify-content: center; text-align: center;">
			<include type="hidden" name="mode" value="modify"></include>
		<table border="1">
		
		<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement pstmt = null;	
		String id = request.getParameter("id");
		
		try{
			conn = OracleUtil.getConnection();
			String sql = "SELECT * FROM course_tbl WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String lecturer = rs.getString(4);
			String week = rs.getString(5);
			String start_hour = rs.getString(6);
			while(start_hour.length()<4){
				start_hour = "0"+start_hour;
			}
			String end_hour = rs.getString(7);
			while(end_hour.length()<4){
				end_hour = "0"+end_hour;
			}
			
		%>
		
			<tr>
				<td>과목코드</td>
				<td><input type="text" name="id" style="width: 100%" value="<%= id %>"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" style="width: 100%" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" style="width: 100%" value="<%=rs.getString(3) %>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td><select name="lecturer" style="width: 100%" >
					<option value="">담당강사선택</option>
					<option value="1" <% if(lecturer.equals("1")) out.println("selected"); %>>김교수</option>
					<option value="2" <% if(lecturer.equals("2")) out.println("selected"); %>>이교수</option>
					<option value="3" <% if(lecturer.equals("3")) out.println("selected"); %>>박교수</option>
					<option value="4" <% if(lecturer.equals("4")) out.println("selected"); %>>우교수</option>
					<option value="5" <% if(lecturer.equals("5")) out.println("selected"); %>>최교수</option>
					<option value="6" <% if(lecturer.equals("6")) out.println("selected"); %>>임교수</option>
				
				</select></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
				<input type="radio" name="week" value="1" <% if(week.equals("1")) out.println("checked"); %>> 월
				<input type="radio" name="week" value="2" <% if(week.equals("2")) out.println("checked"); %>> 화
				<input type="radio" name="week" value="3" <% if(week.equals("3")) out.println("checked"); %>> 수
				<input type="radio" name="week" value="4" <% if(week.equals("4")) out.println("checked"); %>> 목
				<input type="radio" name="week" value="5" <% if(week.equals("5")) out.println("checked"); %>> 금
				</td>
			</tr>
			<tr>
				<td>시작 시간</td>
				<td><input type="text" name="start_hour" style="width: 100%" value="<%=start_hour %>"></td>
			</tr>
			<tr>
				<td>종료 시간</td>
				<td><input type="text" name="end_hour" style="width: 100%" value="<%=end_hour %>"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="수정" style="margin-right: 20px" onclick="return modify()">
				<input type="button" value="취소" onclick="return res()"></td>
			</tr>
			
		<%	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		%>






		</table>

	</form>


</section>

<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>