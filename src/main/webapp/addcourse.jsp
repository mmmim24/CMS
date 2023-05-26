 <!-- //This is the course register page for admin -->
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
<html>
<head>
<meta charset="UTF-8">
<title>Add Course</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	

	<link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
<%
String nm = "";
//sql query for all teachers available
try {
   Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection con = DriverManager.getConnection(
           "jdbc:mysql://localhost:3306/sql_workbench", "root", "");

  
   String query = "SELECT  * FROM teachers";

   PreparedStatement ps = con.prepareStatement(query);
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<!-- header section -->
<header>
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
        <!-- profile section -->
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
</header>
<div class = "card text-bg-primary shadow-lg" >
<div class = "card-header"><h1>Add a new course</h1></div>
<div class= "card-body">
<form  action="addcourse" method="post">
     <div class="mb-3"><input type="text" class="form-control" name="title" placeholder = "Enter Course Title"  required>
     </div>
     <div class="mb-3"><input type="text" class="form-control" name="code" placeholder = "Enter Course Code"  required>
     </div>
     <div class="mb-3">
     <select class= "form-select" aria-label="Choose course credits" name="credit" id = "select_id"  required>
            <option selected>choose course credit </option >
            <option>1</option >
            <option>1.5</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            
        </select>
     </div>

    <div class="mb-3">
    <select class= "form-select" aria-label="Assign Teacher" name="name" id = "select_id"  required>
            <option selected>Assign Teacher</option >
            <%
   ResultSet rs = ps.executeQuery();
         while(rs.next()) {
     	nm = rs.getString("Name");
     %>
            <option><%=nm %></option >
            <%
            }
     
     
 
 
     %>
        </select>
    </div>
    <div class="card-footer d-grid"><input class="btn btn-warning" type="submit" value="Add this Course"></div>
</form>
</div>
</div>


  <%} catch (Exception e2) {
	     System.out.println(e2);
  }

  out.close(); %>
</body>
</html>