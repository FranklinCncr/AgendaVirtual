/* global response */

function registro()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/registro.jsp", false);
                    peticion.send(null);
                    document.getElementById('formweb').innerHTML = peticion.responseText;
                }
            }
function registro()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/registro.jsp", false);
                    peticion.send(null);
                    document.getElementById('formweb').innerHTML = peticion.responseText;
                }
            }

function editprofile()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/editprofile.jsp", false);
                    peticion.send(null);
                    document.getElementById('cargarcontenido').innerHTML = peticion.responseText;
                }
            }
