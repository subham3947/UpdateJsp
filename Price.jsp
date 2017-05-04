<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="database.*,java.sql.*" %>
<table border="3" align="center">
<tr><th>FoodName</th><th>Price</th></tr>
<%
try{
	Connection cn=DataConnect.getConnection();
	String sql="select fname,fprice from hotel where fid=?";
	String ch[]=request.getParameterValues("ch");
	int price=0;
	for(String s:ch){
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, s);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			price=price+(Integer.parseInt(rs.getString(2)));
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
</tr>
<%} %>
<%} %>
<tr><th>Total</th><td><%=price %></td></tr>
<%}catch(Exception e){
	e.printStackTrace();
} %>

</table>
</body>
</html>