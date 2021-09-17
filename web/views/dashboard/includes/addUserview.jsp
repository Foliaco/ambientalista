<%-- 
    Document   : addUser
    Created on : 15/09/2021, 05:30:07 PM
    Author     : Luis Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>añadiendo usuario</title>
    </head>
    <form action="../../../control/addUser.jsp" method="post">
        <div class="mb-3">
            <label for="cedula" class="form-label">Cedula</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name="cedula" aria-describedby="emailHelp">

        </div>

        <div class="mb-3">
            <label for="nombre" class="form-label">Primer Nombre</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="nombre" required>
        </div>

        <div class="mb-3">
            <label for="segundo_nombre" class="form-label">Segundo Nombre</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="segundo_nombre">
        </div>
        
        <div class="mb-3">
            <label for="apellido" class="form-label">Primer Apellido</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="apellido" required>
        </div>
        
        <div class="mb-3">
            <label for="segundo_apellido" class="form-label">Segundo Apellido</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="segundo_apellido">
        </div>
        
        <div class="mb-3">
            <label for="telefono" class="form-label">telefono</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="telefono" required>
        </div>
        
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="email" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</body>
</html>
