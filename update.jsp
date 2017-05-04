<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="database.*,java.sql.*" %>
<form action="Update">
<%
try{
	String eid=request.getParameter("id");
	Connection cn=DataConnect.getConnection();
	String sql="select ename,eaddr from emp where eid=?";
	session=request.getSession();
	session.setAttribute("uid",eid);
	
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, eid);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>
<table border="3" align="center">
<tr><td>Enter New Name:</td><td><input type="text" name="ename" value=<%=rs.getString(1) %>></td></tr>
<tr><td>Enter New Address :</td><td><input type="text" name="eaddr" value=<%=rs.getString(2) %>></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Update"></td></tr>
</table>
<%} %>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</form>
</body>
</html>