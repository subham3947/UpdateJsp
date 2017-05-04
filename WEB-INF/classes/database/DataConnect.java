package database;
import java.sql.*;
public class DataConnect {
static  Connection cn=null;
static String driver="com.ibm.db2.jcc.DB2Driver";
static String url="jdbc:db2://localhost:50000/advjava";
static String user="webteklabs";
static String pass="webtek";

public static Connection getConnection(){
	try{
		Class.forName(driver);
		cn=DriverManager.getConnection(url,user,pass);
	}catch(Exception e){
		e.printStackTrace();
	}
	return cn;
}
}
