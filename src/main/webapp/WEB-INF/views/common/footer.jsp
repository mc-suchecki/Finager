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
<spring:url value="/webjars/jquery-ui/1.10.3/ui/jquery.ui.core.js" var="jQueryUiCore"/>
<script src="${jQueryUiCore}"></script>
<spring:url value="/webjars/jquery-ui/1.10.3/ui/jquery.ui.datepicker.js" var="jQueryUiDatePicker"/>
<script src="${jQueryUiDatePicker}"></script>