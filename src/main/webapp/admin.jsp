<!-- admin home page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>   
<%
String name=(String)request.getSession(false).getAttribute("Email");  
//session name
if(name==null) request.getRequestDispatcher("index.jsp").forward(request,response);
try{
	Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sql_workbench", "root", "");
    String query = "SELECT  * FROM credentials where username=?";

    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1,name);
    
    ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		String t = rs.getString("type");
		if((t.equals("student")||t.equals("teacher"))){
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
	}
}catch(Exception e){
	System.out.println(e);
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-dark bg-primary fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="admin.jsp">Admin Dashboard</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fas fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>
        </div>


        <div class="row gap-2 gap-md-0" id="panels">
            <div class="col-md-4">
                <div class="card">
                    <img id="card-img" src="img/nick-morrison-FHnnjk1Yj7Y-unsplash.jpg" class="card-img-top" alt="..."
                        loading="lazy">
                    <div class="card-body">
                        <h1 class="card-title">Courses</h1>
                        <p class="card-text">This is the courses section. You can add new courses and can also view existing courses.</p>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="addcourse.jsp" class="btn btn-primary">Add Courses</a>
                            <a href="viewCourses.jsp" class="btn btn-success">View all Courses</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img id="card-img" src="img/kobu-agency-7okkFhxrxNw-unsplash.jpg" class="card-img-top" alt="..."
                        loading="lazy">
                    <div class="card-body">
                        <h1 class="card-title">Teachers</h1>
                        <p class="card-text">This is the teachers section. You can assign new teachers and can also view all teachers.</p>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="addteacher.jsp" class="btn btn-primary">Add Teachers</a>
                            <a href="viewTeachers.jsp" class="btn btn-success">View all Teachers</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img id="card-img" src="img/the-climate-reality-project-Hb6uWq0i4MI-unsplash.jpg" class="card-img-top"
                        alt="..." loading="lazy">
                    <div class="card-body">
                        <h1 class="card-title">Students</h1>
                        <p class="card-text">This is the students section. You can add new students and can also view all enrolled students.</p>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="addstudent.jsp" class="btn btn-primary">Add Students</a>
                            <a href="viewStudents.jsp" class="btn btn-success">View all Students</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=name %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" area-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Admin profile overview tab. It also contains the options to logout or edit the profile.
                </div>
                <div class="list-group mt-4">
                <form action="logout" method="post">
                	<button class="btn btn-danger w-100" type="submit" value="Logout"><i class="fas fa-sign-out-alt"></i> Logout</button>
                </form>
                <br>
                <form>
                    <a href="editProfile.jsp" class="btn btn-warning w-100"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>