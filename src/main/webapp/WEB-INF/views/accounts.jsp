<%@ include file="/WEB-INF/views/common/head.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

	<!-- View header -->
	<div class="jumbotron">
		<div class="container">
			<h1>Accounts</h1>
		</div>
	</div>

	<div class="container">

		<!-- Accounts table -->
		<div class="row">
			<c:if test="${not empty accountAdded}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<strong>Well done!</strong> Your new account was successfully created!
				</div>
			</c:if>
			<c:if test="${not empty accountsList}">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">Name</th>
								<th class="text-center">Type</th>
								<th class="text-center">Balance</th>
								<th class="text-center">Currency</th>
								<th class="text-center">Actions</th>
							<tr>
						</thead>
						<tbody>
							<c:forEach var="account" items="${accountsList}">
								<tr>
									<td class="text-center">${account.name}</td>
									<td class="text-center">${account.type}</td>
									<td class="text-right">${account.balance}</td>
									<td>${account.currency}</td>
									<td class="text-center">
										<div class="btn-group text-center">
											<button type="button" class="btn btn-default btn-sm">
												<span class="glyphicon glyphicon-cog"></span> Edit
											</button>
											<button type="button" class="btn btn-default btn-sm">
												<span class="glyphicon glyphicon-list"></span> Transactions
											</button>
											<button type="button" class="btn btn-default btn-sm">
												<span class="glyphicon glyphicon-remove"></span> Remove
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${empty accountsList}">
				<div class="alert alert-info">
					<strong>Heads up!</strong> It seems like you does not have any accounts yet. Please use the 'Add new account'
					button to create one.
				</div>
			</c:if>
		</div>

		<!-- Footer with button and total sum -->
		<div class="row">
			<div class="col-md-6">
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addNewAccount">
					<span class="glyphicon glyphicon-plus"></span> Add new account
				</button>
			</div>
			<div class="col-md-6 text-right">
				<c:if test="${not empty accountsList}">
					<h3>Total: ${totalCash}</h3>
				</c:if>
			</div>
		</div>

	</div>

	<!-- Add new account pop-up -->
	<div class="modal fade" id="addNewAccount" tabindex="-1" role="dialog" aria-labelledby="addNewAccountLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="form" method="POST" modelAttribute="AccountFO" class="form-signin" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="addNewAccountLabel">Add new account</h4>
					</div>
					<div class="modal-body">
						<spring:bind path="*">
							<c:if test="${status.error}">
								<div class="alert alert-danger">
									<strong>Oh snap!</strong> Form has errors. Please try again.
								</div>
							</c:if>
						</spring:bind>
						<fieldset>
							<legend>Basic information</legend>
							<c:set var="nameErrors"><form:errors path="name"/></c:set>
    						<div class="form-group ${not empty nameErrors ? 'has-error' : ''}">
								<label>Account name</label>
								<form:errors path="name" cssClass="control-label" />
								<form:input path="name" type="text" class="form-control" placeholder="Enter account name here"
									autofocus="autofocus" />
							</div>
							<div class="form-group">
								<label>Account type</label>
								<form:select class="form-control" path="type" items="${accountTypesMap}" />
							</div>
						</fieldset>
						<hr />
						<fieldset>
							<legend>Monetary data</legend>
							<c:set var="balanceErrors"><form:errors path="balance"/></c:set>
    						<div class="form-group ${not empty balanceErrors ? 'has-error' : ''}">
								<label>Initial balance</label>
								<form:input path="balance" class="form-control" placeholer="0.00" />
							</div>
							<div class="form-group">
								<label>Currency</label>
								<form:select class="form-control" path="currency" items="${currenciesList}" />
							</div>
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<form:button type="submit" class="btn btn-primary">Save changes</form:button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

</body>

</html>