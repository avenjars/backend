<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%! int ans=1; %>
<form action="">
<input type="text" name="hi"> <input type="submit">  </form>

<%

String s=request.getParameter("hi");
ans=1;
if(s!=null){
	int no=Integer.parseInt(s);
	for(int i=1;i<=no;i++){
		ans=ans*i;
	}
}
%>
<%=ans %>

</body>
</html>