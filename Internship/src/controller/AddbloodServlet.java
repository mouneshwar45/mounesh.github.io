package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;
import dao.Dao;
public class AddbloodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddbloodServlet() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bldgrp=request.getParameter("bldgrp");
		int price=Integer.parseInt(request.getParameter("price"));
		int unitsOfblood=Integer.parseInt(request.getParameter("unitsOfBlood"));
	
		String page="";
	    String sql="insert into blood values('"+bldgrp+"','"+unitsOfblood+"','"+price+"','yes')";
	
		Model m=new Model();
		m.setBgname(bldgrp);
		m.setBprice(price);
		m.setBgquantity(unitsOfblood);
		
		int i=Dao.insert(m, sql);
		if(i!=0)
		{
			page="/Addblood.jsp?msg=qwerty";
		}
		else
		{
			page="/Addblood.jsp?msg=asd";
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);

		}
}
	