<%-- 
    Document   : registrar
    Created on : 2/05/2021, 06:45:08 PM
    Author     : Ulises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
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
                    String producto, tamaño, tipo;
                    int gramos, precio;
                    
                    
                    producto = request.getParameter("producto");
                    tipo = request.getParameter("tipo");
                    tamaño = request.getParameter("tam");
                    gramos = Integer.parseInt(request.getParameter("gramos"));
                    precio = Integer.parseInt(request.getParameter("precio"));
                    
                    
                    set = con.createStatement();
                    
                    String q = "insert into productos (nom_producto, tipo_producto, tamaño_producto, gramos_producto, precio_producto) "
                            + "values ('"+producto+"', '"+tipo+"', '"+tamaño+"', "+gramos+", "+precio+")";
                    
                    set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Exitoso nwn</h1>
                    
                    <%
                        set.close();
                        
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    
                    <h1>Registro No Exitoso, error al leer la tabla nwn</h1>
                    
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
        
        
    </body>
</html>