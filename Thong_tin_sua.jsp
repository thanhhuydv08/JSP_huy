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
<link rel="stylesheet" type="text/css" href="css/style_thong_tin_sua.css">
<%!
   Connection connection; Statement statement; ResultSet resultSet;
   String sql ="SELECT s.Ten_sua, l.Ten_loai, h.Ten_hang_sua, s.Trong_luong, s.Don_gia, s.Hinh "
		   +"from ((sua AS s INNER JOIN loai_sua AS l ON s.Ma_loai_sua = l.Ma_loai_sua) "
				   +"INNER JOIN hang_sua as h ON s.Ma_hang_sua= h.Ma_hang_sua);";
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
<tr>
<th colspan="2" style=" color: blue; font-size: 30px; font-family:Times new roman;">THÔNG TIN CÁC SẢN PHẨM</th>
</tr>
<%while(resultSet.next()){ %>
     <tr >
       <td ><img src="images/<%=resultSet.getString("Hinh") %>"/></td>
       <td>
       <a style="font-weight: bold;"><%=resultSet.getString("Ten_sua") %></a><br><br>
       <a>Nhà sản xuất : <%=resultSet.getString("Ten_hang_sua") %></a><br>
       <a><%=resultSet.getString("Ten_loai")+" - "+ resultSet.getString("Trong_luong")+" gr - "+resultSet.getString("Don_gia")+" VNĐ"%></a>
       </td>
     </tr>
<%} %>


</table>


</body>
</html>