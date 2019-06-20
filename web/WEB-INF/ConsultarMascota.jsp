<%-- 
    Document   : ConsultarMascota
    Created on : 05-may-2019, 14:19:55
    Author     : Edwin
--%>

<!--%@page import="DAO.EspeciesDAO"%-->
<!--%@page import="DAO.RazasDAO"%-->
<!--%@page import="DAO.UsuarioDAO"%-->
<!--%@page import="VO.UsuarioVO"%-->
<%@page import="Modelo.EspeciesVo"%>
<%@page import="Modelo.RazasVo"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.validate.js"></script>
<script src="js/messages_es.js.js"></script>
<script src="js/datatables.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="jquery-3.3.1.js" type="text/javascript"></script>
<style>
    label.error{
        color: red;
    }
</style>


<div class="container">
    <h1 class="text-center">Mascotas</h1><br>
    <a class="add-proj brd-rd5" href="#" data-toggle="modal" data-target=".bs-example-modal-sm" title="Add Project"><span class="agregar btn btn-success"><i class="fa fa-plus-circle"></i> AGREGAR</span></a> 
    <br>
    <br>
    <%
        Conexion conexion = new Conexion();
        Statement puente;
        ResultSet rs;
        puente = conexion.obtenerConexion().createStatement();
        rs = puente.executeQuery("SELECT idMascota, mascotas.Nombre, FechaNacimiento, Sexo, razas.raza, FKUsuario FROM mascotas INNER JOIN razas ON mascotas.FKRaza = razas.id;");
    %>


    <form action="Mascota" method="POST">
        <table id="datatable-keytable" class="table table-striped table-bordered" style="width: 100%;">
            <thead>
                <tr>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">ID</td>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Nombre</td>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Fecha</td>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Sexo</td>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Raza</td>
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Usuario</td>                      
                    <td style="border: 1px;border-bottom-color: #007bff;" class="text-center">Acciones</td>                      
                </tr>   
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("idMascota")%></td>
                    <td class="text-center"><%= rs.getString("mascotas.Nombre")%></td>
                    <td class="text-center"><%= rs.getString("FechaNacimiento")%></td>                        
                    <td class="text-center"><%= rs.getString("Sexo")%></td>                        
                    <td class="text-center"><%= rs.getString("razas.raza")%></td>                        
                    <td class="text-center"><%= rs.getString("FKUsuario")%></td>             
                    <td class="text-center">
                        <a class="btnEditarM btn btn-warning" id="btnEditarM" data-id="<%= rs.getString("idMascota")%>"><i class="fa fa-edit" ></i>  EDITAR</a>
                        <a class="btnEliminarM btn btn-danger" "><i class="fa fa-trash-o" ></i> ELIMINAR</a>
                        <a class="btn btn-primary" data-id="<%= rs.getString("idMascota")%>&Estado=0"><i class="fa fa-eye-slash" href="Mascota?accion=Estado&id=<%=rs.getString("idMascota")%>&Estado=0"></i> OCULTAR</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </form>
</div>

<!-- Modal -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="text-center"> Registrar Mascota</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="Mascota" class="text-center" id="formRegistrarMascota">
                    <label>Nombre</label><br>            
                    <input class="bordes" type="text" name="nombre" style="width: 174px;height: 34px;" placeholder=" Nombre" required="true"><br> 
                    <label>Fecha Nacimiento</label><br>
                    <input class="bordes" min="2000-01-01" max="2019-12-31" type="date" name="fechaNacimiento"style="width: 174px;height: 34px;" required="true"><br> 
                    <label>Sexo</label><br>
                    <select class="bordes" name="sexo"style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                        <option value="H">Hembra</option>
                        <option value="M">Macho</option>
                    </select><br> 
                    <label>Especie</label><br>
                    <select class="bordes" name="fkespecie" id="selectorUsuario" style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                    </select><br>
                    <label>Raza</label><br>
                    <select class="bordes" name="fkRaza" id="selectorLibro" style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                    </select><br>
                    <label>Usuario</label><br>
                    <input class="bordes" type="number" name="fkUsuario"style="width: 174px;height: 34px;" required="true">
                    <br><br>
                    <input type="submit" id="btnRegistrar" name="accion" value="Registrar" class="btn btn-outline-primary">                                               
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
//raza->libro
//especie->usuario
    //carga inicial del select
    $.ajax({
        url: './ControladorEspecie',
        success: function (resultado) {
            console.log(resultado)
            let option = "";
            $.each(resultado, function (fila, valor) {
                option += "<option value=" + valor.especie + ">" + valor.nombre + "</option>"
            })
            $("#selectorUsuario").html(option)
        },
        error: function () {
            console.log("error")
        }
    })



    $("#selectorUsuario").change(function () {

        console.log($("#selectorUsuario").val())
        $.ajax({
            url: './ControladorRaza',
            dataType: 'json',
            data: {especie: $("#selectorUsuario").val()},
            type: 'post',
            success: function (resultado) {
                console.log(resultado)
                let option = "";
                $.each(resultado, function (fila, valor) {
                    option += "<option value=" + valor.id + ">" + valor.raza + "</option>"
                })
                $("#selectorLibro").html(option)

            },
            error: function (resultado) {
                console.log(resultado)
            }

        })
    })

</script>

<script>

    $('#datatable-keytable').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
    });

    $(document).ready(function () {
        $("#formRegistrarMascota").validate({
            rules: {
                nombre: {
                    required: true,
                },
                fechaNacimiento: {
                    required: true,
                },
                sexo: {
                    required: true,
                },
                fkespecie: {
                    required: true,
                },
                fkRaza: {
                    required: true,
                },
                fkUsuario: {
                    required: true,
                }
            }

        })

    });

</script>




<%if (request.getAttribute("error") != null) {%>
${error}
<%} else {%>
${exito}
<%}%> 
