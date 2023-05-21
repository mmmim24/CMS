<!-- /* -->
<!-- This page is redirect after a student's login. -->
<!-- It will show a student which courses are offered by the admin -->
<!-- */ -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<% %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Student Home</title>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel="stylesheet" href="css/student.css">
    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-dark bg-primary fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="student.jsp">Student Dashboard</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fas fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>
        </div><br><br>

<%
                    
String email = (String)request.getSession(false).getAttribute("Email");
String name ="student";

     try {
         Class.forName("com.mysql.jdbc.Driver");
         java.sql.Connection con = DriverManager.getConnection(
        		 "jdbc:mysql://localhost:3306/sql_workbench", "root", "");

        
         String query = "select * from course_reg where email=?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, email); 
         ResultSet rs = ps.executeQuery();
         %>
         

<!-- View all courses -->
            <div id="view-courses" class="col-12">
                <h1 id="view-courses-header" class="text-bg-secondary p-1">View all Registered Courses</h1>
                <table class="table table-hover table-primary">
                    <thead>
                        <tr>
                            <th scope="col">Course Title</th>
                            <th scope="col">Course Code</th>
                            <th scope="col">Credits</th>
                        </tr>
                    </thead>
                    
                    <tbody class="table-group-divider">
                    <%while(rs.next()){
        	
        	 String title = rs.getString("title");
        	 String code = rs.getString("code");
        	 String credit = rs.getString("credit");
        	 name = rs.getString("name");
        	 %>
                    
                        <tr>
                            <th scope="row"><%=title %></th>
                            <td><%=code %></td>
                            <td><%=credit %></td>
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

 %>
            </div>

        <!-- Register for a course -->
        <div class="row">
            <div class="col-12">
                <div class="card text-bg-dark" >
                    <img id="overlay-img" src="img/nick-morrison-FHnnjk1Yj7Y-unsplash.jpg" class="card-img" alt="...">
                    <a href="courseReg.jsp">
                    <div class="card-img-overlay">
                        <h1 class="card-title">Register for a Course</h1>
					</div>
					</a>
                </div>
            </div>

            


            <div class="row">

            </div>

        </div>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=name%></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Student profile overview tab. It also contains the options to logout or edit the profile.
                </div>
                <div class="list-group mt-4">
                    <a href="index.html" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="editProfile.jsp" class="list-group-item list-group-item-action list-group-item-warning"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

