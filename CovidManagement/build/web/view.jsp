<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Cases</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    
<div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Cases Details</h2>
                </div>
            </div>
            <div class="col-sm-2">
                        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
                    </div>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Reg No</th>
      <th scope="col">Name</th>
      <th scope="col">Batch</th>
      <th scope="col">Address</th>
      <th scope="col">Covid Status</th>

    </tr>
  </thead>
  <tbody>
  <% 
  	    Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/furccovidstatus","root","");

  	String query = "Select * from status";
	 pst = con.prepareStatement(query);
	 rs = pst.executeQuery();
	
	while(rs.next()){
		%>
		<tr>
		<th scope="row"><%= rs.getString("regno") %></th>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("batch")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("covidstatus")%></td>
		
		<td><a class="btn btn-success" href="editCase.jsp?id=<%=rs.getString("regno") %>" role="button">Edit</a><a class="btn btn-danger" href="removeCase.jsp?id=<%=rs.getString("regno") %>" role="button">Remove</a></td>
		</tr>
	<% }%>	
	
  </tbody>
</table>

</body>
</html>