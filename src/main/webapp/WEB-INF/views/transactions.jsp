<%@ include file="/WEB-INF/views/common/head.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					data-target="#addNewTransactionModal">
					<span class="glyphicon glyphicon-plus"></span> Add new transaction
				</button>
			</div>
			<div class="col-md-9">
				<!-- Transaction added prompt -->
				<div class="alert alert-success alert-dismissable" id="transactionAddedPrompt">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<strong>Well done!</strong> Your transaction was successfully created!
				</div>
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
	<div class="modal fade" id="addNewTransactionModal" tabindex="-1"
		role="dialog" aria-labelledby="addNewTransactionLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="addNewTransactionForm" method="POST" modelAttribute="transactionFO" class="form-signin" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="addNewTransactionLabel">Add new transaction</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger">
							<strong>Oh snap!</strong> Form has errors. Please try again.
						</div>
						<fieldset>
							<div class="form-group">
								<label>Transaction type</label>
								<select class="form-control" id="type" autofocus>
									<option class="form-control" value="income">Income</option>
									<option class="form-control" value="expense">Expense</option>
									<option class="form-control" value="transfer">Transfer</option>
								</select>
							</div>
							<div class="form-group" id="accountFromIDGroup">
								<label>Account from</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<form:select id="accountFrom" class="form-control" path="accountFromID" items="${userAccountsMap}" />
							</div>
							<div class="form-group" id="accountToIDGroup">
								<label>Account to</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<form:select id="accountTo" class="form-control" path="accountToID" items="${userAccountsMap}" />
							</div>
						</fieldset>
							
						<hr />

						<fieldset>
							<div class="form-group" id="valueGroup">
								<label>Transferred value</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<form:input type="number" path="value" class="form-control" id="value" placeholder="0" step="any"/>
							</div>
							<div class="form-group" id="categoryIDGroup">
								<label>Category</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<!-- creates two-level Categories tree in dropdown using optgroups -->
								<form:select multiple="single" path="categoryID" class="form-control" id="categoryID">
         							<!-- categoriesMap contains entries like: (parentName, childrenMap) -->
          							<c:forEach var="childrenMap" items="${categoriesMap}">
           								<optgroup label="${childrenMap.key}">
           									<!-- childrenMap contains entries like: (childrenID, childrenName) -->
           									<c:forEach var="child" items="${childrenMap.value}">        
           										<form:option value="${child.key}">${child.value}</form:option>
           									</c:forEach>
           								</optgroup>
          							</c:forEach>        
        						</form:select>
							</div>
							<div class="form-group" id="dateGroup">
								<label>Transaction date</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<div class="input-group date">
									<form:input type="text" class="form-control" path="date" id="date"></form:input>
									<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			  					</div>
							</div>
						</fieldset>

						<hr />

						<fieldset>
							<div class="form-group" id="descriptionGroup">
								<label>Description (optional)</label>
								<div class="control-label"></div> <!-- errors are put here using JS -->
								<form:input path="description" type="text" class="form-control" placeholder="Enter description here" id="description" />
							</div>
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<form:button type="submit" class="btn btn-primary">Save changes</form:button>
					</div>
				</form:form>
			</div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
	</div> <!-- /.modal -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/includes.jsp"%>
	
	<script>
		// add event that convert data to JSON format when user clicks submit button
  		$('#addNewTransactionForm').submit(function(event) {
  	      	var transaction = new Object();
  	    	transaction.date = $('#date').val();
			transaction.value = $('#value').val();
  	    	transaction.categoryID = $('#categoryID').val();
  	      	transaction.accountToID = $('#accountTo').val();
  	      	transaction.accountFromID = $('#accountFrom').val();
  	    	transaction.description = $('#description').val();

  	    	$.ajax({
  	        	url: "${pageContext.request.contextPath}/transactions/create.json",
  	        	data: JSON.stringify(transaction),
  	        	type: "POST",
  	
  	        	beforeSend: function(xhr) {
  	            	xhr.setRequestHeader("Accept", "application/json");
  	            	xhr.setRequestHeader("Content-Type", "application/json");
  	        	},
  	        	success: function(response) {
  	        		// clear error prompts and CSS classes
  	        		$('#addNewTransactionForm').find('.form-group').removeClass('has-error');
  					$('#addNewTransactionForm').find('.control-label').empty();
  					$('#addNewTransactionForm').find('.alert').hide();
  							
  	                // if there are errors - display them
  					if (response.success == false) {
  						for (var i = 0; i < response.result.length; i++) {
  							var item = response.result[i];
  							var $controlGroup = $('#' + item.field + 'Group');
  							$controlGroup.addClass('has-error');
  							$controlGroup.find('.control-label').html(item.defaultMessage);
  						}
  					} else {		 // if there are no errors
  	                	$('#addNewTransactionModal').modal('hide');
						$('#transactionAddedPrompt').show('slow');
  	                	// TODO refresh transactions list
  	                	// TODO clear filter values
  					}
  	        	}
  	    	});
  	 
  	    	event.preventDefault();
  	  	});

		$(document).ready(function() {
			// enable and disable accountTo/accountFrom fields
			// depending on Transaction type selected in the form
			var $transactionType = $('#type'), $accountTo = $('#accountTo'), $accountFrom = $('#accountFrom');
			$transactionType.change(function () {
    			if ($transactionType.val() == 'income') {
        			$accountTo.removeAttr('disabled');
        			$accountFrom.attr('disabled', 'disabled').val('');
    			} else if ($transactionType.val() == 'expense') {
        			$accountTo.attr('disabled', 'disabled').val('');
        			$accountFrom.removeAttr('disabled');
    			} else {
        			$accountTo.removeAttr('disabled');
        			$accountFrom.removeAttr('disabled');
    			}
			}).trigger('change');
			
			// hide prompts
			$('#transactionAddedPrompt').hide();
  			$('#addNewTransactionForm').find('.alert').hide();

			// init bootstrap-datepickers
			$('.input-daterange').datepicker({
			    format: "yyyy-mm-dd",
			    todayBtn: "linked",
			    autoclose: true
			});
			$('.date').datepicker({
		    	format: "yyyy-mm-dd",
		    	todayBtn: "linked",
		    	autoclose: true
			});
		});
	</script>

</body>

</html>