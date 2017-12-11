package controller;

import java.io.IOException;
import java.util.Date;
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
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		String dist=request.getParameter("dist");
		String state=request.getParameter("state");
		String email=request.getParameter("emailid");
		String bgname=request.getParameter("bgname");
		int bquantity=Integer.parseInt(request.getParameter("bquantity"));
		String date=request.getParameter("day");
		HttpSession session=request.getSession();
		String sql2="select bprice from blood where bgname='"+bgname+"'";
		String sql="insert into buy values('"+fn+"','"+ln+"','"+contact+"','"+add+"','"+dist+"','"+state+"','"+email+"','"+bgname+"','"+bquantity+"','"+date+"')";
		String page="";
		if(fn.equals("")||ln.equals("")||add.equals("")||dist.equals("")||state.equals("")||email.equals(""))
		{
			page="/order.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setEmailid(email);
			m.setFname(fn);
			m.setLname(ln);
			m.setContact(contact);
			m.setAdd(add);
			m.setDist(dist);
			m.setBgquantity(bquantity);
			m.setState(state);
			m.setBgname(bgname);
			m.setDate(date);
			int s=0;
			int price=0;
			int total=0;
			try {
			s= Dao.checkEmail(m,sql);
			ResultSet rs=Dao.validate(m, sql2);
			if(rs.next())
			{
				price=rs.getInt("bprice");
				//System.out.print(price);
				//int pr=Integer.parseInt(price);
				total=price*bquantity;
				//System.out.print(total);
			}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(s!=0)// correct emailid is coming
			{
			
				//HttpSession session=request.getSession();
				session.setAttribute("price",total);
				session.setAttribute("emailid", email);
				session.setAttribute("bgquantity",bquantity);
				session.setAttribute("name",fn+" "+ln);
				session.setAttribute("contact",contact);
				session.setAttribute("address",add+","+dist+","+state);
				session.setAttribute("bgname",bgname);
				session.setAttribute("date",date);
				String data="12345678901234567890123456789012345678901234567890123456789012345678901234567890";
				String otp="";
				char ch[]=data.toCharArray();
				for(int i=0;i<4;i++)
				{
					int j=(int)((Math.random())*80);
					//.123*80
				otp=otp+ch[j];
				}
				session.setAttribute("otp1", otp);
				PasswordMail pm=new PasswordMail();
				try {
					boolean status=pm.sendMail(email, otp);
					if(status)
					{
						page="/confirmorder.jsp?msg=qwerty";
					}else
					{
						page="/order.jsp?msg=asd";
					}
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				page="/order.jsp?msg=abcd";
			}
		}
		getServletContext().getRequestDispatcher(page).forward(request,response);
	}

}
