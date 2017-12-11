package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Model;

public class Dao {
	public static Connection con=null;
	static
	{
		try
		{
			//Class.forName("com.ibm.db2.jcc.DB2Driver");
			Class.forName("com.mysql.jdbc.Driver");
			//con=DriverManager.getConnection("jdbc:db2://localhost:50000/mydata","STUDENT","MOUNI!43");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/internship","root","root");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int insert(Model m, String sql){
		int i=0;
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);
			i=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	public static ResultSet validate(Model m, String sql) {
		ResultSet rs=null;
		try
		{
		PreparedStatement ps=con.prepareStatement(sql);
		 rs=ps.executeQuery();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return rs;
	
	}
	public static ResultSet search(Model m, String sql) {
		ResultSet rs=null;
		try
		{
		PreparedStatement ps=con.prepareStatement(sql);
		 rs=ps.executeQuery();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return rs;
	
	}
	public static int checkEmail(Model m, String sql) {
		int i=0;
		try
		{
		PreparedStatement ps=con.prepareStatement(sql);
		 i=ps.executeUpdate();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return i;
	
	}
	public static int update(Model m, String sql) {
		int i=0;
		try
		{
		PreparedStatement ps=con.prepareStatement(sql);
		 i=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return i;
	}
}
