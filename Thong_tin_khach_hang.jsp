<%@page import="readDataBase.GetConnectionDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin khách hàng</title>
<link rel="stylesheet" type="text/css" href="css/style_thong_tin_hang_sua.css">
<%!
   Connection connection; Statement statement; ResultSet resultSet;
   String sql ="select * from khach_hang";
   String databaseName="qlbansua";
%>
<%
 GetConnectionDatabase connectionDatabase = GetConnectionDatabase.SigletonConnection();
 connection = connectionDatabase.GetConnection(databaseName);
 statement = connection.createStatement();
 resultSet = statement.executeQuery(sql);
%>
</head>
<body>
<table   border="1">
<caption style=" color: blue; font-size: 30px; font-family: POSTOFFICE;">THÔNG TIN KHÁCH HÀNG</caption>
<tr><th> Mã KH</th><th> Tên KH</th><th> Giới Tính</th><th>Địa chỉ</th><th>Điện thoại</th><th>Email</th></tr>
<%while(resultSet.next()){ %>
     <tr >
      <td ><%=resultSet.getString("Ma_khach_hang") %></td> 
      <td ><%=resultSet.getString("Ten_khach_hang") %></td> 
      <td ><img src="images/<%=resultSet.getBoolean("phai")?"nu.jpg":"nam.jpg" %>"/></td>
      <td ><%=resultSet.getString("Dia_chi") %></td>
      <td ><%=resultSet.getString("Dien_thoai") %></td>
      <td ><%=resultSet.getString("Email") %></td>
     </tr>
<%} %>


</table>


</body>
</html>