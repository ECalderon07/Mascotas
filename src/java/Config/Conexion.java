/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class Conexion {

    public String driver, url, user, password, bd;
    public Connection conn;

    public Conexion() {

        driver = "com.mysql.jdbc.Driver";
        user = "root";
        password = "";
        bd = "storypetbasededatos";
        url = "jdbc:mysql://localhost:3306/" + bd;

        try {

            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion Exitosa!");

        } catch (Exception e) {
            System.out.println("Error en la conexion" + e);
        }

    }

    public Connection obtenerConexion() {
        return conn;
    }

    public Connection cerrarConexion() throws SQLException {
        conn.close();
        conn = null;
        return conn;
    }

    public static void main(String[] args) {
        new Conexion();
    }

}
