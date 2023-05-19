<!-- /* -->
<!-- This page will show all courses registered to the teacher -->
<!-- */ -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Students</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href="style.css">
    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->
</head>
<body>

 <div class="row">
            <nav class="navbar navbar-dark bg-primary fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="teacher.jsp">Teachers dashboard</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fas fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>
        </div>
 
<%String name = request.getParameter("name");%>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=name %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" area-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Teacher profile overview tab. It also contains the options to logout or edit the profile.
                </div>
                <div class="list-group mt-4">
                    <a href="index.html" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-warning"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </div>
            </div>
        </div>

<h2 style="padding:80px 0px 20px 20px">Student Info</h2>

 <% String code = request.getParameter("code"); 
  
 try {
     Class.forName("com.mysql.jdbc.Driver");
     java.sql.Connection con = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/sql_workbench", "root", "");

    
     String query = "select * from students natural join course_reg where course_reg.code=?";

     PreparedStatement ps = con.prepareStatement(query);
     ps.setString(1, code);
    
    
    
     ResultSet rs = ps.executeQuery();
     %>
     <table class="table table-striped" >
  	
  		<thead>
  	
	<tr>
		<th scope="col">#</th>
  		<th scope="col">Registration</th>
  		<th scope="col">Name</th>
  		<th scope="col">Email</th>
  		<th scope="col">Department</th>
  		<th scope="col">Session</th>
  	</tr>	
  	</thead>
     <tbody>
     
     <%
     int i = 0;
     while(rs.next()) {
     	String nm = rs.getString("Name");
     	String em = rs.getString("Email");
     	String ss = rs.getString("session");
     	String reg = rs.getString("Reg_no");
     	String de = rs.getString("dept");
     	
     	i++;
     	%>
        
    	<tr>
    		<th scope="row"><%=i%> </th>
    		<td><%=reg%></td>
    		<td ><%=nm%></td>
    		<td ><%=em%></td>
           	<td ><%=de%></td>
    		<td ><%=ss%></td>
    	</tr>	
     	
    		
    		
         	
         	
         	
       	 <% 
     	
         
     }
     %>
     </tbody>
     </table>
     <% 
           
 } catch (Exception e2) {
     System.out.println(e2);
 }

 out.close();
 %>
 
 		
 
 
</body>
</html>