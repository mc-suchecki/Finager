<%@ include file="/WEB-INF/views/common/head.jsp"%>

<body>

	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

	<!-- View header -->
	<div class="jumbotron">
		<div class="container">
			<h1>Reports</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%@ include file="/WEB-INF/views/common/filter-form.jsp"%>
			</div>
			<div class="col-md-9">
				<p>This is a place for charts. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

</body>

</html>