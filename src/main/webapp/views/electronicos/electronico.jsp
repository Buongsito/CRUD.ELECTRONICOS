<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 27/08/2021
  Time: 2:33 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Listado de Electronicos</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<div id="content">
    <br>
    <button type="button" data-bs-target="#create">
        <i class="fas fa-plus"></i> Agregar Eléctronico</button>
    <br>
    <table id="tableGadget" class="table">
        <thead class="table-dark">
        <th>No.</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Fecha Registro</th>
        <th>Estado (Activo / Inactivo)</th>
        <th>Opciones</th>
        </thead>
        <tbody >
        </tbody>
    </table>
</div>
<div class="modal fade" >
    <h1 class="modal-title" id="AgregarElectronico">Agregar Electronico</h1>
</div>
<div class="modal-body" id="create">
    <div class="row">
        <div>
            <label>Nombre del Electronico:</label>
            <input class="form-control" type="text" name="nombre" id="nombre"  />

        </div>
        <div >
            <label>Calle:</label>
            <input class="form-control" type="text" name="calle" id="calle"  />

        </div>
        <div>
            <label>Colonia:</label>
            <input class="form-control" type="text" name="colonia" id="colonia"  />

        </div>
        <div>
            <label>Código Postal:</label>
            <input class="form-control" type="number" name="postal" id="postal"  />

        </div>
        <div>
            <label>Estado:</label>
            <input class="form-control" type="text" name="estado" id="estado"  />

        </div>
        <div>
            <label>País:</label>
            <input class="form-control" type="text" name="pais" id="pais"  />
        </div>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
    <button type="button" class="btn btn-success" onclick="create();"> Agregar Electronico</button>
</div>
<div class="modal fade" id="update">
    <div class="modal-header">
        <h1 class="modal-title" >Registrar Electronico</h1>
        <button type="button" class="btn-close" aria-label="Close"></button>
    </div>
    <div class="modal-body">
        <form action="${context}/updateElectronicos" method="POST">
            --indexs
            <input type="hidden" name="id" id="id">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="direccionId" id="direccionId">
            --indexs
            <div class="row">
                <div>
                    <label>Nombre del Electronico:</label>
                    <input class="form-control" type="text" name="nombre" id="nombre1"  />
                </div>
                <div>
                    <label>Calle:</label>
                    <input class="form-control" type="text" name="calle" id="calle1"  />
                </div>
                <div>
                    <label>Colonia:</label>
                    <input class="form-control" type="text" name="colonia" id="colonia1"  />
                </div>
                <div>
                    <label>Código Postal:</label>
                    <input class="form-control" type="number" name="postal" id="postal1"  />
                </div>
                <div>
                    <label>Estado:</label>
                    <input class="form-control" type="text" name="estado" id="estado1"  />
                </div>
                <div>
                    <label>País:</label>
                    <input class="form-control" type="text" name="pais" id="pais1"  />
                </div>
            </div>
                <button type="button" class="btn btn-secondary"><i class="fas fa-times"></i> Cancelar</button>
                <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
        </form>
    </div>
</div>
<div class="modal fade" id="details">
    <div class="modal-header">
        <h1 class="modal-title" >Detalles del Electronico</h1>
        <button type="button" class="btn-close"></button>
    </div>
    <div class="modal-body">
        <div class="row">
            <div>
                <label>Nombre del Electronico:</label>
                <br>
                <span id="nombre3" style="font-weight: bold"></span>
            </div>
            <div>
                <label>Calle:</label>
                <br>
                <span id="calle2" style="font-weight: bold"></span>
            </div>
            <div>
                <label>Colonia:</label>
                <br>
                <span id="colonia2" style="font-weight: bold"></span>
            </div>
            <div>
                <label>Código Postal:</label>
                <br>
                <span id="postal2" style="font-weight: bold"></span>
            </div>
            <div>
                <label>Estado:</label>
                <br>
                <span id="estado2" style="font-weight: bold"></span>
            </div>
            <div>
                <label>País:</label>
                <br>
                <span id="pais2" style="font-weight: bold"></span>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
    </div>
</div>






<div class="modal fade" id="delete">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel3">Detalles Electronico</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
        <form action="${context}/deleteElectronicos" method="POST">
            --index
            <input type="hidden" name="id2" id="id2">
            <input type="hidden" name="action" value="delete">
            <span id="name2" style="font-weight: bold"></span>
            --index

            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
            <button type="submit" class="btn btn-danger" ><i class="fas fa-trash"></i> Eliminar</button>
        </form>
    </div>
</div>






<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${context}/assets/dist/js/main.js"></script>
</body>
</html>
