<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

	<!-- View header -->
	<div class="jumbotron">
		<div class="container">
			<h1>Accounts</h1>
		</div>
	</div>

	<div class="container">

		<!-- Accounts table mockup -->
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Balance</th>
						<th>Currency</th>
						<th>Actions</th>
					<tr>
				</thead>

				<tbody>
				<tr>
					<td>Regular account</td>
					<td>Bank account</td>
					<td>10 000</td>
					<td>PLN</td>
					<td>todo</td>
				</tr>
				<tr>
					<td>Pocket money</td>
					<td>Cash</td>
					<td>100</td>
					<td>PLN</td>
					<td>todo</td>
				</tr>
				<tr>
					<td>Erasmus account</td>
					<td>Bank account</td>
					<td>1 000</td>
					<td>EUR</td>
					<td>todo</td>
				</tr>
				<tr>
					<td>Visa</td>
					<td>Credit card</td>
					<td>- 500</td>
					<td>PLN</td>
					<td>todo</td>
				</tr>
				</tbody>
			</table>

			<!-- Accounts list - TODO!
<datatables:table id="accounts" data="${vets.vetList}" cdn="true" row="vet" theme="bootstrap2" cssClass="table table-striped" paginate="false" info="false">
<datatables:column title="Name">
<c:out value="${vet.firstName} ${vet.lastName}"></c:out>
</datatables:column>
<datatables:column title="Specialties">
<c:forEach var="specialty" items="${vet.specialties}">
<c:out value="${specialty.name}"/>
</c:forEach>
<c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
</datatables:column>
</datatables:table> -->
		</div>

		<!-- Footer with button and total sum -->
		<div class="row">
			<div class="col-md-6">
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#addNewAccount">
					<span class="glyphicon glyphicon-plus"></span> Add new account
				</button>
			</div>
			<div class="col-md-6 text-right">
				<h3>Total: 10 600 PLN</h3>
			</div>
		</div>

	</div>

	<!-- Add new account pop-up -->
	<div class="modal fade" id="addNewAccount" tabindex="-1" role="dialog"
		aria-labelledby="addNewAccountLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addNewAccountLabel">Add new
						account</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
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