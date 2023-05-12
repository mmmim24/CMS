<!-- /*  -->
<!-- This page is admin's home page. when the admin will login, then they will redirect this page. -->
<!--  which page will show admin to add course and assign course teache -->
<!--  */ -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Course</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<header>
<!-- <nav>
<h1>CMS</h1>
<section>
  <ul id = "nav">
        <li>admin</li>
   <li><img src="admin.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>     
    <li><a class = "btn btn-primary" href="adminhome.jsp">Add Courses</a> </li>
    <li><a class = "homeblack" href="added_course.jsp">Submitted Courses</a> </li>
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


<div class = "post_items_page" >
<div class = "form"  id = "content">
<form class = "post_items_form" action="addcourse" method="post">
     <input type="text" name="title" placeholder = "Enter Course Title"  required><br>
     <input type="text" name="code" placeholder = "Enter Course Code"  required><br>
     <select name="credit" id = "select_id"  required>
            <option>choose course credit </option >
            <option>1</option >
            <option>1.5</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            
        </select> <br/>
    <input type="text" name="name" placeholder = "Assign Teacher" required><br>
     <input type="text" name="email" placeholder = "Enter Course Teacher's Email " required><br>
     
     <input class="btn btn-warning" type="submit" value="add to course">
</form>
</div>
</div>
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
</body>
</html>