/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Fran
 */
public class Consultas extends Conexion{
    public int autenticacion(String usuario, String contraseña){
        PreparedStatement pst=null;
        ResultSet rs=null;
        int num;
        try{
            String consulta="Select * from usuario where idusuario = ? and clave = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();            
            if(rs.absolute(1)){
                num =(int) rs.getObject("numusuario");
                return num;
            }            
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if (getConexion()!=null)getConexion().close();
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return 0;
    }
    
    
    public boolean registrar(String idusuario, String contraseña, String nombres, String apellidos, String correo, String fechanacimiento, String telefono, String direccion, String foto, String administrador){
        PreparedStatement pst=null;
        try{
            String consulta="insert into usuario (idusuario, clave, nombre, apellidos, correo, fechanacimiento, telefono, direccion, foto, idadministrador) values(?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, idusuario);
            pst.setString(2, contraseña);
            pst.setString(3, nombres);
            pst.setString(4, apellidos);
            pst.setString(5, correo);
            pst.setString(6, fechanacimiento);
            pst.setString(7, telefono);
            pst.setString(8, direccion);
            pst.setString(9, foto);
            pst.setString(10, administrador);            
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
        
    public boolean nuevoContacto(String nombres, String apellidos,String correo,String celular, String cumpleaños, String direccion, String foto, String numusuario){
        PreparedStatement pst=null;
        try{
            String consulta="insert into contacto (nombre, apellidos, correo, telefono, onomastico, direccion, foto, numusuario) values(?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, nombres);
            pst.setString(2, apellidos);
            pst.setString(3, correo);
            pst.setString(4, celular);
            pst.setString(5, cumpleaños);
            pst.setString(6, direccion);
            pst.setString(7, foto);
            pst.setString(8, numusuario);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public boolean editarusuario(String nombres, String apellidos, String correo, String fechanacimiento, String telefono, String direccion,String foto, String numusuario){
        PreparedStatement pst=null;
        try{
            String consulta="UPDATE usuario SET nombre=?, apellidos=?, correo=?, fechanacimiento=?, telefono=?, direccion=?, foto=? WHERE numusuario=?";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, nombres);
            pst.setString(2, apellidos);
            pst.setString(3, correo);
            pst.setString(4, fechanacimiento);
            pst.setString(5, telefono);
            pst.setString(6, direccion);
            pst.setString(7, foto);
            pst.setString(8, numusuario);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
             
    public boolean agregarContacto(String nombres, String apellidos, String correo, String celular, String cumpleaños, String direccion, String foto, String usuario){
        PreparedStatement pst=null;
        try{
            String consulta="insert into contactos (nombre, apellidos, correo, celular, onomastico, direccion, foto, usuario) values(?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, nombres);
            pst.setString(2, apellidos);
            pst.setString(3, correo);
            pst.setString(4, celular);
            pst.setString(5, cumpleaños);
            pst.setString(6, direccion);
            pst.setString(7, foto);
            pst.setString(8, usuario);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    public boolean editarContacto(String nombres, String apellidos, String correo, String celular, String cumpleaños, String direccion, String foto, String idcontactos){
        PreparedStatement pst=null;
        try{
            String consulta="UPDATE contacto SET nombre=?, apellidos=?, correo=?, telefono=?, onomastico=?, direccion=?, foto=? WHERE idcontacto=?";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, nombres);
            pst.setString(2, apellidos);
            pst.setString(3, correo);
            pst.setString(4, celular);
            pst.setString(5, cumpleaños);
            pst.setString(6, direccion);
            pst.setString(7, foto);
            pst.setString(8, idcontactos);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean editarproyecto(String titulo, String lugar, String detalles, String fecha, String horainicio, String horafin, String tipo, String recursos,String participantes, String estado, String idproyecto){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="UPDATE proyecto SET titulo=?, lugar=?, detalles=?, fecha=?, horainicio=?, horafin=?, tipo=?, recursos=?, participantes=?, estado=? WHERE idproyecto=? ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, lugar);
            pst.setString(3, detalles);
            pst.setString(4, fecha);
            pst.setString(5, horainicio);
            pst.setString(6, horafin);
            pst.setString(7, tipo);
            pst.setString(8, recursos);
            pst.setString(9, participantes);
            pst.setString(10, estado);
            pst.setString(11, idproyecto);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    public boolean editarevento(String titulo, String lugar, String detalles, String fecha,String foto, String horainicio, String horafin, String tipo, String idevento){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="UPDATE evento SET nombre=?, lugar=?, descripcion=?, fecha=?, foto=?, horainicio=?, horafin=?, idtipo=? WHERE idevento=?";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, lugar);
            pst.setString(3, detalles);
            pst.setString(4, fecha);
            pst.setString(5, foto);
            pst.setString(6, horainicio);
            pst.setString(7, horafin);
            pst.setString(8, tipo);
            pst.setString(9, idevento);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public boolean eliminarproyecto(String idproyecto){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="DELETE FROM proyecto WHERE idproyecto=? ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, idproyecto);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean eliminarevento(String idevento){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="DELETE FROM evento WHERE idevento=? ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, idevento);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean eliminarcontacto(String idcontactos){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="DELETE FROM contacto WHERE idcontacto=? ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, idcontactos);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean nuevoproyecto(String titulo, String lugar, String detalles, String fechainicio,String fechafin, String foto, String tipo, String numusuario){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="insert into proyecto (nombre, lugar, descripcion, fechainicio, fechafin, foto, idtipo, numusuario) values(?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, lugar);
            pst.setString(3, detalles);
            pst.setString(4, fechainicio);
            pst.setString(5, fechafin);
            pst.setString(6, foto);
            pst.setString(7, tipo);
            pst.setString(8, numusuario);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean nuevoevento(String titulo, String lugar, String detalles, String fecha,String foto, String horainicio, String horafin, String tipo, String numusuario){
        PreparedStatement pst = null;
        boolean flag=false;     
        try{
            String consulta="insert into evento (nombre, lugar, descripcion, fecha, foto, horainicio, horafin, idtipo, numusuario) values(?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, lugar);
            pst.setString(3, detalles);
            pst.setString(4, fecha);
            pst.setString(5, foto);
            pst.setString(6, horainicio);
            pst.setString(7, horafin);
            pst.setString(8, tipo);
            pst.setString(9, numusuario);
            if(pst.executeUpdate() == 1){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst != null) pst.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public String eventos(String numusuario){
        String cont="";
        int c=0;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String consulta=("select * from evento where numusuario=?");
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, numusuario);
            
            rs = pst.executeQuery();            
            while(rs.next()){
                c=c+1;                
            }
            cont=cont+c;
            return cont;
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return "0";
    }
    
    public String contactos(String numusuario){
        String cont="";
        int c=0;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String consulta=("select * from contacto where numusuario=?");
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, numusuario);
            
            rs = pst.executeQuery();            
            while(rs.next()){
                c=c+1;                
            }
            cont=cont+c;
            return cont;
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            }catch (Exception e){
                System.err.println("Error "+e);
            }
        }
        return "0";
    }
    
    void cerrarConexion(){
        try{
                getConexion().close();
                
            }catch (Exception e){
                System.err.println("Error "+e);
            }
    }
    
    public static void main(String[] args){
        //Consultas f = new Consultas();
        //System.out.println(f.maxId("contactos", "idcontactos"));        
        //System.out.println(f.maxId("usuario", "numusuario"));
        //f.cerrarConexion();                  
          
    } 
}
