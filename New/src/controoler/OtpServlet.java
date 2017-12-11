package controoler;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.PasswordMail;

/**
 * Servlet implementation class OtpServlet
 */
public class OtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpServlet() {
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
	String otp1=session.getAttribute("otp").toString();
	String email=session.getAttribute("emailid").toString();
	String page="";
	if(otp.equals(""))
	{
		page="/opt.jsp?msg=abc";
	}
	else if(otp.equals(otp1))
	{
		String password=session.getAttribute("password").toString();
		PasswordMail pm=new PasswordMail();
		try {
			
			boolean status=pm.sendMail1(email,password);
			if(status)
			{
				page="/login.jsp?msg=qwerty";
			}else
			{
				page="/forgotpassword.jsp?msg=abc";
			}
			
		} catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	getServletContext().getRequestDispatcher(page).forward(request, response);
	}

}
