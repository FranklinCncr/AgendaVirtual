<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion= request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="recursos/estilosproyectos.css"/>
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <script src="js/proyecto.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Proyectos</title>
    </head>
    <body>
        <!-- Barra de navegacion -->
    	<header>
            <nav>
                <ul>
                    <li><a href="inicio.jsp"><span class="primero"><i class="icon icon-home"></i></span>Inicio</a></li>
                    <li><a href="proyectos.jsp"><span class="segundo"><i class="icon icon-pencil"></i></span>Proyectos</a></li>
                    <li><a href="calendario.jsp"><span class="tercero"><i class="icon icon-file-text"></i></span>Calendario</a></li>
                    <li><a href="contactos.jsp"><span class="cuarto"><i class="icon icon-address-book"></i></span>Contactos</a></li>
                    <li><a href="perfil.jsp"><span class="quinto"><i class="icon icon-user-tie"></i></span>Perfil</a></li>
                    <li><a href="index.jsp"><span class="logo"><i class="icon icon-yelp"></i></span>.</a></li>
                </ul>
            </nav>
        </header>
                    
            <form action="editarp" method="post" id="formproyecto">
        <!-- controles de registro y sesion -->
        <%

try
{
   Consultas consulta=new Consultas();  
   if (!consulta.getConexion().isClosed())
   {
      
      Statement st1 = consulta.getConexion().createStatement();      
      String id = request.getParameter("id");
      ResultSet rs = st1.executeQuery("select * from evento where numusuario='"+usuario+"' and idevento='"+id+"'");
      while (rs.next())
      { 
                out.println("<input type=\"text\" name=\"nuevo proyecto\" value=\"Editar Proyecto\" id=\"txtproyecto\"/> <br>");
                out.println("Titulo(*): <input type=\"text\" name=\"titulo\" value=\""+ rs.getObject("nombre") + "\" id=\"txttitulo\"/>Hora Inicio:<input type=\"time\" name=\"horainicio\" value=\""+ rs.getObject("horainicio") + "\" id=\"txthorainicio\"> Hora Fin:<input type=\"time\" name=\"horafin\" value=\""+ rs.getObject("horafin") + "\" id=\"txthorafin\"><br>");
                out.println("Lugar(*):<input type=\"text\" name=\"lugar\" value=\""+ rs.getObject("lugar") + "\" id=\"txtlugar\"/>Participantes: <input type=\"text\" name=\"participantes\" value=\""+ "participantes" + "\" id=\"txtparticipantes\"/><br>");
                String tipo=""+rs.getObject("idtipo");
                if (tipo.equals("1")){tipo="citas";}
                if (tipo.equals("2")){tipo="reuniones";}
                if (tipo.equals("3")){tipo="viajes";}
                if (tipo.equals("4")){tipo="congresos";}
                if (tipo.equals("5")){tipo="trabajos";}
                if (tipo.equals("6")){tipo="deporte";}
                if (tipo.equals("7")){tipo="otros";}  
                out.println("Tipo(*):<input list=\"tipo\" name=\"tipo\" value=\""+ tipo + "\"  id=\"txttipo\">");
                out.println("<datalist id=\"tipo\">");
                    out.println("<option value=\"citas\">");
                    out.println("<option value=\"reuniones\">");
                    out.println("<option value=\"viajes\">");
                    out.println("<option value=\"congresos\">");
                    out.println("<option value=\"trabajos\">");
                    out.println("<option value=\"deporte\">");
                    out.println("<option value=\"otros\">");
                out.println("</datalist>");
                out.println("Fecha:(*)<input type=\"date\" name=\"fecha\" step=\"1\" min=\"2016-01-01\" max=\"2020-12-31\" value=\""+ rs.getObject("fecha") + "\" id=\"txtfecha\"/><br>");
                out.println("<textarea name=\"recursos\" rows=\"10\" cols=\"70\" id=\"txtrecursos\">"+ "recursos" + "</textarea>");     
                out.println("<textarea name=\"detalles\" rows=\"10\" cols=\"70\" id=\"txtdetalles\">"+ rs.getObject("descripcion") + "</textarea><br>"); 
                out.println("<input type=\"text\" name=\"idproyecto\" value=\""+ rs.getObject("idevento") + "\" id=\"txtid\">");
                
                out.println("<input type=\"reset\" value=\"Cancelar\" id=\"btnc\"> <input type=\"submit\" value=\"Guardar\" id=\"btnp\">");
                }
      consulta.getConexion().close();
   }
   else
      out.println("fallo");
}
catch (Exception e)
{
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>        
                        
            </form>
            <script src="js/proyecto.js"></script>
    </body>
</html>
