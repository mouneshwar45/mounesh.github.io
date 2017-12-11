package controoler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid=request.getParameter("emailid");
		String subject=request.getParameter("subject");
		String message=request.getParameter("msg");
		String sql="insert into query values('"+emailid+"','"+subject+"','"+message+"')";
		String page="";
		if(emailid.equals("")||subject.equals("")||message.equals(""))
		{
			page="/contact.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setEmailid(emailid);
			m.setSubject(subject);
			m.setMessage(message);
			try {
				int i=Dao.sendMessage(m,sql);
				if(i!=0)
				{
					page="/contact.jsp?msg=qwerty";
				}
				else
				{
					page="/contact.jsp?msg=xyz";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
		}
		
		
	}


