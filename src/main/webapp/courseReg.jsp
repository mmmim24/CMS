<!-- /* -->
<!-- This page will register a course by stydent. -->
<!-- */ -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%
String user=(String)request.getSession(false).getAttribute("Email");  
//session name
if(user==null) request.getRequestDispatcher("index.jsp").forward(request,response);
try{
	Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sql_workbench", "root", "");
    String query = "SELECT  * FROM credentials where username=?";

    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1,user);
    
    ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		String t = rs.getString("type");
		if((t.equals("teacher")||t.equals("admin"))){
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
	}
}catch(Exception e){
	System.out.println(e);
}
%>
<%

String name = "Student";
String email = "mail";
String reg = "reg";
String ss = "session";
try {
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
   		 "jdbc:mysql://localhost:3306/sql_workbench", "root", "");
		email = (String)request.getSession(false).getAttribute("Email");
		String q = "select * from students where email=?";
		PreparedStatement ps = con.prepareStatement(q);
        ps.setString(1, email); 
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
       	 name = rs.getString("Name");
       	 reg = rs.getString("Reg_no");
       	 ss = rs.getString("session");
        }
} catch (Exception e2) {
    System.out.println(e2);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Registration</title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
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
        </div><br>
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

        <div class="row">
<h2 style="padding:80px 0px 20px 20px">Course Info</h2>

 <% String code = "code"; 
  
 try {
     Class.forName("com.mysql.jdbc.Driver");
     java.sql.Connection con = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/sql_workbench", "root", "");

    
     String query = "SELECT  * FROM admin_input";

     PreparedStatement ps = con.prepareStatement(query);

    
     /* ps.setString(1, code); */
    
    
    
     ResultSet rs = ps.executeQuery();
     %>
     <table class="table table-striped" >
  	
  		<thead>
  	
	<tr>
		<th scope="col">#</th>
  		<th scope="col">Title</th>
  		<th scope="col">Code</th>
  		<th scope="col">Credit</th>
  		<th scope="col">Teacher's Name</th>
  		<!-- <th scope="col">Teacher's Email</th> -->
  	</tr>	
  	</thead>
     <tbody>     
     <%
     int i = 0;
     while(rs.next()) {
     	String ti = rs.getString("title");
     	String co = rs.getString("code");
     	String nm = rs.getString("name");
     	/* String em = rs.getString("email"); */
     	String cr = rs.getString("credit");
     	
     	i++;
     	%>
        
    	
    	<tr>
    		<th scope="row"><%=i%> </th>
    		<td><%=ti%></td>
    		<td ><%=co%></td>
    		<td ><%=cr%></td>
           	<td ><%=nm%></td>
    		<%-- <td ><%=em%></td> --%>
    	</tr>	
     	
    	<tr>
    		
    	<th scope="row">	</th>
    	<td>
      	<form action="registered.jsp " method = "post">
      	<!-- hidden input to send the course code later fetched in registered.jsp to store in database -->
     	<input type = "hidden" name = "code" value = <%=co%>>
     	<input class="btn btn-warning" type = "submit" name ="register" value = "Register">
     	</form>
     	</td>
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

 out.close();
 %>
 </div>

        
    </div>
	
</body>
</html>