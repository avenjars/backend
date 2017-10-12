<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
    f.submit();
}
function addRecord(){
    var f=document.form;
    f.method="post";
    f.action='insert.jsp';
    f.submit();
}
</script>
<style type="text/css">
th {
	text-align: center;
}

td {
	text-align: center;
}

.demo1 { 
color: #333;
 
    text-shadow: 0px 1px 0px rgba(255,255,255,.5); /* 50% white from bottom */
}
</style>
</head>
<body background="bodyBg.jpg">
 <nav class="navbar ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav> 
	<br>
	<br>
	<form method="post" name="form">
		<table border="1"
			class="table table-hover table-striped table-bordered table-condensed">
			<tr class="info">
				<th>Name</th>
				<th>Address</th>
				<th>Contact No</th>
				<th>Email</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
				Connection con = null;
				String url = "jdbc:mysql://localhost:3306/";
				String db = "test";
				String driver = "com.mysql.jdbc.Driver";
				String userName = "root";
				String password = "root";

				int sumcount = 0;
				Statement st;
				try {
					Class.forName(driver).newInstance();
					con = DriverManager.getConnection(url + db, userName, password);
					String query = "select * from employee";
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><input type="button" name="edit" value="Edit"
					class="btn btn-danger demo1" onclick="editRecord(<%=rs.getString(1)%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					class="btn btn-success demo1"
					onclick="deleteRecord(<%=rs.getString(1)%>);"></td>
			</tr>
			<%
				}
			%>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</form>
	<div align="center">
	<input type="button" class="btn btn-default demo1" value="Add product" onclick="addRecord()"></div>
</body>
</html>