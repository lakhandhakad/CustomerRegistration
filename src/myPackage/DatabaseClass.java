package myPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.mysql.fabric.Response;
import com.mysql.jdbc.Statement;


public class DatabaseClass {
	private Connection conn;

	public DatabaseClass() throws ClassNotFoundException, SQLException {
		establishConnection();
	}

	private void establishConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspassign", "root", "root");

	}

	

	
	



	public void addNewUser(String fName, String lName, String uName, String pass, String contact,
			String city, String address,String state,String zip) {
		try {
			String sql = "INSERT into Party(firstname,lastname,address,city,zip,state,phone)"
					+ "Values(?,?,?,?,?,?,?)";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, fName);
			pstm.setString(2, lName);
			pstm.setString(3, address);
			pstm.setString(4, city);
			pstm.setString(5, zip);
			pstm.setString(6, state);
			pstm.setString(7, contact);
			pstm.executeUpdate();
			String read="select partyId from Party where firstname='"+fName+"'";
			Statement st=(Statement) conn.createStatement();
			ResultSet rs=st.executeQuery(read);
			rs.next();
			int partyId=rs.getInt("partyId");
			String sql2="INSERT into userlogin(userLoginId,password,partyId)"
					+ "Values(?,?,?)";
			pstm=conn.prepareStatement(sql2);
			pstm.setString(1, uName );
			pstm.setString(2, pass);
			pstm.setInt(3, partyId);
			pstm.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	

	public boolean loginValidate(String userName, String userPass) throws SQLException {
		
		String sql="SELECT * FROM userlogin\n"
	            + "WHERE userLoginId=?";
	    PreparedStatement pstm=conn.prepareStatement(sql);
	    
	    pstm.setString(1,userName);
	    ResultSet rs=pstm.executeQuery();
	    String uname;
	    String pass;
	    while(rs.next()){
	        uname=rs.getString("userLoginId");
	        pass=rs.getString("password");
	        
	            if( pass.equals(userPass)){
	                  return true;
	             } 
	        }//end while
	         return false;
	}

	public ArrayList search(String fName) {
		ArrayList searchlist=new ArrayList();
		try
		{
			String sql=" select firstName,lastName from Party where firstName Like '%"+fName+"%'";
		System.out.print(sql);
		PreparedStatement pstm=conn.prepareStatement(sql);
		
		ResultSet rSet=pstm.executeQuery();
		while(rSet.next())
		{    
			System.out.print(rSet.getString("firstName").toString());
			searchlist.add(rSet.getString("firstName"));
		}
		}
		catch (SQLException sq) {
			// TODO: handle exception
			sq.printStackTrace();
		}
		return searchlist;
		
	}
		





	

	
	


	

	
	

	


	

	public void finalize() {
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}