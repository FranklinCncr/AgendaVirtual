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
                    <div align="center">
                    <div class="itemagenda">
 
                            
				<div class="fotoitemagenda">
				<img src="recursos/img/foto1.jpg" height="100%" width="100%">
				</div>
				<div class="datositemagenda">
                                    <form action="contacton" method="post" id="crearcontactos">
                                    <b>Nombre:</b>
                                    <input type="text" size="20" name="nombres">
                                    <b>Apellido:</b>
                                    <input type="text" size="20" name="apellidos">
                                    <b>Correo:</b>
                                    <input type="text" size="21" name="correo" >
                                    <b>Celular:</b>
                                    <input type="text" size="20" name="celular">
                                    <b>Cumpleaños:</b>
                                    <input type="date" size="18" name="cumple">
                                    <b>Dirección:</b>
                                    <input type="text" size="18" name="direccion" >
                                    <input type="submit" value="Crear">
                                    </form>
				</div>
                                
                    </div>
                            <br>
				<div class="btnperfil">
                                    
                                </div>
                            
				
			</div>
                 
                   
               
			

		</div>

		
	</div>

</body>
</html>