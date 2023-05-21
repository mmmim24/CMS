/*This is a java servlet class for 
change password by the users */
package web.cms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.lang.String;



/**
 * Servlet implementation class Login
 */
@WebServlet("/edit")
public class EditProfile extends HttpServlet {
	
	public static String getSHA(String input) {

		try {

			// Static getInstance method is called with hashing SHA
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			// digest() method called
			// to calculate message digest of an input
			// and return array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);

			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}

			return hashtext;
		}

		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			System.out.println("Exception thrown" + " for incorrect algorithm: " + e);

			return null;
		}
	}
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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
        
        //old password and new password fetched from input and username fetched from session
        String user = (String)request.getSession(false).getAttribute("Email");
        String old = request.getParameter("old");
        String neww= request.getParameter("nnew");
        try {
        	
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sql_workbench", "root", "");
            
            
            //password is hashed before check
            neww = getSHA(neww);
            old = getSHA(old);
            //check if both email and password is correct
            String query = "SELECT * FROM credentials WHERE username =? AND password =?";

            PreparedStatement ps = con.prepareStatement(query);
 
            //compared email and password
            ps.setString(1, user);
            ps.setString(2, old);
            
           
            ResultSet rs = ps.executeQuery();
            // after password matched with session user it is replaced by the new one
            if(rs.next()) {
            	
					  PreparedStatement ns = con.prepareStatement("update credentials set password = ? where username = ?;");
					  ns.setString(1, neww);
			          ns.setString(2, user);
					  ns.executeUpdate();
					 
            		request.getRequestDispatcher("admin.jsp").forward(request,response);
            }
            //if anyone enter wrong email or password
            else {
            	out.print("user or password doesn't match");
            }
                  
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
	}

}
