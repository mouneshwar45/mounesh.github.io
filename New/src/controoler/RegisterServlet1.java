package controoler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class RegisterServlet1
 */
public class RegisterServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet1() {
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
		String fn=request.getParameter("fname");
		String ln=request.getParameter("lname");
		String contact=request.getParameter("con");
		String add=request.getParameter("add");
		String gen=request.getParameter("gender");
		String state=request.getParameter("country");
		String city=request.getParameter("state");
		String email=request.getParameter("emailid");
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		String dob=request.getParameter("dob");
		String s=gen.startsWith("M")?"Mr. ":"Ms. ";
		String sql="insert into register values('"+fn+"','"+ln+"','"+contact+"','"+add+"','"+gen+"','"+state+"','"+city+"','"+email+"','"+pass+"','"+dob+"')";
		String page="";
		if(fn.equals("")||ln.equals("")||contact.equals("")||add.equals("")||city.equals("")||state.equals("")||email.equals("")||pass.equals("")||pass1.equals("")||dob.equals(""))
		{
			page="/register.jsp?msg=abc";//url rewriting
			//response.getWriter().println("All Fields Are Mandatory");
		}
		else if(pass.equals(pass1))
		{
			Model m=new Model();
			m.setFname(fn);
			m.setLname(ln);
			m.setContact(contact);
			m.setAdd(add);
			m.setGen(gen);
			
			m.setCountry(state);
			m.setState(city);
			m.setEmailid(email);
			m.setPass(pass);
			m.setDob(dob);
			
			int i= Dao.insert(m, sql);
			if(i!=0)
			{
				page="/login.jsp?msg=qwerty";
			}
			else
			{
				page="/register.jsp?msg=ag";
			}
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
	}

}
