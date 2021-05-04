<%-- 
    Document   : consultar
    Created on : 2/05/2021, 06:07:45 PM
    Author     : Ulises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Productos</title>
    </head>
    <body>
        <h1>Tabla General de Cuentas de Productos</h1>
        <table border="2" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>PRODUCTO</th>
                    <th>TIPO</th>
                    <th>TAMAÑO</th>
                    <th>GRAMOS</th>
                    <th>PRECIO</th>
                    <th>EDITAR</th>
                    <th>BORRAR</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    String url, userName, password, driver;
                    url = "jdbc:mysql://localhost/productosPale";
                    userName = "root";
                    password = "ringorivera28";
                    driver = "com.mysql.jdbc.Driver";
                    
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            String q = "select * from productos";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                <tr>
                    <td name="id"> <%=rs.getInt("id_producto")%> </td>
                    <td> <%=rs.getString("nom_producto")%> </td>
                    <td> <%=rs.getString("tipo_producto")%> </td> 
                    <td> <%=rs.getString("tamaño_producto")%> </td>
                    <td> <%=rs.getString("gramos_producto")%> </td> 
                    <td> <%=rs.getString("precio_producto")%> </td> 
                    <td> <a href="editar.jsp?id=<%=rs.getInt("id_producto")%>" > Editar </a> </td>
                    <td> <a href="borrar.jsp?id=<%=rs.getInt("id_producto")%>" > Borrar </a> </td>

                </tr>            
                            
                            
                            <%
                                
                                
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Error el recurso de la consulta no esta disponible, solo juguito contigo</h1>
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
                    
                      <h1>Sitio en construcción</h1>
                    
                    <%
                    }
                    %>
                
                
            </tbody>
            
            
        </table>
            <br>
            <a href="index.html" >Regresar al Menú Principal</a>
            <br>
            <a href="registrar.jsp" >Registrar Nuevo Usuario</a>
    </body>
</html>
