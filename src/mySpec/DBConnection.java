package mySpec;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class DBConnection {
	private static DBConnection instance = new DBConnection();	// DB연결객체
	private DBConnection() {}
	
	public static DBConnection getInstance() {
		if(instance == null) {
			instance = new DBConnection();
		}
		return instance;
	}
	
	// DB연결
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// close(Connection, PreparedStatement)
	public void closeConnection(Connection con, PreparedStatement ps) {
		try {
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// close(Connection, PreparedStatement, ResultSete)
	public void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
