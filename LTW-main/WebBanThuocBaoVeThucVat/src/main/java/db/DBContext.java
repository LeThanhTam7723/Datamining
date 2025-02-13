package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    static public Connection getConnection() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ltw?useUnicode=true&characterEncoding=UTF-8";
            String username = "root";
            String password = "root";
            return DriverManager.getConnection(url, username, password);
        }catch(ClassNotFoundException ex){//s
            ex.printStackTrace();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        Connection conn = getConnection();
        if(conn != null){
            System.out.println("Success");
        }else{
            System.out.println("Fails");
        }
    }
}
