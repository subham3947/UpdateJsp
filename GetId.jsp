<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="database.*,java.sql.*" %>
<form action="update.jsp">
<select name="id">
<option>---Select ID---</option>
<%
try{
	Connection cn=DataConnect.getConnection();
	String sql="select eid from emp";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<option><%=rs.getString(1) %></option>
<%} %>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</select>
<input type="submit" value="OK">
</form>
</body>
</html>