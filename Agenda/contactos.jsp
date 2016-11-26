<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion= request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactos</title>
        <link rel="stylesheet" href="recursos/estiloscontactos.css"/>
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <link rel="stylesheet" href="recursos/styleweb.css"/>
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
                    <li><a href="#"><span class="cuarto"><i class="icon icon-address-book"></i></span>Contactos</a></li>
                    <li><a href="perfil.jsp"><span class="quinto"><i class="icon icon-user-tie"></i></span>Perfil</a></li>
                    <li><a href="#"><span class="logo"><i class="icon icon-yelp"></i></span>.</a></li>
                </ul>
            </nav>
        </header>
       
       <div id="containeragenda">
		<div class="tituloagenda">
			Contactos
		</div>
		<div class="contenidoagenda">
<%
try
{
   // Conexion con bd
   Class.forName("com.mysql.jdbc.Driver");
   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/agendaf", "root", "root");
   if (!conexion.isClosed())
   {
      // La consulta
      Statement st1 = conexion.createStatement();
      ResultSet rs = st1.executeQuery("select * from contactos where numusuario='"+usuario+"'" );
      
      // Ponemos los resultados en un table de html
      
      while (rs.next())
      {
         out.println("<div class=\"itemagenda\"><div class=\"fotoitemagenda\"><img src=\"recursos/img/foto1.jpg\" height=\"100%\" width=\"100%\"></div><div class=\"datositemagenda\">");
         out.println("<b>Nombre:</b> "+rs.getObject("nombres")+"<br>");
         out.println("<b>Apellidos:</b> "+rs.getObject("apellidos")+"</br>");
         out.println("<b>Correo:</b> "+rs.getObject("correo")+"<br>");
         out.println("<b>Celular:</b> "+rs.getObject("celular")+"<br>");
         out.println("<b>Cumpleaños:</b> "+rs.getObject("cumpleaños")+"<br>");
         out.println("<b>Direccion:</b> "+rs.getObject("direccion")+"<br>");
         //out.println("<td>"+rs.getObject("foto")+"</td>");
         //out.println("<td>"+rs.getObject("usuario")+"</td>");
         out.println("</div><br><div class=\"btnperfil\"><a href=\"#\">editar</a></div></div>");
      }
      //out.println("</table>");

      // cierre de la conexion
      conexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>			
			

		</div>

		
	</div>

</body>
</html>
