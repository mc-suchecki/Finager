<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

	<!-- View header -->
	<div class="jumbotron">
		<div class="container">
			<h1>Transactions</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%@ include file="/WEB-INF/views/common/filter-form.jsp"%>
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#addNewTransaction">
					<span class="glyphicon glyphicon-plus"></span> Add new transaction
				</button>
			</div>
			<div class="col-md-9">
				<!-- Transactions table mockup -->
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Account</th>
								<th>Type</th>
								<th>Description</th>
								<th>Date</th>
								<th>Value</th>
								<th>Currency</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<td>Regular account</td> <td>Income</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>100</td> <td>PLN</td> <td>TODO</td>
						</tr>
						<tr>
							<td>Erasmus account</td> <td>Outcome</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>50</td> <td>EUR</td> <td>TODO</td>
						</tr>
						<tr>
							<td>Pocket money</td> <td>Income</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>10</td> <td>PLN</td> <td>TODO</td>
						</tr>
						<tr>
							<td>Regular account</td> <td>Outcome</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>1000</td> <td>PLN</td> <td>TODO</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Add new transaction pop-up -->
	<div class="modal fade" id="addNewTransaction" tabindex="-1"
		role="dialog" aria-labelledby="addNewTransactionLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addNewTransactionLabel">Add new transaction</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
	</div> <!-- /.modal -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>