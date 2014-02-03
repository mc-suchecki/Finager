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
			<div class="col-md-8 col-md-offset-1">
				<div class="row">
					<div class="chartContainer col-md-7">
						<canvas id="myChart" width="400" height="400"></canvas>
					</div>
					<ul id="chartLegend" class="col-md-3 list-group"></ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/includes.jsp"%>

	<spring:url value="/webjars/chartjs/26962ce/Chart.min.js" var="chartjs" />
	<script src="${chartjs}"></script>

	<script>
		function legend(parent, data) {
			var datas = data.hasOwnProperty('datasets') ? data.datasets : data;

			datas.forEach(function(d) {
				var container = document.createElement('li');
				container.className = 'list-group-item chart-legend';

				var title = document.createElement('span');
				title.className = 'chart-title';
				title.style.borderColor = d.hasOwnProperty('strokeColor') ? d.strokeColor : d.color;
				title.style.borderStyle = 'solid';
				container.appendChild(title);
				parent.appendChild(container);

				var text = document.createTextNode(d.title + " - " + d.value);
				title.appendChild(text);
			});
		}
		$(document).ready(function() {
			// init bootstrap-datepicker
			$('.input-daterange').datepicker({
				format: "dd/mm/yyyy"
			});

			// mockup data - TODO remove
			var data = [ {
				value : 30,
				color : "#F38630",
				title : "Food"
			}, {
				value : 50,
				color : "#69D2E7",
				title : "Bills"
			}, {
				value : 10,
				color : "#E0E4CC",
				title : "Other"
			}, {
				value : 20,
				color : "#4892EF",
				title : "Hobby"
			} ]
			var ctx = $("#myChart").get(0).getContext("2d");
			var ctx_legend = $("#chartLegend").get(0);
			var myNewChart = new Chart(ctx).Pie(data);
			legend(ctx_legend, data);
		});
	</script>
</body>

</html>