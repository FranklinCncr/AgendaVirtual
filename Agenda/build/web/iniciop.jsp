<%@page import="beans.Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion= request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<%@ page language="java" %>
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="recursos/estilosinicio.css"/>
        <link rel="stylesheet" href="recursos/styleweb.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/ajax.js"></script>  
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <title>Inicio</title>
    </head>
    <body id="bodyinicio">
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
           	        
        <html ng-app="myApp" ng-controller="AppCtrl" lang="es">
            <head>
                <meta charset="utf-8">
                <title>Circle</title>
            </head>
            <body id="bodycalendario">
                <div calendar class="calendar" id="calendar"></div>
            </body>
        </html>
   
    <div class="eventheader">
        
        <a href="inicio.jsp" id="linkevento" ><b> Lista de Eventos</b></a>
            <div class="containerevent" id="contenidoevento">
                <div class="containerevent2">
                    <div class="itemevent">
                   
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
        out.println("<div class=\"itemevendatecontent\">");
                String tipo=""+rs.getObject("idtipo");
                if (tipo.equals("1")){tipo="citas";}
                if (tipo.equals("2")){tipo="reuniones";}
                if (tipo.equals("3")){tipo="viajes";}
                if (tipo.equals("4")){tipo="congresos";}
                if (tipo.equals("5")){tipo="trabajos";}
                if (tipo.equals("6")){tipo="deporte";}
                if (tipo.equals("7")){tipo="otros";}
		out.println(rs.getObject("nombre"));                
		out.println("</div>");
		out.println("<hr>");
		out.println("<div class=\"itemeventdata\">");
		out.println(rs.getObject("horainicio") + " - "+" | "+rs.getObject("horafin")+" | "+tipo);
		out.println("</div>");
		out.println("<hr>");
                out.println("Lugar: "+rs.getObject("lugar"));
                out.println("<hr></br>");                
		out.println("<div class=\"itemeventcontent\">");
			out.println("<div class=\"participantes\">");
				out.println("<div align=\"center\"><b>Participantes</b></div>");
				out.println("<ul>");
                                
					for(int i = 1;i<=1;i++){
					out.println("<li>"+ "CAMPO PARTICIPANTES" +"</li>");
                                        }
                                        
				out.println("</ul>");
			out.println("</div>");
			out.println("<div class=\"participantes\">");
				out.println("<div align=\"center\"><b>Recursos</b></div>");
				out.println("<ul>");
                                        for(int i = 1;i<=1;i++){
					out.println("<li>"+ "CAMPO RECURSOS" +"</li>");
                                        }
                                        
				out.println("</ul>");
                                
			out.println("</div>");
                        out.println("<br>"); 
			out.println("</br><hr></br>");
			out.println(rs.getObject("descripcion"));                       
		out.println("</div>");  
                out.println("<div class=\"itemedit\">");
                out.println("<a href=\"proyectosedit.jsp?id="+rs.getObject("idevento")+"\"><b>Editar</b></a>");
                out.println("</div>");
                out.println("<form action=\"eproyecto\">");
                out.println("<input type=\"text\" name=\"idproyecto\" value=\""+id+"\" id=\"idpro\">");
                out.println("<input type=\"submit\" value=\"Eliminar\" id=\"btne\">");
                out.println("</form>");                
                
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
            </div>
	</div>
    </div>	
</div>       
        
           
        <div class="wrap">
		<div class="widget">
			<div class="fecha" style="display:none;">
				<p id="diaSemana" class="diaSemana">Martes</p>
				<p id="dia" class="dia">27</p>
				<p>de </p>
				<p id="mes" class="mes">Octubre</p>
				<p>del </p>
				<p id="year" class="year">2015</p>
			</div>
	
			<div class="reloj">
				<p id="horas" class="horas">11</p>
				<p>:</p>
				<p id="minutos" class="minutos">48</p>
				<p>:</p>
				<div class="caja-segundos">
					<p id="ampm" class="ampm">AM</p>
					<p id="segundos" class="segundos">12</p>
				</div>
			</div>
		</div>
	</div>
        
        
        <div id="divusuario">
            <%
try
{
   Consultas consulta=new Consultas();
   String contactos = consulta.contactos(usuario);
   String proyectos = consulta.eventos(usuario);
   if (!consulta.getConexion().isClosed())
   {
      Statement st1 = consulta.getConexion().createStatement();
      ResultSet rs = st1.executeQuery("select * from usuario where numusuario='"+usuario+"'" );
      
      while (rs.next()){
            out.println("<div id=\"divfoto\">");
            out.println("<img src=\"recursos/img/"+rs.getObject("foto")+"\" width=\"100%\" height=\"100%\">");
 	out.println("</div>");
 	out.println("<div class=\"perfilini\">");
                 out.println("<br><b>Usuario:</b>");
 		 out.println(rs.getObject("nombre")+" "+rs.getObject("apellidos"));                 
                 
                 out.println("<br><br><b>Eventos: </b> Tienes "+proyectos +" eventos");
                 out.println("<br><br><b>Contactos: </b>Tienes "+contactos+" contactos");
        out.println("</div>");		 	 
           
                 
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
 </div>
        
        <script src='recursos/cal.js'></script>
        <script src='recursos/cal2.js'></script>
        <script src='recursos/cal3.js'></script>
        <script src="recursos/calendario/js/index.js"></script>
        <script src='recursos/js/reloj.js'></script>
        <script type="text/javascript" src="js/functions.js"></script>
    </body>
</html>
