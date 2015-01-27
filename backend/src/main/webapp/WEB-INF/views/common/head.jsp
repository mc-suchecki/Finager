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

	<spring:url value="/resources/css/finager.css" var="finagerCSS" />
	<link href="${finagerCSS}" rel="stylesheet" />

	<!-- Twitter Bootstrap -->
	<spring:url value="/webjars/bootstrap/3.1.0/css/bootstrap.min.css" var="bootstrapCSS" />
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<spring:url value="/webjars/bootstrap/3.1.0/css/bootstrap-theme.min.css" var="bootstrapCSStheme" />
	<link href="${bootstrapCSStheme}" rel="stylesheet" />
	
	<!-- Bootstrap Datepicker -->
	<spring:url value="/webjars/bootstrap-datepicker/1.3.0/css/datepicker.css" var="bootstrapDatepickerCSS" />
    <link href="${bootstrapDatepickerCSS}" rel="stylesheet"></link>
	<spring:url value="/webjars/bootstrap-datepicker/1.3.0/css/datepicker3.css" var="bootstrapDatepicker3CSS" />
    <link href="${bootstrapDatepicker3CSS}" rel="stylesheet"></link>
    
    <!-- Datatables -->
	<spring:url value="/webjars/datatables-bootstrap/2-20120201/DT_bootstrap.css" var="bootstrapDatatables" />
    <link href="${bootstrapDatatables}" rel="stylesheet"></link>
	<spring:url value="/webjars/datatables/1.9.4/media/css/jquery.dataTables.css" var="datatables" />
    <link href="${datatables}" rel="stylesheet"></link>

	<!-- META-INF/resources/webjars/datatables/1.9.4/media/css/jquery.dataTables.css
	META-INF/resources/webjars/datatables/1.9.4/media/css/jquery.dataTables_themeroller.css -->
</head>

