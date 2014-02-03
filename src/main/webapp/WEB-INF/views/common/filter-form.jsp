<!-- TODO - delete mockup and add proper form -->
<form role="form">
	<fieldset>
		<div class="form-group">
			<label for="account">Account</label>
			<select class="form-control">
				<option value="1">Bank account</option>
				<option value="2">Erasmus account</option>
			</select>
		</div>
		<div class="form-group">
			<label for="type">Type</label>
			<select class="form-control">
				<option value="1">Income</option>
				<option value="2">Expense</option>
				<option value="3">Transfer</option>
			</select>
		</div>
		<div class="form-group">
			<label>Time period</label> <br>
			<div class="input-daterange input-group" id="filterDatepicker">
				<input type="text" class="input-sm form-control" name="start" />
				<span class="input-group-addon">to</span>
				<input type="text" class="input-sm form-control" name="end" />
			</div>
		</div>
	</fieldset>
</form>