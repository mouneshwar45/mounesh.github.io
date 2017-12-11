package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;
import dao.Dao;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("emailid");
		String subject=request.getParameter("sub");
		String matter=request.getParameter("matter");
		String sql="insert into contact values('"+name+"','"+email+"','"+subject+"','"+matter+"')";
		String page="";
		
		if(name.equals("")||email.equals("")||subject.equals("")||matter.equals(""))
		{
			page="/contact.jsp?msg=abc";//url rewriting
			//response.getWriter().println("All Fields Are Mandatory");
		}
		else 
		{
			Model m=new Model();
			m.setName(name);
			m.setEmailid(email);
			m.setSubject(subject);
			m.setMatter(matter);
			int i= Dao.insert(m, sql);
			if(i!=0)
			{
				page="/contact.jsp?msg=qwerty";
			}
			else
			{
				page="/home.jsp?msg=ag";
			}
		}
		
		getServletContext().getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
