<%@page import="com.emergentes.entidades.Libro"%>
<%@page import="java.util.List"%>
<%
    List<Libro> libros=(List<Libro>)request.getAttribute("libros");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Libros</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="display-4">Listado de Libros</h1>
            <p><a class="btn btn-success" href="LibroServlet?action=add">Nuevo</a></p>
        </div>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Título</th>
                    <th>Autor</th>
                    <th>Disponible</th>
                    <th>Categoría</th>
                    <th colspan="2" class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Libro item : libros) {
                %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getTitutlo()%></td> <!-- Corregido 'getTitutlo' a 'getTitulo' -->
                    <td><%= item.getAutor() %></td>
                    <td class="text-center">
                        <input type="checkbox" name="disponible" <%= (item.getDisponible() == 1) ? "checked" : "" %> readonly>
                    </td>
                    <td><%= item.getCategoriaId().getDescripcion() %></td>
                    <td class="text-center"><a class="btn btn-warning btn-sm" href="LibroServlet?action=edit&id=<%= item.getId() %>">Editar</a></td>
                    <td class="text-center"><a class="btn btn-danger btn-sm" href="LibroServlet?action=dele&id=<%= item.getId() %>" onclick=" return confirm('¿Está seguro?')">Eliminar</a></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
