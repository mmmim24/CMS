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
    <title>Edit Profile</title>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- import external js cdn -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel = "stylesheet" href="alert/dist/sweetalert.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<!-- status attribute fetching from servlet which is hidden in frontend -->
<div><input type="hidden" id="status" value="<%=request.getAttribute("status")%>"></div>

	<div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-dark bg-primary fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Edit Profile</a>
                    <a class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                        aria-controls="offcanvasExample">
                        <i class="fas fa-user"></i>
                        Profile
                    </a>
                </div>
            </nav>
        </div>

<div class="panel panel-primary">
            <div class="panel-heading text-center">
                <h1>Change Password</h1>
            </div>
            <div class="panel-body">
                <h3 class="panel-heading text-center"><%=name %></h3>
                <br>
                <!-- INPUT FORM -->
                <form action="edit" method="post">
                    <label for="username">Old Password</label>
                    <input type="password" name="old" id="old" class="form-control" required>
                    <br>
                    <label for="password">New Password</label>
                    <input type="password" name="nnew" id="nnew" class="form-control" required>
                    <br>
                    <br>
                    <input type="submit" value="Update" class="btn btn-primary btn-block">
                </form>
                
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
    <!-- external javascript -->
    <script type="text/javascript">
			var status = document.getElementById("status").value;
			if(status=="failed"){
				swal("Incorrect old password","","error",{
						closeOnClickOutside: false,
						button: "Try Again",
						className : "red-bg"
					});
				/* swal("This modal will disappear soon!", {
					  buttons: false,
					  timer: 3000,
					}); */
		
			}	
    </script>
</body>

</html>





