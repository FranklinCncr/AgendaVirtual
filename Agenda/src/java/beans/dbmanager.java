/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SabEnts
 */
public class dbmanager {
    private String driver="";
    private String url="";
    private String user="";
    private String pass="";

    public dbmanager() {        
    }
    
    public Connection Conectar(){
        try {
            Class.forName(driver);
            return (DriverManager.getConnection(url,user,pass));
        } catch (Exception e) {
        }
        return null;
    }
    
    public void Desconectar(Connection cn){
        try {
            cn.close();
        } catch (Exception e) {
        }
    }   
}

