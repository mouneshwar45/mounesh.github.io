package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.PasswordMail;
import model.Model;
import dao.Dao;

/**
 * Servlet implementation class RequestServlet
 */
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
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
		String bgname=request.getParameter("bgname");
		String email=request.getParameter("emailid");
		String msg=request.getParameter("message");
		String sql="select * from donorregistration where bgname='"+bgname+"'";
		String page="";
		HttpSession session=request.getSession();
		if(email.equals("")||bgname.equals(""))
		{
			page="/request.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setEmailid(email);
			m.setBgname(bgname);
			ResultSet rs=Dao.validate(m,sql);
		try {
			if(rs.next())
			{
				PasswordMail pm=new PasswordMail();
				String msg2=" Your request is successfully made to the donor,  \n here is the details,\n";
				String msg1="\nName :"+rs.getString(1)+" "+rs.getString(2)+"\n"+"contact :"+rs.getString(3)+"\n"+"address :"+rs.getString(4)+"\n"+"state :"+rs.getString(6)+"\n"+"city :"+rs.getString(7)+"\n"+"blood group :"+rs.getString(10)+"\n";
				boolean status=pm.sendMail2(email,msg2+msg1);
				
				boolean status1=pm.sendMail5(rs.getString("emailid"),msg);
				String email1=rs.getString(8);
				if(status&&status1)
				{
					session.setAttribute("emailid", email1);
					session.setAttribute("view", true);
					page="/view.jsp?msg=qwerty";
				}
				else
				{
					page="/request.jsp?msg=abcd";
				}
			}
			else
			{
				page="/request.jsp?msg=ab";
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
			getServletContext().getRequestDispatcher(page).forward(request, response);
		}
			
		
		
	}


