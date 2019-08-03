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
<title>Thông tin hãng sữa</title>
<link rel="stylesheet" type="text/css" href="css/style_thong_tin_hang_sua.css">
<%!
   Connection connection; Statement statement; ResultSet resultSet;
   String sql ="select * from hang_sua";
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
<caption style=" color: blue; font-size: 30px; font-family: POSTOFFICE;">THÔNG TIN HÃNG SỮA</caption>
<tr><th> Mã HS</th><th> Tên HS</th><th> Địa Chỉ</th><th>Điện Thoại</th><th>Email</th></tr>
<%while(resultSet.next()){ %>
     <tr >
      <td ><%=resultSet.getString("Ma_hang_sua") %></td> 
      <td ><%=resultSet.getString("Ten_hang_sua") %></td> 
      <td ><%=resultSet.getString("Dia_chi") %></td>
      <td ><%=resultSet.getString("Dien_thoai") %></td>
      <td ><%=resultSet.getString("Email") %></td>
     </tr>
<%} %>


</table>


</body>
</html>