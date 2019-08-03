<%@page import="model.InfoMilk"%>
<%@page import="java.util.ArrayList"%>
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
   int temp=0;
boolean check=true;
   ArrayList<InfoMilk> arrayList = new ArrayList();

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
 while(resultSet.next()){
	
	 arrayList.add(new InfoMilk(resultSet.getString("Ten_sua"),resultSet.getString("Ten_loai"),
			 resultSet.getString("Ten_hang_sua"),resultSet.getString("Hinh"),resultSet.getString("Trong_luong"),
			 resultSet.getString("Don_gia")));
 }
 
%>
</head>
<body>
<table   border="1">
<tr>
<th colspan="5" style=" color: blue; font-size: 30px; font-family:Times new roman;">THÔNG TIN CÁC SẢN PHẨM</th>
</tr>
<%for(int i=temp;i<=arrayList.size();i=temp) {check = true; %>
     <tr >
     <%while(check) { %>
       <td>
       <a style="font-weight: bold;"><%=arrayList.get(temp).getTenSua() %></a><br><br>
       <a><%=arrayList.get(temp).getTrongLuong()+" gr - "+arrayList.get(temp).getDonGia()+" VNĐ"%></a><br>
       <a ><img src="images/<%=arrayList.get(temp).getHinh() %>"/></a>
       </td>
       <% temp++;if(temp%5==0){check=false;}} %>
     </tr>
     
<%} out.print(arrayList.get(35).getTenSua());%>


</table>


</body>
</html>