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
                        
                            <%                                     
try
{
   Consultas consulta=new Consultas();  
   if (!consulta.getConexion().isClosed())
   {
      Statement st1 = consulta.getConexion().createStatement();
      String id = request.getParameter("id");
      ResultSet rs = st1.executeQuery("select * from contacto where idcontacto='"+id+"'" );
      while (rs.next())
      {   
                            
				out.println("<div class=\"fotoitemagenda\">");
					out.println("<img src=\"recursos/img/"+rs.getObject("foto")+"\" height=\"100%\" width=\"100%\">");
				out.println("</div>");
				out.println("<div class=\"datositemagenda\">");
                                out.println("<form action=\"editcontactos\" method=\"post\" id=\"contactos\">");
                                        out.println("<b>Nombre:</b>");
                                        out.println("<input type=\"text\" size=\"20\" name=\"nombres\" value=\""+rs.getObject("nombre")+"\">");
                                        out.println("<b>Apellido:</b>");
                                        out.println("<input type=\"text\" size=\"20\" name=\"apellidos\" value=\""+rs.getObject("apellidos")+"\">");
                                        out.println("<b>Correo:</b>");
                                        out.println("<input type=\"text\" size=\"21\" name=\"correo\" value=\""+rs.getObject("correo")+"\">");
                                        out.println("<b>Celular:</b>");
                                        out.println("<input type=\"text\" size=\"20\" name=\"celular\" value=\""+rs.getObject("telefono")+"\">");
                                        out.println("<b>Cumpleaños:</b>");
                                        out.println("<input type=\"date\" size=\"18\" name=\"cumple\" value=\""+rs.getObject("onomastico")+"\">");
                                        out.println("<b>Dirección:</b>");
                                        out.println("<input type=\"text\" size=\"18\" name=\"direccion\" value=\""+rs.getObject("direccion")+"\">");
                                        out.println("<input type=\"text\" size=\"18\" name=\"foto\" value=\""+rs.getObject("foto")+"\" id=\"txtid\">");
                                        out.println("<input type=\"text\" size=\"18\" name=\"idcontactos\" value=\""+rs.getObject("idcontacto")+"\" id=\"txtid\">");
                                        out.println("<input type=\"submit\" value=\"Guardar\">");
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
                            <br>
				<div class="btnperfil">
                                    
                                </div>
                            
				
			</div>
                 
                   
               
			

		</div>

		
	</div>

</body>
</html>
