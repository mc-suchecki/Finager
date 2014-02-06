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
						<canvas id="chart" width="400" height="400"></canvas>
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

		// function downloading filtered data for chart
		function updateChart() {
			var filterValues = {
				accountFilter : $('#accountFilter').val(),
				typeFilter : $('typeFilter').val(),
				startDateFilter : $('startDateFilter').val(),
				endDateFilter : $('endDateFilter').val()
			};
			$.ajax({
  	        	url: "${pageContext.request.contextPath}/reports/getData.json",
  	        	data: JSON.stringify(filterValues),
  	        	type: "POST",
  	
  	        	beforeSend: function(xhr) {
  	            	xhr.setRequestHeader("Accept", "application/json");
  	            	xhr.setRequestHeader("Content-Type", "application/json");
  	        	},
  	        	success: function(response) {
					var chart = $("#chart").get(0).getContext("2d");
					var chartLegend = $("#chartLegend");
					var theChart = new Chart(chart).Pie(response);
					chartLegend.empty();
					legend(chartLegend.get(0), response);
  	        	}
  	    	});
		}

		$(document).ready(function() {
			// init bootstrap-datepicker
			$('.input-daterange').datepicker({
			    format: "yyyy-mm-dd",
			    todayBtn: "linked",
			    autoclose: true
			});

			// add events that update transactions table after changing filters value
			$("#accountFilter").change(function() { updateChart(); });
			$("#typeFilter").change(function() { updateChart(); });
			$("#startDateFilter").change(function() { updateChart(); });
			$("#endDateFilter").change(function() { updateChart(); });
			
			updateChart();
		});
	</script>
</body>

</html>