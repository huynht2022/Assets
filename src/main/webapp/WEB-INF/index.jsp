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
<title>Facility Assets</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
<h1 class="text-center">Asset Enterprise Management</h1>
<div class="main">
<h3 class="text-center"> New Asset</h3>
<form:form action="/assets" method="POST" modelAttribute="asset">
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="name">Asset Name: </form:label><br />
		<form:errors path="name" class="text-danger"/>
		<form:input path="name" class="p-2 bd-highlight" style="height:25px;"/>
	</div>

	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="vendor" class="p-2 bd-highlight">Vendor: </form:label><br />
		<form:errors path="vendor" class="text-danger"/>
		<form:input path="vendor" class="p-2 bd-highlight" style="height:25px;"/>
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="amount" class="p-2 bd-highlight">Amount: </form:label><br />
		<form:errors path="amount" class="text-danger"/>
		<form:input type="number" step="0.01" min="0" path="amount" class="p-2 bd-highlight" style="height:25px;"/>
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<form:label path="description" class="p-2 bd-highlight">Description: </form:label><br />
		<form:errors path="description" class="text-danger"/>
		<form:textarea rows="3" path="description" class="p-2 bd-highlight" />
	</div>
	
	<div class="d-flex justify-content-center bd-highlight mb-">
		<input type="submit" value="Submit" class="p-2 bd-highlight btn btn-success" style="height:35px;"/>
	</div>
	
</form:form>
<div>
<h3 class="text-center">Assets Management</h3>
<table class="table">
    <thead>
        <tr>
        	<th scope=col">ID</th>
            <th scope="col">Asset</th>
            <th class="col">Vendor</th>
            <th class="col">Amount</th>
            <th class="col">Actions</th>
        </tr>
    </thead>
    <tbody>
		<c:forEach var="asset" items="${assets}">
			<tr>
				<th scope="row">${asset.id}</th>
				<th scope="row"><a href="/assets/<c:out value="${asset.id}">></c:out>"><c:out value="${asset.name}"></c:out></a></td>
				<th><c:out value="${asset.vendor}"></c:out></td>
				<td>$<fmt:formatNumber type="number" minFractionDigits="2" value="${asset.amount}"/></td>
				<td><a href="/assets/edit/${asset.id}">edit</a> <a href="/assets/delete/${asset.id}">delete</a></td>
			</tr>	
		</c:forEach>
    </tbody>
</table>
</div>
</div>
</body>
</html>