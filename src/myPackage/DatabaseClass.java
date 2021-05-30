package myPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


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
		} catch (SQLException ex) {
			Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	

	public boolean loginValidate(String userName, String userPass) throws SQLException {
		return true;
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