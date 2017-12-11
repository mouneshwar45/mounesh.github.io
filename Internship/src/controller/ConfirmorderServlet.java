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
import mail.PasswordMail;
import model.Model;

/**
 * Servlet implementation class ConfirmorderServlet
 */
public class ConfirmorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmorderServlet() {
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
		String  otp=request.getParameter("otp");
		HttpSession session=request.getSession();
		String otp1=session.getAttribute("otp1").toString();
		String email=session.getAttribute("emailid").toString();
		String bgq=session.getAttribute("bgquantity").toString();
		String bgname=session.getAttribute("bgname").toString();
		String contact=session.getAttribute("contact").toString();
		String name=session.getAttribute("name").toString();
		String address=session.getAttribute("address").toString();
		String price=session.getAttribute("price").toString();
		int pr=Integer.parseInt(price);
		int bgqt=Integer.parseInt(bgq);
		String date=session.getAttribute("date").toString();
		String sql="update blood set bgquantity=bgquantity-'"+bgqt+"' where bgname='"+bgname+"'";
		
		String sql1="insert into invoice values('"+name+"','"+contact+"','"+address+"','"+email+"','"+bgname+"','"+bgqt+"','"+date+"','"+pr+"')";
		String page="";
		if(otp.equals(""))
		{
			page="/confirmorder.jsp?msg=abc";
		}
		else if(otp.equals(otp1))
		{	
			
			Model m=new Model();
			m.setBgname(bgname);
			m.setBgquantity(bgqt);
			int i=Dao.update(m,sql);
			if(i!=0)
			{
			PasswordMail pm=new PasswordMail();
			try
			{
				String msg=",\nyour order is successfully placed and it will be delivered in 5 business days, thank you";
				boolean status=pm.sendMail1(email,msg);
				m.setName(name);
				m.setAdd(address);
				m.setContact(contact);
				m.setDate(date);
				m.setEmailid(email);
				int r=Dao.insert(m,sql1);
				if(status&&r!=0)
				{
					session.setAttribute("emailid", email);
					session.setAttribute("date",date);
					session.setAttribute("invoice",true);
					
					
						page="/review.jsp?msg=qwerty";
					
				}
				else
				{
					page="/order.jsp?msg=abcf";
				}
				
			}
			catch(Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			
		}
		else
		{
			page="/confirmorder.jsp?msg=abcd";
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
		}

	}


