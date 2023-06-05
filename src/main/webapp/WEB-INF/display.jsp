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
<title>Asset Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<h2 class="text-center">Asset Details</h2>
<p class="text-center"><a href="/assets">Go back</a></p>
<table class="table">
    <tbody>
		<tr>
			<td scope="col">Asset Name:</td>
			<td scope="col"><c:out value="${asset.name}"></c:out></td>
		</tr>
		<tr>
			<td scope="col">Asset Location Description:</td>
			<td scope="col"><c:out value="${asset.description}"></c:out></td>
		</tr>
		<tr>
			<td scope="col">Vendor:</td>
			<td scope="col"><c:out value="${asset.vendor}"></c:out></td>
		</tr>
		<tr>
			<td scope="col">Asset Cost:</td>
			<td scope="col">$<fmt:formatNumber type="number" minFractionDigits="2" value="${asset.amount}"/></td>
		</tr>	
    </tbody>
</table>
</body>
</html>