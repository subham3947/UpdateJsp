import database.*;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			PrintWriter out=response.getWriter();
			String ename=request.getParameter("ename");
			String eaddr=request.getParameter("eaddr");
			HttpSession s=request.getSession(false);
			String eid=(String)s.getAttribute("uid");
			String sql="update emp set ename=?,eaddr=? where eid=?";
			Connection cn=DataConnect.getConnection();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, ename);
			ps.setString(2, eaddr);
			ps.setString(3, eid);
			ps.execute();
			out.println("record updated..");
			RequestDispatcher rd=request.getRequestDispatcher("GetId.jsp");
			rd.include(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
