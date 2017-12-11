package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminLoginServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String emailid=request.getParameter("emailid");
String password=request.getParameter("password");
String page="";
String sql="select * from admin where emailid='"+emailid+"'and password='"+password+"'";
HttpSession session=request.getSession();
session.setMaxInactiveInterval(10*60);
	Model m=new Model();
	m.setEmailid(emailid);
	m.setPass(password);
	try {
	ResultSet rs= Dao.validate(m,sql);
//System.out.println(rs);

	if(rs.next())
	{
		session.setAttribute("email", emailid);
		session.setAttribute("pass", password);
		session.setAttribute("Alogin", true);
		page="/AdminPage.jsp?msg=qwerty";
	}
	else
	{
		page="/AdminLogin.jsp?msg=abc";
	}
} catch (SQLException e) {
	e.printStackTrace();
}

getServletContext().getRequestDispatcher(page).forward(request, response);
		
	}

}
