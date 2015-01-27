<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<div class="container spacer">
		<div class="row">
			<div class="col-md-6">
				<img alt="Logo" height="400px" width="100%" />
			</div>
			<div class="col-md-4 col-md-offset-1">

				<h2 class="form-signin-heading">Finager - New account</h2>

				<br>

				<form:form id="form" method="POST" modelAttribute="UserFO" class="form-signin" role="form">
					<spring:bind path="*">
						<c:if test="${status.error}">
							<div class="alert alert-danger">
								<strong>Oh snap!</strong> Form has errors. Please try again.
							</div>
						</c:if>
					</spring:bind>

					<c:set var="nameErrors"><form:errors path="name"/></c:set>
    				<div class="form-group ${not empty nameErrors ? 'has-error' : ''}">
						<form:errors path="name" cssClass="control-label" />
						<form:input path="name" type="text" class="form-control" placeholder="Name" autofocus="autofocus" />
					</div>

					<c:set var="surnameErrors"><form:errors path="surname"/></c:set>
    				<div class="form-group ${not empty surnameErrors ? 'has-error' : ''}">
						<form:errors path="surname" cssClass="control-label" />
						<form:input path="surname" type="text" class="form-control" placeholder="Surname" />
					</div>

					<c:set var="emailErrors"><form:errors path="email"/></c:set>
    				<div class="form-group ${not empty emailErrors ? 'has-error' : ''}">
						<form:errors path="email" cssClass="control-label" />
						<form:input path="email" type="text" class="form-control" placeholder="E-mail address" />
					</div>

					<c:set var="passwordErrors"><form:errors path="password"/></c:set>
    				<div class="form-group ${not empty passwordErrors ? 'has-error' : ''}">
						<form:errors path="password" cssClass="control-label" />
						<form:input path="password" type="password" class="form-control" placeholder="Password" />
					</div>

					<form:button class="btn btn-lg btn-primary btn-block" type="submit">Register</form:button>
					<span class="help-block">or <a href="<c:url value="/login" />">Log in</a></span>
				</form:form>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

</body>

</html>
