<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assets Management</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<h1 class="text-center">Assets Management</h1><a href="/assets">Go back</a>
<br>
<div>
<h3 class="text-center">Asset Edit</h3>
<form:form action="/assets/edit/${asset.id}" method="post" modelAttribute="asset">
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="name">Asset Name: </form:label><br />
		<form:errors path="name" class="text-danger"/>
		<form:input style="width:150px;" path="name"/>
	</div>

	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="vendor">Vendor: </form:label><br />
		<form:errors path="vendor" class="text-danger"/>
		<form:input style="width:150px;" path="vendor"/>
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="amount">Price Amount: </form:label><br />
		<form:errors path="amount" class="text-danger"/>
		<form:input style="width:50px;" type="number" step="0.01" min="0" path="amount"/>
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="description">Description: </form:label><br />
		<form:errors path="description" class="text-danger"/>
		<form:textarea style="width:250px;" rows="3" path="description"/>
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<input type="submit" value="Submit"/>
	</div>	
</form:form>
</div>
</body>
</html>