<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<% 
String  R= (String)request.getAttribute("resultat");
%>
</head>
<body>
<%=R %> 
<div class="container">
<span><%=R %></span>
		<table>
			<thead>
				<tr>
					<th>Reference</th>
					<th>Name</th>
					<th>Supplier</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<!-- Here is where we display the products -->
				<!-- You can use JSTL or JavaScript to populate this table dynamically -->
			</tbody>
		</table>
	</div>
</body>
</html>