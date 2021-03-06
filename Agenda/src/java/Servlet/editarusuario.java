/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.Controlador.Consultas;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Fran
 */
@WebServlet(name = "editarusuario", urlPatterns = {"/editaru"})
public class editarusuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        FileItemFactory file_factory= new DiskFileItemFactory();
        ServletFileUpload sfu= new ServletFileUpload(file_factory);
        PrintWriter out = response.getWriter();      
        
        String nombres = request.getParameter("nombresr");
        String apellidos = request.getParameter("apellidosr");
        String correo = request.getParameter("correor");
        String fechanacimiento = request.getParameter("fechanacimientor");
        String telefono = request.getParameter("telefonor");
        String direccion = request.getParameter("direccionr");
        String foto= request.getParameter("foto");    
        
        HttpSession objsesion= request.getSession(false);
        String numusuario = (String)objsesion.getAttribute("usuario");            
        
        Consultas consulta=new Consultas();        
        if(consulta.editarusuario(nombres, apellidos, correo, fechanacimiento, telefono, direccion, foto, numusuario)){
            response.sendRedirect("perfil.jsp");
        }else{
            response.sendRedirect("perfil.jsp");
        }       
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
