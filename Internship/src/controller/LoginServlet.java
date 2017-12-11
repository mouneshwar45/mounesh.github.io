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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid=request.getParameter("emailid");
		String password=request.getParameter("password");
		String page="";
		String sql="select * from register where emailid='"+emailid+"' and pass='"+password+"'";
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(60);
			Model m=new Model();
			m.setEmailid(emailid);
			m.setPass(password);
		ResultSet rs=Dao.validate(m,sql);
		try {
			if(rs.next())
			{
				session.setAttribute("email", emailid);
				session.setAttribute("pass", password);
				session.setAttribute("login", true);
				page="/profile.jsp?msg=qwerty";
			}
			else
			{
				page="/login.jsp?msg=abc";
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			getServletContext().getRequestDispatcher(page).forward(request, response);
		}
	}


