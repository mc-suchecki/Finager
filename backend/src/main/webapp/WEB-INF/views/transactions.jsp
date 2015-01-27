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
				<!-- Transactions data table -->
				<div class="row">
					<table class="table table-striped" class="display" id="transactionsDataTable"></table>
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
		// function populating DataTable with transactions
  	    // TODO check if DataTables can't handle data without conv.
		function populateTransactionDatatable(transactions) {
			var data = [];
			for (var i = 0; i < transactions.length; i++) {
				var row = transactions[i];
				data.push( [ row.accountName, row.date, row.value, row.currencyCode, row.categoryName, row.description] );
			}

			$('#transactionsDataTable').dataTable().fnDestroy();
            $('#transactionsDataTable').dataTable( {
				"bSort" : false,
				"aaData": data
			} );   
		}
		
		// function downloading filtered transaction list from the server
		function updateTransactionsTable() {
			var filterValues = {
				accountFilter : $('#accountFilter').val(),
				typeFilter : $('typeFilter').val(),
				startDateFilter : $('startDateFilter').val(),
				endDateFilter : $('endDateFilter').val()
			};
			$.ajax({
  	        	url: "${pageContext.request.contextPath}/transactions/get.json",
  	        	data: JSON.stringify(filterValues),
  	        	type: "POST",
  	
  	        	beforeSend: function(xhr) {
  	            	xhr.setRequestHeader("Accept", "application/json");
  	            	xhr.setRequestHeader("Content-Type", "application/json");
  	        	},
  	        	success: function(response) {
					// refresh transactions table
					populateTransactionDatatable(response);
  	        	}
  	    	});
		}
		
		// add events that update transactions table after changing filters value
		$("#accountFilter").change(function() { updateTransactionsTable(); });
		$("#typeFilter").change(function() { updateTransactionsTable(); });
		$("#startDateFilter").change(function() { updateTransactionsTable(); });
		$("#endDateFilter").change(function() { updateTransactionsTable(); });

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
  						// hide modal and show prompt
  	                	$('#addNewTransactionModal').modal('hide');
						$('#transactionAddedPrompt').show('slow');

  	                	// clear filter values
						$('#accountFilter').val( $('#accountFilter').prop('defaultSelected') );
						$('#typeFilter').val( $('#typeFilter').prop('defaultSelected') );
						$('#startDateFilter').val("");
						$('#endDateFilter').val("");

						// refresh transactions table
						populateTransactionDatatable(response.result);
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
			
			// init transactions DataTable
			$('#transactionsDataTable').dataTable( {
				"bSort" : false,
				"bDestroy" : true,
				"aoColumns": [
    				{ "sTitle": "Account name" },
    				{ "sTitle": "Date" },
    				{ "sTitle": "Value" },
					{ "sTitle": "Currency" },
    				{ "sTitle": "Category" },
    				{ "sTitle": "Description" }
				]
			} );   

			// download transactions using AJAX
			updateTransactionsTable();

		});
	</script>

</body>

</html>