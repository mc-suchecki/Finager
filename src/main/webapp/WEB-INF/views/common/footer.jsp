<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container">
	<hr>
	<footer>
		<p>&copy; Maciej Suchecki 2014</p>
	</footer>
</div> <!-- /container -->

<!-- Bootstrap and jQuery JS included at the end to speed things up -->
<spring:url value="/webjars/jquery/1.10.2/jquery.js" var="jQuery" />
<script src="${jQuery}"></script>
<spring:url value="/webjars/bootstrap/3.0.3/js/bootstrap.min.js" var="bootstrapJS" />
<script src="${bootstrapJS}"></script>