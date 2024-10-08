<%-- 
    Document   : index
    Created on : 2/10/2024, 2:57:58 a. m.
    Author     : Alvaro Escobar
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Empleados</title
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <div class="container">
            <form action="sr_empleado" method="post" class="form-group">
                <label for="lbl_codigo"><b>Codigo:</b></label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Alvaro Ivan" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Escobar Rojas" required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: 1ra. Av 3-69 Zona 2, Villa Canales, Guatemala" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 47085198" required>
                <label for="lbl_nombres"><b>Fecha de Nacimiento:</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                <label for="lbl_puesto"><b>Puesto:</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <%
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_sangre();
                        for(String i: drop.keySet()){
                            out.println("<option value='" + 1 + "' >" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
                <br>
                <button name="btn_agregar" value="agregar" id="btn_agregar" class="btn btn-primary">Agregar</button>
                <button name="btn_modificar" value="modificar" id="btn_modificar" class="btn btn-primary">Modificar</button>
                
            </form>
                
                <table class="table">
                <thead>
                  <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Nacimiento</th>
                    <th>Puesto</th>
                  </tr>
                </thead>
                <tbody id="tbl_empleados">
                  <% 
                  Empleado empleado = new Empleado();
                  DefaultTableModel tabla = new DefaultTableModel();
                  tabla = empleado.leer();
                  
                  for(int t=0;t<tabla.getRowCount();t++){
                      out.println("<tr data-id="+ tabla.getValueAt(t,0) + "data-id_p=" + tabla.getValueAt(t,8) + ">");
                      out.println("<td>"+ tabla.getValueAt(t,1) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,2) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,3) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,4) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,5) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,6) +"</td>");
                      out.println("<td>"+ tabla.getValueAt(t,7) +"</td>");
                      
                      out.println("</tr>");
                      
                      
                      }
                  
                  %>
                </tbody>
              </table>
            
            
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
       /* <script>
            $('#tbl_empleados'.on('click','tr td', function(evt){
                var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento; 
                tarhet = $(event.target);
                codigo = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                nacimiento = target.param("tr").find("td").eq(5).html();
                
                id = target.parent().data('id');
                id_p = target.parent().data('id_p');
                $("#drop_puesto").val(id_p);
                $("#txt_id").val(id);
                
                
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
                
                
                
                
                
            }));
        </script> */
    </body>
</html>
