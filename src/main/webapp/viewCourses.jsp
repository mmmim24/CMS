<!-- /* -->
<!-- This page will show all courses registered by admin -->
<!-- */ -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Courses</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->
</head>
<body>
<header>
<!-- <nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
  <li>student</li>
   <li><img src="stu.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>
             <li><a class = "homeblack"href="studenthome.jsp">Home</a> </li>
    <li><a class = "homeblack" href="taken_courses.jsp">View Courses</a> </li>
     <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>
 -->
 <div class="row">
            <nav class="navbar navbar-dark bg-primary fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="admin.html">Course Management System</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fas fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>
        </div>
 
</header>
</section>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Ishtiaque Rahman</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" area-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Admin profile overview tab. It also contains the options to logout or edit the profile.
                </div>
                <div class="list-group mt-4">
                    <a href="index.html" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-warning"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </div>
            </div>
        </div>

 <% String code = request.getParameter("code"); 
  
 try {
     Class.forName("com.mysql.jdbc.Driver");
     java.sql.Connection con = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/sql_workbench", "root", "");

    
     String query = "SELECT  * FROM admin_input";

     PreparedStatement ps = con.prepareStatement(query);

    
    
    
     ResultSet rs = ps.executeQuery();
     %>
     <table align="center" style="width: 80%;line-height: 40px; background: rgba(0,0,0,0.3); margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;">
  	<tr>
  		<th style ="color : white;" colspan="10"><h2>Course Info</h2></th>
  	</tr>

  	<t><th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Title</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Code</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Credit</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Teacher's Name</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Teacher's Email</th>
  		
  	</t>
     
     <%
     while(rs.next()) {
     	String ti = rs.getString("title");
     	String co = rs.getString("code");
     	String nm = rs.getString("name");
     	String em = rs.getString("email");
     	String cr = rs.getString("credit");
     	
     	
     	%>
        
    	
     	
    	<tr>
    		<td style=" border: 1px solid black;color : white;" id="row" align="center"  id="row" align="center"><%=ti%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=co%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=cr%></td>
           <td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=nm%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=em%></td>
    		
    	<td style=" " id="row" align="center">	
      	<form action="take2 " method = "post">
     	<input type = "hidden" name = "code" value = <%=co%>>
     	<input type = "hidden" name = "title" value = <%=ti%>>
     	<input type = "hidden" name = "credit" value = <%=cr%>>
     	</form>
     	</td>
          </tr>	
    		
         	
         	
         	
       	 <% 
     	
         
     }
     %>
     </table>
     <% 
           
 } catch (Exception e2) {
     System.out.println(e2);
 }

 out.close();
 %>
 
 		
 
 
</body>
</html>