<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
             
          Connection con;     
          String regno = request.getParameter("id");
			
   	 Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/furccovidstatus","root","");
   	 String query = "delete from  status where regno = ?";
   	   	
   	 PreparedStatement pst = con.prepareStatement(query);
   	   				
   	 pst.setString(1, regno);
   	 pst.executeUpdate();
	
    %>   
    
    <script>  
      window.location.replace("viewCase.jsp");       
    </script>