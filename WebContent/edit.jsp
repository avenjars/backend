<%@page language="java"%>
<%@page import="java.sql.*"%>

<head>

<link rel="stylesheet" href="./css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>

<form method="post" action="update.jsp">
	<table border="1" class="table">
		<tr class="danger">
			<th>Name</th>
			<th>Address</th>
			<th>Contact No</th>
			<th>Email</th>
		</tr>
		<%
			String id = request.getParameter("id");
			int no = Integer.parseInt(id);
			int sumcount = 0;
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
				String query = "select * from employee where id='" + no + "'";
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
		%>
		<tr>
			<td><input type="text" name="name"
				value="<%=rs.getString("name")%>"></td>
			<td><input type="text" name="address"
				value="<%=rs.getString("address")%>"></td>
			<td><input type="text" name="contact"
				value="<%=rs.getInt("contact")%>"></td>
			<td><input type="text" name="email"
				value="<%=rs.getString("email")%>"></td>
			<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
		</tr>
		<tr>
			<td><input type="submit" name="Submit" value="Update"
				class="btn btn-primary"></td>
		</tr>
		<%
			}
			} catch (Exception e) {
			}
		%>
	</table>
</form>