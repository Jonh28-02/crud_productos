<%-- 
    Document   : actualizar
    Created on : 2/05/2021, 08:25:45 PM
    Author     : Ulises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Registros</title>
        
    </head>
    <body>
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
                    int id = Integer.parseInt(request.getParameter("id"));
                    
                    String producto, tam, tipo;
                    int gramos, precio;
                    
                    producto = request.getParameter("producto");
                    tipo = request.getParameter("tipo");
                    tam = request.getParameter("tam");
                    gramos = Integer.parseInt(request.getParameter("gramos"));
                    precio = Integer.parseInt(request.getParameter("precio"));
                    
                    
                    String q = "UPDATE productos set nom_producto = '"+producto+"', "
                            + "tipo_producto = '"+tipo+"', tamaño_producto = '"+tam+"', gramos_producto = "+gramos+", precio_producto = "+precio+" "
                            + "where id_producto = "+id+"";
                    
                    set = con.createStatement();
                    
                    set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Actualizado con Exito</h1>
                    
                    <%     
                    set.close();    
                
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1>Registro No es posible Actualizarlo con Exito, juguito contigo</h1>
                    
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
        
        <br>
        <a href="index.html" >Regresar al Menú Principal</a>
        <br>
        <a href="registrar.jsp" >Registrar Nuevo Usuario</a>
        
    </body>
</html>
