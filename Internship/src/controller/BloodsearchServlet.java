package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;
import dao.Dao;

/**
 * Servlet implementation class BloodsearchServlet
 */
public class BloodsearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodsearchServlet() {
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
		String bg=request.getParameter("bgsearch");
		String sql="select * from blood where bgname='"+bg+"'";
		String page="";
		HttpSession session=request.getSession();
		if(bg.equals(""))
		{
			page="/bloodsearch.jsp?msg=abcd";
		}
		else
		{
			Model m=new Model();
			m.setBgname(bg);
			ResultSet rs=Dao.search(m,sql);
		try {
			if(rs.next())
			{
				session.setAttribute("bgname", bg);
				session.setAttribute("bprice", rs.getString(3));
				session.setAttribute("search", true);
				page="/result.jsp?msg=qwerty";
			}
			else
			{
				page="/bloodsearch.jsp?msg=abc";
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
	}
}
