package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;
import dao.Dao;

public class DeleteBloodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteBloodServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bldgrp=request.getParameter("bldgrp");
		int unitsOfblood=Integer.parseInt(request.getParameter("unitsOfBlood"));
		String page="";
		String q1="select bgquantity from blood where bgname='"+bldgrp+"'";
		
				Model m=new Model();
				
				m.setBgname(bldgrp);
				try
				{
					ResultSet rs1=Dao.validate(m, q1);
			//		System.out.println(" try\n");
					if(rs1.next())
					{
							int i1=rs1.getInt(1);
							
							if(i1==unitsOfblood)
							{
								m.setBgquantity(unitsOfblood);
								m.setBgname(bldgrp);
								String sql2="update blood set bgquantity=0,availability='no' where bgname='"+bldgrp+"'";
								
								int i=Dao.update(m,sql2);
								if(i!=0)
								{
									page="/DeleteBlood.jsp?msg=qwertyy";
								}
								else
								{
									page="/DeleteBlood.jsp?msg=unavail";
								}
							}
							else if((i1-unitsOfblood)<0)
							{
								page="/DeleteBlood.jsp?msg=cant";
							}
							else
							{
								String sql="update blood set bgquantity= bgquantity-'"+unitsOfblood+"' where bgname='"+bldgrp+"'";
									
									m.setBgname(bldgrp);
							//		m.setPrice(price);
									m.setBgquantity(unitsOfblood);
								
								int i=Dao.update(m,sql);
								
//	System.out.println("I updated\n");
								
								if(i!=0)
								{
									page="/DeleteBlood.jsp?msg=qwerty";
								}
								else
								{
									page="/DeleteBlood.jsp?msg=asd";
								}
							}
							
							
							
							
					}
					else
					{
						page="/DeleteBlood.jsp?msg=not";
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
							
				getServletContext().getRequestDispatcher(page).forward(request, response);
	}
}
					
