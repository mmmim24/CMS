<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Course Management System: Login page 

    there are 3 types of users admin, teachers, students. All have different login page
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- import bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                <h1>Course Management System</h1>
            </div>
            <div class="panel-body">
                <h2 class="panel-heading text-center">Sign in</h2>
                <br>
                <!-- INPUT FORM -->
                <form action="login" method="post">
                    <label for="username">Username:</label>
                    <input type="text" name="email" id="username" class="form-control" required>
                    <br>
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                    <br>
                    <br>
                    <input type="submit" value="Login" class="btn btn-primary btn-block">
                </form>
                
            </div>
        </div>
    </div>
    <!-- external javascript -->
    <script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status=="failed"){
    		swal("Sorry","Your username or password is incorrect :(","error",{
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





