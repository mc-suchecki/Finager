<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<div class="container">

	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			<!-- TODO: fix the spring security message -->
			<strong>Oh snap!</strong> ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} Please try again.
		</div>
	</c:if>

 	<c:if test="${not empty loggedOut}">
		<div class="alert alert-success">
			<strong>Well done!</strong> You are successfully logged out.
		</div>
	</c:if>
 
	<form class="form-signin" role="form" method='POST' action="<c:url value='j_spring_security_check' />" >
		<h2 class="form-signin-heading">Finager - Log in</h2>
		<input name="j_username" type="text" class="form-control" placeholder="Email address" required autofocus>
		<input name="j_password" type="password" class="form-control" placeholder="Password" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
	</form>

	</div>
	<!-- /container -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>
