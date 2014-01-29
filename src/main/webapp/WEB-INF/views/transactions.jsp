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
							<td>Regular account</td> <td>Income</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>100</td> <td>PLN</td>
							<td><span class="glyphicon glyphicon-edit"></span> <span class="glyphicon glyphicon-remove"></span></td>
						</tr>
						<tr>
							<td>Erasmus account</td> <td>Outcome</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>50</td> <td>EUR</td>
							<td><span class="glyphicon glyphicon-edit"></span> <span class="glyphicon glyphicon-remove"></span></td>
						</tr>
						<tr>
							<td>Pocket money</td> <td>Income</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>10</td> <td>PLN</td>
							<td><span class="glyphicon glyphicon-edit"></span> <span class="glyphicon glyphicon-remove"></span></td>
						</tr>
						<tr>
							<td>Regular account</td> <td>Outcome</td> <td>Nothing to see here, move around.</td> <td>03-02-2014</td> <td>1000</td> <td>PLN</td>
							<td><span class="glyphicon glyphicon-edit"></span> <span class="glyphicon glyphicon-remove"></span></td>
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
				<div class="modal-body">
					<form id="form" method="post" role="form">
						<fieldset>
							<legend>Basic information</legend>

							<div class="form-group">
								<label> Transaction type </label> <select class="form-control" path="type">
									<option class="form-control" value="transfer">Transfer</option>
									<option class="form-control" value="income">Income</option>
									<option class="form-control" value="outcome">Outcome</option>
								</select>
							</div>

							<div class="form-group">
								<label> Account from </label> <select class="form-control" path="from">
									<option class="form-control" value="bank">Bank account 1</option>
								</select>
							</div>

							<div class="form-group">
								<label> Account to </label> <select class="form-control" path="to">
									<option class="form-control" value="bank">Bank account 2</option>
								</select>
							</div>

							<div class="form-group">
								<label> Transferred value </label> <input path="currency" class="form-control" placeholer="0.00"/>
							</div>

						</fieldset>
						<hr />
						<fieldset>
							<legend>Additional information</legend>
							<div class="form-group">
								<!-- <label> Category </label> <select class="form-control" path="category">
									<option class="form-control" value="food">Food and drinks</option>
								</select>-->
							</div>
							<div class="form-group">
                                        <!-- <label> Description </label>
                                        <textarea class="form-control" path="description" /> -->
                                </div>        
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
	</div> <!-- /.modal -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/includes.jsp"%>
	
	<script>
		$(document).ready(function() {
			//TODO uncomment this after solving the problem with bootstrap-datepicker
			//$('.input-daterange').datepicker({});
		});
	</script>

</body>

</html>