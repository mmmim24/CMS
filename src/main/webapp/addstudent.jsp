<!-- //This is a registration page only for the student. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" type="text/css" href="style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add student</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel = "stylesheet" href="style.css">

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<section>
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
</header>
</section>
<%
String name=(String)request.getSession(false).getAttribute("Email");  
%>
<!-- Form -->
<div class = "card text-bg-primary shadow-lg" >
<div class = "card-header"><h1>Add a new student</h1>
        </div>
        <div class="card-body">


<form  action="addstudent" method="post">
 
       <div class="mb-3"><input class="form-control" type="text" name="name" placeholder = "Enter name" required/></div>
       <div class="mb-3"><input class="form-control" type="text" name="reg" placeholder = "Enter Registration no" required/></div>
       <div class="mb-3"><input class="form-control" type="text" name="dept" placeholder = "Enter Department" required/></div>
       <div class="mb-3"><input class="form-control" type="text" name="session" placeholder = "Enter Session" required/></div>
       <div class="mb-3"><input class="form-control" type="text" name="email"placeholder = "Enter Email" required/></div>
        <div class="mb-3"><input class="form-control" type="password" name="password"placeholder = "Enter password" required/></div>
        <div class="card-footer d-grid"><input class="btn btn-warning" type="submit" value="Register Student"/></div>
 
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
</body>
</html>