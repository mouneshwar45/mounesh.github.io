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

import dao.Dao;
import mail.PasswordMail;
import model.Model;

/**
 * Servlet implementation class ForgotServlet
 */
public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotServlet() {
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
		String email=request.getParameter("emailid");
		String page="";
		String sql="select * from register where emailid='"+email+"'";
		if(email.equals(""))
		{
			page="/forgotpassword.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setEmailid(email);
			
			
			try {
				ResultSet rs;
				rs = Dao.validate(m,sql);
				if(rs.next())// correct emailid is coming
				{
				 
					String password="";

						password = rs.getString(9);
					
					HttpSession session=request.getSession();
					session.setAttribute("password", password);
					session.setAttribute("emailid", email);
					String data="12345678901234567890123456789012345678901234567890123456789012345678901234567890";
					String otp="";
					char ch[]=data.toCharArray();
					for(int i=0;i<4;i++)
					{
						int j=(int)((Math.random())*80);
						//.123*80
					otp=otp+ch[j];
					}
					session.setAttribute("otp", otp);
					PasswordMail pm=new PasswordMail();
					try {
						boolean status=pm.sendMail(email, otp);
						if(status)
						{
							page="/otp.jsp?msg=qwerty";
						}else
						{
							page="/forgotpassword.jsp?msg=asd";
						}
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				{
					page="/forgotpassword.jsp?msg=abc";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		getServletContext().getRequestDispatcher(page).forward(request,response);
	}

}
