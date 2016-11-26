/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.addEventListener('load', function(){
    document.getElementById('boton').addEventListener('click', function(){
        var idusuario=document.getElementById('txtidusuario').value;
        var contraseña=document.getElementById('txtcontraseña').value;
        var nombres=document.getElementById('txtnombres').value;
        var apellidos=document.getElementById('txtapellidos').value;
        var correo=document.getElementById('txtcorreo').value;
        var fechanacimiento=document.getElementById('txtfechanacimiento').value;
        var telefono=document.getElementById('txttelefono').value;
        var direccion=document.getElementById('txtidireccion').value;
        var bandera=false;
        if(idusuario.length>0 && contraseña.length>0 && nombres.length>0 && apellidos.length>0 && correo.length>0 && fechanacimiento.length>0 && telefono.length>0 && direccion.length>0){
            bandera=true;
        }
        if(bandera){
            document.getElementById('formregistro').submit();
        }else{
            alert('Por favor llene todos los campos');
        }
    });      
});

