<!-- /* -->
<!-- This page is redirect after login a teacher. -->
<!-- It shows a teacher which courses are assigned by the admin -->
<!-- */ -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Teachers Home</title>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="student.css">

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

    

<% 
String email = (String)request.getSession(false).getAttribute("Email");
String name = "teacher";


try {
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
    		"jdbc:mysql://localhost:3306/sql_workbench", "root", "");
    
    String query = "SELECT * FROM admin_input WHERE email =?";

    PreparedStatement ps = con.prepareStatement(query);

   
    ps.setString(1, email);
   
    ResultSet rs = ps.executeQuery();
    %>

<div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="teacher.jsp">Teachers Dashboard</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fa fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>


        </div>

        <div class="row m-3">
            <div class="col-12">
                <h1>View all Courses</h1>
                <div class="accordion" id="accordionExample">
    <%
    while(rs.next()){
       	
      	 String title = rs.getString("title");
      	 String code = rs.getString("code");
      	 String credit = rs.getString("credit");
    	 name = rs.getString("name");
   %>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="fa fa-award p-2"></i>
                                <b><%=code %></b>
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <b><%=title %></b> course offers 
                               a <b><code><%=credit %></code></b> credit course.       <br>
                               
                               <form action="showStudents.jsp" method="post"><div class="card-footer d-grid">
                               <input type="hidden" name ="code" value=<%=code %> >
                               <input type="hidden" name ="name" value=<%=name %> >
                               <input class="btn btn-success" type="submit" name="Registered Students" value="Registered Students">
                               </div></form>
                               
                            </div>
                        </div>
                    </div>
   		     	 <% 
   
    }
    %>                 
                </div>
            </div>
        </div>
   
        <% 
          
} catch (Exception e2) {
    System.out.println(e2);
}


%>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=name %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Teacher profile overview tab. It also contains the options to logout or edit the profile.
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










