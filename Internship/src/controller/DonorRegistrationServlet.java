package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;
import dao.Dao;
public class DonorRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DonorRegistrationServlet() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fn=request.getParameter("fname");
		String ln=request.getParameter("lname");
		String contact=request.getParameter("con");
		String add=request.getParameter("add");
		String gen=request.getParameter("gender");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String email=request.getParameter("emailid");
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		String dob=request.getParameter("dob");
		String bg=request.getParameter("bloodgroup");
		String pn=request.getParameter("pincode");
		String s=gen.startsWith("M")?"Mr. ":"Ms. ";
		String sql="insert into donorregistration values('"+fn+"','"+ln+"','"+contact+"','"+add+"','"+gen+"','"+state+"','"+city+"','"+email+"','"+pass+"','"+bg+"','"+dob+"','"+pn+"')";
		String page="";
		if(fn.equals("")||ln.equals("")||add.equals("")||city.equals("")||state.equals("")||email.equals("")||pass.equals("")||pass1.equals("")||dob.equals(""))
		{
			page="/donorregistration.jsp?msg=abc";
			
		}
		else if(pass.equals(pass1))
		{
			Model m=new Model();
			m.setFname(fn);
			m.setLname(ln);
			m.setContact(contact);
			m.setAdd(add);
			m.setGen(gen);
			m.setBg(bg);
			m.setCity(city);
			m.setState(state);
			m.setEmailid(email);
			m.setPass(pass);
			m.setDob(dob);
			m.setPn(pn);
			int i= Dao.insert(m, sql);
			if(i!=0)
			{
				page="/donorregistration.jsp?msg=qwerty";
			}
			else
			{
				page="/donorregistration.jsp?msg=ag";
			}
		}
		else
		{
			page="/donorregistration.jsp?msg=abcd";
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
	}

}
	


