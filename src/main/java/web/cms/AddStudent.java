/*This is a java servlet class for adding students
by admin in the database*/
package web.cms;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.lang.Exception;
import java.lang.String;


/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/addstudent")
public class AddStudent extends HttpServlet {
	
	//hashing method for credentials
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
    public AddStudent() {
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
 
        //getting data from input fields
        String nm = request.getParameter("name");
        String re = request.getParameter("reg");
        String dp = request.getParameter("dept");
        String se = request.getParameter("session");
        String em = request.getParameter("email");
        String pa = request.getParameter("password");
        //database url and redirect url stored in variables
        String red = "addstudent.jsp";
        String database = "jdbc:mysql://localhost:3306/sql_workbench";
        //this flag variable will prevent inserting duplicate values
        boolean flag = true;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, "root", "");
            PreparedStatement chk = con.prepareStatement("select * from students where dept=?");
            chk.setString(1, dp);
            ResultSet chkrs = chk.executeQuery();
            while(chkrs.next()) {
            	String creg = chkrs.getString("Reg_no");
            	if(re.equals(creg)) {
            		flag = false;
        			break;
            	}
            }
            if(flag) {
            PreparedStatement ps = con.prepareStatement("insert into students values(?,?,?,?,?,?)");
            //the password is hashed before inserted into table
            pa = getSHA(pa);
            ps.setString(1, re);
            ps.setString(2, nm);
            ps.setString(3, em);
            ps.setString(4, dp);
            ps.setString(5, se);
            ps.setString(6, pa);
 
            int i = ps.executeUpdate();
            if (i > 0) {
            	TimeUnit.SECONDS.sleep(1);
            	request.getRequestDispatcher(red).forward(request,response);
            }
            else
                out.print("submit failed...");
            }
            else request.getRequestDispatcher(red).forward(request,response);
            
        } catch (Exception e2) {
            System.out.println(e2);
        }
        
        
        //inserting data into credentials table
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, "root", "");
            String ty = "student";
            
            if(flag) {
            PreparedStatement ps = con.prepareStatement("insert into credentials values(?,?,?)");
            //fetched values will be inserted in this order
            ps.setString(1, em);
            ps.setString(2, pa);
            ps.setString(3, ty);
 
            int i = ps.executeUpdate();
            if (i > 0)
            	request.getRequestDispatcher(red).forward(request,response);
            else
            	out.print("registration failed!");
            }
            else request.getRequestDispatcher(red).forward(request,response);
        }//exception handling
        catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
		}
	}


