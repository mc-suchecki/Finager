<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<div class="container spacer">
		<div class="row">
			<div class="col-md-6">
				<img alt="Logo" height="400px" width="100%" />
			</div>
			<div class="col-md-4 col-md-offset-1">

				<h2 class="form-signin-heading">Finager - Log in</h2>

				<br>

				<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<!-- TODO: fix the spring security message -->
						<strong>Oh snap!</strong> ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} Please try again.
					</div>
				</c:if>

				<c:if test="${not empty loggedOut}">
					<div class="alert alert-success">
						<strong>Well done!</strong> You have been <br> successfully logged out.
					</div>
				</c:if>

				<form class="form-signin" role="form" method='POST' action="<c:url value='j_spring_security_check' />">
					<input name="j_username" type="text" class="form-control" placeholder="E-mail address" required autofocus>
					<br> <input name="j_password" type="password" class="form-control" placeholder="Password" required> <br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
					<span class="help-block">or <a href="<c:url value="/register" />">Register</a></span>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

</body>

</html>
