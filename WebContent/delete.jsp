<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
           Statement st=con.createStatement();
           int i=st.executeUpdate("delete from employee where id="+id+"");
           response.sendRedirect("application.jsp");
}
catch (Exception e){
System.out.println(e);
}
%>