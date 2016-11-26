/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global response */

window.addEventListener('load', function(){
    document.getElementById('btnp').addEventListener('click', function(){
        response.setContentType("text/html;charset=UTF-8");
        var titulo=document.getElementById('txttitulo').value;
        var lugar=document.getElementById('txtlugar').value;
        var fecha=document.getElementById('txtfecha').value;
        var tipo=document.getElementById('txttipo').value;
        var bandera=false;
        if(titulo.length>0 && lugar.length>0 && fecha.length>0 && tipo.length>0){
            bandera=true;
        }
        if(bandera){
            document.getElementById('formproyecto').submit();
            alert('Evento agregado');
        }else{
            alert('Por favor llena los campos obligatorios');            
        }
    });      
});
