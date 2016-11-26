/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fran
 */
public class CrearProyecto extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String titulo = request.getParameter("titulo");
        String lugar = request.getParameter("lugar");
        String detalles = request.getParameter("detalles");
        String fecha = request.getParameter("fecha");
        String horainicio = request.getParameter("horainicio");
        String horafin = request.getParameter("horafin");
        String tipo = request.getParameter("tipo");
        String recursos = request.getParameter("recursos");
        String participantes = request.getParameter("participantes");
       
        
        if (tipo.equals("citas")){tipo="1";}
        if (tipo.equals("reuniones")){tipo="2";}
        if (tipo.equals("viajes")){tipo="3";}
        if (tipo.equals("congresos")){tipo="4";}
        if (tipo.equals("trabajos")){tipo="5";}
        if (tipo.equals("deporte")){tipo="6";}
        if (tipo.equals("otros")){tipo="7";}
        if(!tipo.equals("7")&& !tipo.equals("6") && !tipo.equals("5") && !tipo.equals("4") && !tipo.equals("3") && !tipo.equals("2") && !tipo.equals("1")){
            tipo="7";
        }
        //estado
        String estado = "2";
        
        HttpSession objsesion= request.getSession(false);
        String numusuario = (String)objsesion.getAttribute("usuario");
        String foto="proyecto.jpg";
        
        
        Consultas consulta=new Consultas();
        if(consulta.nuevoevento(titulo, lugar, detalles, fecha, foto, horainicio, horafin, tipo, numusuario)){
            response.sendRedirect("inicio.jsp");
        }
        else{
            response.sendRedirect("proyectos.jsp");
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
