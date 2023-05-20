<!-- /* -->
<!-- This page will register a course bu stydent. -->
<!-- */ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%
String ti = "";
String co = request.getParameter("code");
String cr = "";
String nm = "";
String em = (String)request.getSession(false).getAttribute("Email");
String reg = "";
String ss = "";
String msg="";

try {
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/sql_workbench", "root", "");
	
    String q1 = "select * from students where email=?";
    PreparedStatement as = con.prepareStatement(q1);
    as.setString(1,em);
    ResultSet rs = as.executeQuery();
    while(rs.next()){
      	 nm = rs.getString("Name");
      	 reg = rs.getString("Reg_no");
      	 ss = rs.getString("session");
       }
    
    String q2 = "SELECT  * FROM admin_input where code =?";
	PreparedStatement qs = con.prepareStatement(q2);
	qs.setString(1,co);
    ResultSet ds = qs.executeQuery();
    while(ds.next()){
      	 ti = ds.getString("title");
      	 co = ds.getString("code");
      	 cr = ds.getString("credit");
       }
    
    String chk = "select * from course_reg where email=?";
    boolean flag = true;
    PreparedStatement pat = con.prepareStatement(chk);
    pat.setString(1,em);
    ResultSet mat = pat.executeQuery();
    while(mat.next()){
    	String ccode = mat.getString("code");
    	if(co.equals(ccode)){
    		flag = false;
			break;    		
    	}
    }
    
    if(flag){
    String query = "insert into course_reg values(?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, ti);
    ps.setString(2, co);
    ps.setString(3, cr);
    ps.setString(4, nm);
    ps.setString(5, em);
    ps.setString(6, reg);
    ps.setString(7, ss);   
    int i = ps.executeUpdate();
    if (i > 0)
    	msg = "Successful!";
    else
        msg = "Failed";
    }
    else msg = "Done Already!";
          
}catch (Exception e) {
    System.out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=co %></title>
<!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Import fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" type="text/css" href="style.css">
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
        </div><br><br>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=nm %>	</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    This is the Student profile overview tab. It also contains the options to logout or edit the profile.
                </div>
                <div class="list-group mt-4">
                    <a href="index.html" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-warning"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </div>
            </div>
        </div>
		<div class="row">
		<div class="card text-center">
  <div class="card-header"><%=ti %></div>
  <div class="card-body">
    <h3 class="card-title-success">Registration <%=msg %></h3>
    <p></p>
    <a href="courseReg.jsp" class="btn btn-warning">Back to course registration page</a>
  </div>
</div>
		</div>

        
    </div>
	
</body>
</html>