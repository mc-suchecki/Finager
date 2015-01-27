<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form>
	<fieldset>
		<div class="form-group">
			<label for="accountFilter">Account</label>
			<select id="accountFilter" class="form-control" >
				<option value="">All accounts</option>
				<c:forEach var="account" items="${userAccountsMap}">
					<option value="${account.key}">${account.value}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="typeFilter">Type</label>
			<select class="form-control" id="typeFilter">
				<option value="">All types</option>
				<option value="1">Income</option>
				<option value="2">Expense</option>
				<option value="3">Transfer</option>
			</select>
		</div>
		<div class="form-group">
			<label>Time period</label> <br>
			<div class="input-daterange input-group" id="dateFilter">
				<input type="text" class="input-sm form-control" name="start" id="startDateFilter" />
				<span class="input-group-addon">to</span>
				<input type="text" class="input-sm form-control" name="end" id="endDateFilter" />
			</div>
		</div>
	</fieldset>
</form>