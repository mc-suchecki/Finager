<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/finager">Finager</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:choose>
					<c:when test='${activeView == "overview"}'>
						<li class="active"><a href="/finager/overview/">Overview</a></li>
						<li><a href="/finager/accounts">Accounts</a></li>
						<li><a href="/finager/transactions">Transactions</a></li>
						<li><a href="/finager/reports">Reports</a></li>
    				</c:when>
					<c:when test='${activeView == "accounts"}'>
						<li><a href="/finager/overview/">Overview</a></li>
						<li class="active"><a href="/finager/accounts">Accounts</a></li>
						<li><a href="/finager/transactions">Transactions</a></li>
						<li><a href="/finager/reports">Reports</a></li>
    				</c:when>
					<c:when test='${activeView == "transactions"}'>
						<li><a href="/finager/overview/">Overview</a></li>
						<li><a href="/finager/accounts">Accounts</a></li>
						<li class="active"><a href="/finager/transactions">Transactions</a></li>
						<li><a href="/finager/reports">Reports</a></li>
    				</c:when>
					<c:when test='${activeView == "reports"}'>
						<li><a href="/finager/overview/">Overview</a></li>
						<li><a href="/finager/accounts">Accounts</a></li>
						<li><a href="/finager/transactions">Transactions</a></li>
						<li class="active"><a href="/finager/reports">Reports</a></li>
    				</c:when>
					<c:otherwise>
						<li><a href="/finager/overview/">Overview</a></li>
						<li><a href="/finager/accounts">Accounts</a></li>
						<li><a href="/finager/transactions">Transactions</a></li>
						<li><a href="/finager/reports">Reports</a></li>
 					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, ${username}! <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/finager/settings">Settings</a></li>
                <li class="divider"></li>
                <li><a href="<c:url value="/j_spring_security_logout" />">Log out</a></li>
              </ul>
            </li>
			</ul>
		</div>
	</div>
</div>