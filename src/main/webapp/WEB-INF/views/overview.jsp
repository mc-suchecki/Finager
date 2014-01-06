<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Finager</title>

        <!-- Finager own CSS file FIXME - not visible already! -->
        <spring:url value="/resources/css/finager.css" var="finagerCSS" />
        <link href="${finagerCSS}" rel="stylesheet" />

        <!-- Twitter Bootstrap -->
        <spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap.min.css" var="bootstrapCSS" />
        <link href="${bootstrapCSS}" rel="stylesheet" />
        <spring:url value="/webjars/bootstrap/3.0.3/css/bootstrap-theme.min.css" var="bootstrapCSS" />
        <link href="${bootstrapCSS2}" rel="stylesheet" />
</head>

<body>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Finager</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Overview</a></li>
				<li><a href="/accounts">Accounts</a></li>
				<li><a href="/transactions">Transactions</a></li>
				<li><a href="/reports">Reports</a></li>
				<li><a href="/settings">Settings</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, User! <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Settings</a></li>
                <li class="divider"></li>
                <li><a href="#">Log out</a></li>
              </ul>
            </li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Finager</a>
        </div>
        <div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Overview</a></li>
				<li><a href="/accounts">Accounts</a></li>
				<li><a href="/transactions">Transactions</a></li>
				<li><a href="/reports">Reports</a></li>
				<li><a href="/settings">Settings</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
        		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, User! <b class="caret"></b></a>
        		<ul class="dropdown-menu">
          			<li><a href="/settings">Settings</a></li>
          			<li class="divider"></li>
          			<li><a href="/logout">Log out</a></li>
        		</ul>
      		</li>
        </div><!--/.navbar-collapse -->
      </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
        <p><a class="btn btn-primary btn-lg" role="button">Button</a></p>
      </div>
    </div>

    <div class="container">

      <hr>

      <footer>
        <p>&copy; Maciej Suchecki 2014</p>
      </footer>
    </div> <!-- /container -->

	<!-- Bootstrap and jQuery JS included at the end to speed things up -->
	<spring:url value="/webjars/jquery/1.10.2/jquery.js" var="jQuery" />
	<script src="${jQuery}"></script>
	<spring:url value="/webjars/bootstrap/3.0.3/js/bootstrap.min.js" var="bootstrapJS" />
	<script src="${bootstrapJS}"></script>
</body>

</html>