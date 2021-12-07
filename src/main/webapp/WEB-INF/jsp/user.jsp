<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/locale.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<meta charset="UTF-8">
	<title><my:Locale value="page.user.title"/></title>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-6 offset-md-2">
		<h1><my:Locale value="page.user.hello"/> ${user.name}!</h1>
	</div>
	<div class="col-6 offset-md-2">
		<h5><my:Locale value="page.user.role"/> ${user.role.name}</h5>
	</div>
	<div class="col-6 offset-md-2">
		<h5><my:Locale value="page.tests.titlemessage" /></h5>
	</div>

	<div class="col-6 offset-md-2">
		<c:choose>
			<c:when test="${passedTests.size() == 0}">
				<p><my:Locale value="page.user.passedtest.no" /></p>
			</c:when>
			<c:otherwise>
				<table class="table table-striped table-dark">
					<thead>
					<tr>
						<th><my:Locale value="page.tests.subjectname" /></th>
						<th><my:Locale value="page.tests.level" /></th>
						<th><my:Locale value="page.tests.popularity" /></th>
						<th><my:Locale value="page.tests.passed.name" /></th>
						<th><my:Locale value="page.tests.deadline" /></th>
						<th><my:Locale value="page.tests.score" /></th>
						<th><my:Locale value="page.tests.passed.date" /></th>
						<th><my:Locale value="page.tests.passed.score" /></th>
					</tr>
					</thead>
					<c:if test="${passedTests.size() != 0}">
						<c:forEach items="${passedTests}" var="passedTest">
							<tbody>
							<tr>
								<td>
									<p>${passedTest.subjectName}</p>
								</td>
								<td>
									<p>${passedTest.testLevel}</p>
								</td>
								<td>
									<p>${passedTest.testPopularity}</p>
								</td>
								<td>
									<p>${passedTest.testName}</p>
								</td>
								<td>
									<p>${passedTest.deadline}</p>
								</td>
								<td>
									<p>${passedTest.testScore}</p>
								</td>
								<td>
									<p>${passedTest.userPassedDate}</p>
								</td>
								<td>
									<p>${passedTest.userScore}</p>
								</td>
							</tr>
							</tbody>
						</c:forEach>
					</c:if>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<br/>
	<div class="col-6 offset-md-2">
		<form method="post" action="controller">
			<input type="hidden" name="command" value="subjectCommand">
			<button type="submit" class="btn btn-success profile"><my:Locale value="page.subject.name"/></button>
		</form>
	</div>
</body>
</html>