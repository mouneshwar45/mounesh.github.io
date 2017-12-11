package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;
import dao.Dao;

/**
 * Servlet implementation class BloodreportServlet
 */
public class BloodreportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodreportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String date1=request.getParameter("bday1");
		//System.out.println(date1);
		String date2=request.getParameter("bday2");
		//System.out.println(date2);
		String sql="select * from buy where date between '"+date1+"' and '"+date2+"'";
		String page="";
		HttpSession session=request.getSession();
		if(date1.equals("")||date2.equals(""))
		{
			page="Bloodreport.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setDate1(date1);
			m.setDate2(date2);
			ResultSet rs=Dao.validate(m, sql);
		try {
			if(rs.next())
			{
				session.setAttribute("date1", date1);
				session.setAttribute("date2", date2);
				session.setAttribute("report", true);
				page="report.jsp?msg=qwerty";
			}
			else
			{
				page="Bloodreport.jsp?msg=abcd";
			}
			}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		//getServletContext().getRequestDispatcher(page).forward(request, response);
	//	
		response.sendRedirect(page);
	}
}