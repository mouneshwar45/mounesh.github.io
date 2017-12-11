package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

public class UpdatebloodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdatebloodServlet() {
        super();
     }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bldgrp=request.getParameter("bldgrp");
		int price=Integer.parseInt(request.getParameter("price"));
		int unitsOfblood=Integer.parseInt(request.getParameter("unitsOfBlood"));
	
		String page="";	
		String sql="update blood set bgquantity=bgquantity+'"+unitsOfblood+"',availability='yes',bprice='"+price+"' where bgname='"+bldgrp+"'";
		
			Model m=new Model();
			m.setBgname(bldgrp);
			m.setBprice(price);
			m.setBgquantity(unitsOfblood);
		
		int i=Dao.update(m,sql);
		if(i!=0)
		{
			page="/updateblood.jsp?msg=qwerty";
		}
		else
		{
			page="/updateblood.jsp?msg=asd";
		}
		getServletContext().getRequestDispatcher(page).forward(request, response);
				

		}
}