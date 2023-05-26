/*This is a java servlet class for assigning courses 
by admin to the teachers which will be later taken by students*/ 
package web.cms;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class Admin
 */
@WebServlet("/addcourse")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at 999: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();
        
        //getting data from input fields
        String ti = request.getParameter("title");
        String co = request.getParameter("code");
        String cr = request.getParameter("credit");
        String na = request.getParameter("name");
        String em = request.getParameter("email");
        //database url and redirect url stored in variables
        String red = "addcourse.jsp";
        String database = "jdbc:mysql://localhost:3306/sql_workbench";
        //this flag variable will prevent inserting duplicate values 
        boolean flag = true;
 
        try {
        	//database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, "root", "");
            PreparedStatement chk = con.prepareStatement("select * from admin_input where name=?");
            chk.setString(1, na);
            ResultSet chkrs = chk.executeQuery();
            while(chkrs.next()) {
            	String ccode = chkrs.getString("code");
            	if(co.equals(ccode)) {
            		flag = false;
        			break;
            	}
            }
            
            //inserting data
            if(flag) {
            PreparedStatement ps = con.prepareStatement("insert into admin_input values(?,?,?,?)");
            
            //fetched values will be inserted in this order
            ps.setString(1, ti);
            ps.setString(2, co);
            ps.setString(3, cr);
            ps.setString(4, na);
            //ps.setString(5, em);
          

            int i = ps.executeUpdate();
            
            if (i > 0) {
            	//manually sleep time to give a transition effect of data storing :)
            	TimeUnit.SECONDS.sleep(1); 
            	request.getRequestDispatcher(red).forward(request,response);
            }
            else {
            	out.print("submit failed");
            	}
            }
            else request.getRequestDispatcher(red).forward(request,response);
            
            //exception handling
        } catch (Exception e2) {
            System.out.println(e2);
        }
       
 
        out.close();
		
	}

}
