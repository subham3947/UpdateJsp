<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display FoodItem</title>
</head>
<body>
<form action="Price.jsp">
<table border="3" align="center">
<tr><th colspan="4">Select Item</th></tr>
<tr><th>Sl No.</th><th>Name</th><th>Price</th><th>Select</th></tr>
<%@page import="database.*,java.sql.*" %>
<%
try{
	Connection cn=DataConnect.getConnection();
	String sql="select * from hotel";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><input type="checkbox" name="ch" value=<%=rs.getString(1) %>></td>
</tr>
<%} %>
<%}catch(Exception e){
	e.printStackTrace();
} %>
<tr><td colspan="4" align="center"><input type="submit" value="OK"></td></tr>
</table>
</form>
</body>
</html>