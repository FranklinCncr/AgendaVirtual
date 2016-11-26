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
        <link rel="stylesheet" href="recursos/estilosperfil.css"/>
        <link rel="stylesheet" href="recursos/styleweb.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="recursos/js/ajax.js"></script>  
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <title>Perfil</title>
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
                    <li><a href="#"><span class="quinto"><i class="icon icon-user-tie"></i></span>Perfil</a></li>
                    <li><a href="index.jsp"><span class="logo"><i class="icon icon-yelp"></i></span>.</a></li>
                </ul>
            </nav>
        </header>
        <div id="cargarcontenido">
            
        
    <div id="containerprofile">
 	<div class="fotoperfil">
            
<%
try
{
   Consultas consulta=new Consultas();  
   if (!consulta.getConexion().isClosed())
   {
      Statement st1 = consulta.getConexion().createStatement();
      ResultSet rs = st1.executeQuery("select * from usuario where numusuario='"+usuario+"'" );
      while (rs.next()){
            
            out.println("<img src=\"recursos/img/"+rs.getObject("foto")+"\" width=\"100%\" height=\"100%\">");
 	out.println("</div>");
 	out.println("<div class=\"perfil\">");

 		 out.println("<b>Nombre:</b><br>");
 		 out.println(rs.getObject("nombre")+" "+rs.getObject("apellidos")+"<br><br>");
 		 out.println("<b>Correo:</b><br>");
 		 out.println(rs.getObject("correo")+"<br><br>");
 		 out.println("<b>Dirección:</b><br>");
 		 out.println(rs.getObject("direccion")+"<br><br>");
 		 out.println("<b>Telefono:</b><br>");
 		 out.println(rs.getObject("telefono")+"<br><br>");
                 out.println("<b>Edad:</b><br>");
                 String edad=""+rs.getObject("fechanacimiento");
                 int edadint= 2016-Integer.parseInt(edad.substring(0,4));
                 out.println(edadint+"<br>");
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
 <div class="footerperfil">
 		<div class="btnperfil">
 			<a href="#" onclick="javascript:editprofile()">Editar</a>
 		</div>
 	</div>
</div>
        <script type="text/javascript" src="js/functions.js"></script>
    </body>
</html>
