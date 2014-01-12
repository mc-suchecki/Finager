<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

				<form class="form-signin" role="form" method='POST' action="submit">
					<input name="name" type="text" class="form-control" placeholder="Name" required autofocus> <br>
					<input name="surname" type="text" class="form-control" placeholder="Surname" required> <br>
					<input name="email" type="text" class="form-control" placeholder="E-mail address" required> <br>
					<input name="password" type="password" class="form-control" placeholder="Password" required> <br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
					<span class="help-block">or <a href="<c:url value="/login" />">Log in</a></span>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

</body>

</html>
