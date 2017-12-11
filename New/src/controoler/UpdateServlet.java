package controoler;

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
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String contact=request.getParameter("contact");
		String address=request.getParameter("add");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String dob=request.getParameter("dob");
		String page="";
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String sql="update register set(fname,lname,contact,address,country,state,dob)=('"+fname+"','"+lname+"','"+contact+"','"+address+"','"+country+"','"+state+"','"+dob+"') where emailid='"+email+"' ";
		Model m=new Model();
		m.setFname(fname);
		m.setLname(lname);
		m.setContact(contact);
		m.setAdd(address);
		m.setCountry(country);
		m.setState(state);
		m.setDob(dob);
		m.setEmailid(email);
		try {
			int i=Dao.update1(m,sql);
			if(i!=0)
			{
				page="/view.jsp?msg=qwerty";
			}
			else
			{
				page="/update1.jsp?msg=abc";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletContext().getRequestDispatcher(page).forward(request,response);
	}

}
