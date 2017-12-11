package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class ChangepasswordServlet
 */
public class ChangepasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangepasswordServlet() {
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
		String pass=request.getParameter("pass1");
		String pass1=request.getParameter("pass2");
		String pass2=request.getParameter("pass3");
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String oldpassword=session.getAttribute("pass").toString();
		String page="";
		String sql="update register set pass='"+pass1+"' where emailid='"+email+"'";
		if(pass1.equals("")||pass2.equals("")||pass.equals(""))
		{
			page="/changepassword.jsp?msg=abc";
		}
		else if(pass.equals(oldpassword))
		{
			if(pass1.equals(pass2))
			{
			Model m=new Model();
			m.setPass(pass1);
			m.setEmailid(email);
			int i=Dao.insert(m,sql);
			if(i!=0)
			{
				session.setAttribute("login", false);
				page="/login.jsp?msg=qwertyz";
			}
			else
			{
				page="/changepassword.jsp?msg=xyz";
			}
			}
			else
			{
				page="/changepassword.jsp?msg=abcd";
			}
			
		}
		else
		{
			page="/changepassword.jsp?msg=abcde";
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
		}
	}


