<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
String name=(String)request.getSession(false).getAttribute("Email");  
%>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- import external js cdn -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel = "stylesheet" href="alert/dist/sweetalert.css">
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
                    <a href="index.html" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="editProfile.jsp" class="list-group-item list-group-item-action list-group-item-warning"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
    <!-- external javascript -->
    <script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status=="failed"){
    		swal("Sorry","Your password is incorrect :(","warning");
    	}
    </script>
</body>

</html>





