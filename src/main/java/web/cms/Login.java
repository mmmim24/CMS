package web.cms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
   
        try {
        	
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sql_workbench", "root", "");
            
            
            //password is hashed before check 
//            pass = getSHA(pass);
            
            //check if both email and password is correct
            String query = "SELECT * FROM credentials WHERE username =? AND password =?";

            PreparedStatement ps = con.prepareStatement(query);
 
            //compared email and password
            ps.setString(1, email);
            ps.setString(2, pass);
            
            //create a session and keep the email into Email caiable
            HttpSession session=request.getSession();  
            session.setAttribute("Email",email);
           
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
            	//retrive the user's type who is trying to login
            	String t = rs.getString("type");
            	
            	if(t.equals("student")) {
            		//if any student try to login then 
            		request.getRequestDispatcher("student.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("teacher")) {
            		//if any teacher try to login then
            		request.getRequestDispatcher("teacher.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("admin")) {
            		//if admin try to login then
            		request.getRequestDispatcher("admin.jsp").forward(request,response);
            		
            	}
                
            }
            //if anyone enter wrong email or password
            else {
            	out.print("Email or password doesn't match");
            }
                  
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
	}

}
