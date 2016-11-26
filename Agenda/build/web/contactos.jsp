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
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactos</title>
        <link rel="stylesheet" href="recursos/estiloscontactos.css"/>
        <link rel="stylesheet" href="recursos/styleweb.css"/>
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <script>
            
        </script>
    </head>
    <body>
        <!--Menu-->
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
       
       <div id="containeragenda">
		<div class="tituloagenda">
			<form name="Form1" method="get" action="contactos.jsp">
                         Contactos | <input type="text" name="query" placeholder="Buscar Contacto">
                         <input type="submit" value="Buscar">
                         <a HREF="contactosnuevo.jsp"><img src="recursos/img/add.png"></a>
                    </form>
		</div>
		<div class="contenidoagenda">
<%
    String id = request.getParameter("id");
    String query = request.getParameter("query");
if (query != null){
try
{
   Consultas consulta=new Consultas();  
   if (!consulta.getConexion().isClosed())
   {
      Statement st1 = consulta.getConexion().createStatement();
      ResultSet rs = st1.executeQuery("select * from contacto where nombre='"+query+"' and numusuario='"+usuario+"'" );
      while (rs.next())
      {
         out.println("<div class=\"itemagenda\"><div class=\"fotoitemagenda\"><img src=\"recursos/img/"+rs.getObject("foto")+"\" height=\"100%\" width=\"100%\"></div><div class=\"datositemagenda\">");
         out.println("<b>Nombre:</b> "+rs.getObject("nombre")+"<br>");
         out.println("<b>Apellidos:</b> "+rs.getObject("apellidos")+"</br>");
         out.println("<b>Correo:</b> "+rs.getObject("correo")+"<br>");
         out.println("<b>Celular:</b> "+rs.getObject("telefono")+"<br>");
         String cumple=""+rs.getObject("onomastico");
         cumple=cumple.substring(5,cumple.length());
         out.println("<b>Cumpleaños:</b> "+cumple+"<br>");
         out.println("<b>Direccion:</b> "+rs.getObject("direccion")+"<br>");
         out.println("</div><br><div class=\"btnperfil\"><a href=\"contactosedit.jsp?id="+ rs.getObject("idcontacto") +"\">editar</a>");
         out.println("<form action=\"econtacto\">");
         out.println("<input type=\"text\" value=\""+rs.getObject("idcontacto")+"\">");
         out.println("<input type=\"submit\" value=\"eliminar\">");
         out.println("/form");
         out.println("</div>");
         out.println("</div>");
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
    }
else {

try
{
   Consultas consulta=new Consultas();  
   if (!consulta.getConexion().isClosed())
   {
      Statement st1 = consulta.getConexion().createStatement();
      ResultSet rs = st1.executeQuery("select * from contacto where numusuario='"+usuario+"'" );
      while (rs.next())
      {
         out.println("<div class=\"itemagenda\"><div class=\"fotoitemagenda\"><img src=\"recursos/img/"+rs.getObject("foto")+"\" height=\"100%\" width=\"100%\"></div><div class=\"datositemagenda\">");
         out.println("<b>Nombre:</b> "+rs.getObject("nombre")+"<br>");
         out.println("<b>Apellidos:</b> "+rs.getObject("apellidos")+"</br>");
         out.println("<b>Correo:</b> "+rs.getObject("correo")+"<br>");
         out.println("<b>Celular:</b> "+rs.getObject("telefono")+"<br>");
         String cumple=""+rs.getObject("onomastico");
         cumple=cumple.substring(5,cumple.length());
         out.println("<b>Cumpleaños:</b> "+cumple+"<br>");
         out.println("<b>Direccion:</b> "+rs.getObject("direccion")+"<br>");
         out.println("</div><br><div class=\"btnperfil\"><a href=\"contactosedit.jsp?id="+ rs.getObject("idcontacto") +"\">editar</a>");
         out.println("<form action=\"econtacto\" method=\"post\">");
         out.println("<input type=\"text\" name=\"idcontactos\" value=\""+rs.getObject("idcontacto")+"\" id=\"idcont\">");
         out.println("<input type=\"submit\" value=\"Eliminar\" id=\"econt\">");
         out.println("</form>");
         out.println("</div>");
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
}
%>					
		</div>		
	</div>
</body>
</html>
