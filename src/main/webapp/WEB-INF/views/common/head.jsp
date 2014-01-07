<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Finance manager">
    <meta name="author" content="Maciej Suchecki">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Finager</title>

	<!-- Finager own CSS file FIXME - not visible already! -->
	<spring:url value="/resources/css/finager.css" var="finagerCSS" />
	<link href="${finagerCSS}" rel="stylesheet" />

	<!-- Twitter Bootstrap -->
	<spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap.min.css" var="bootstrapCSS" />
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap-theme.min.css" var="bootstrapCSStheme" />
	<link href="${bootstrapCSStheme}" rel="stylesheet" />
	
	<!-- jQuery UI -->
    <spring:url value="/webjars/jquery-ui/1.10.3/themes/base/jquery-ui.css" var="jQueryUIcss"/>
    <link href="${jQueryUIcss}" rel="stylesheet"></link>
</head>

