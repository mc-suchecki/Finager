<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Finager</title>

	<!-- Finager own CSS file FIXME - not visible already! -->
	<spring:url value="/resources/css/finager.css" var="finagerCSS" />
	<link href="${finagerCSS}" rel="stylesheet" />

	<!-- Twitter Bootstrap -->
	<spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap.min.css" var="bootstrapCSS" />
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap-theme.min.css" var="bootstrapCSS" />
	<link href="${bootstrapCSS2}" rel="stylesheet" />
</head>

