<%
    HttpSession objsesion= request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.Controlador.Consultas"%>
<script src="js/valeditusuario.js"> </script>
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
      while (rs.next())
      {
            
 		out.println("<img src=\"recursos/img/"+rs.getObject("foto")+"\" width=\"100%\" width=\"100%\">");

 		out.println("<input type=\"file\" name=\"archivo\" class=\"btn btn-block btn-primary btn-sm\" id=\"imagen\" />");
        out.println("<input type=\"button\" class=\"btn btn-info pull-right\" value=\"Subir\" />");
 	out.println("</div>");
        
 	out.println("<div class=\"perfil\">");
            out.println("<form action=\"editaru\" method=\"post\" id=\"editarusuario\">");
   
 		out.println("<b>Nombre:</b><br>");
 		out.println("<input type=\"text\" size=\"40\" name=\"nombresr\" value=\""+rs.getObject("nombre")+"\" id=\"txtnombres\"><br>");
                out.println("<b>Apellidos:</b><br>");
 		out.println(" <input type=\"text\" size=\"40\" name=\"apellidosr\" value=\""+rs.getObject("apellidos")+"\" id=\"txtapellidos\"><br> ");
 		out.println("<b>Correo:</b><br>");
 		out.println("<input type=\"text\" size=\"40\" name=\"correor\" value=\""+rs.getObject("correo")+"\" id=\"txtcorreo\"><br>");
 		out.println("<b>Dirección:</b><br>");
 		out.println("<input type=\"text\" size=\"40\" name=\"direccionr\" value=\""+rs.getObject("direccion")+"\" id=\"txtdireccion\"><br>");
                out.println("<b>Telefono:</b><br>");
 		out.println("<input type=\"text\" size=\"40\" name=\"telefonor\" value=\""+rs.getObject("telefono")+"\" id=\"txttelefono\"><br>");
 		out.println("<b>Fecha de Nacimiento:</b><br>");
 		out.println("<input type=\"date\" size=\"40\" name=\"fechanacimientor\" value=\""+rs.getObject("fechanacimiento")+"\" id=\"txtfechanacimiento\">");
                out.println("<input type=\"tex\" size=\"40\" name=\"foto\" value=\""+rs.getObject("foto")+"\" id=\"txtfoto\"><br>");
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
%>          <input type="submit" value="guardar" id="btneditar"> 
        </form>
 	</div>
 		
 </div>
 	<div class="footerperfil">
 		<div class="btnperfil">
                    
 		</div>
 	</div> 