<%@ taglib prefix="my" uri="/WEB-INF/locale.tld"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/locale.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<title><my:Locale value="page.tests.title" /></title>
	<link rel="stylesheet" type="text/css" href="../../styles/courses.css">
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-6 offset-md-3">
		<h2><my:Locale value="page.test.yours" /></h2>
	</div>
	<div class="col-6 offset-md-3">
		<table class="table table-striped table-dark">
			<thead>
			<tr>
				<th>
					<form method="post" action="controller">
						<input type="hidden" name="command" value="testCommand">
						<input type="hidden" name="subjectId" value="${subjectId}">
						<input type="hidden" name="sort" value="level">
						<button type="submit" class="btn btn-link">
							<my:Locale value="page.tests.level"/>
						</button>
					</form>
				</th>
				<th>
					<form method="post" action="controller">
						<input type="hidden" name="command" value="testCommand">
						<input type="hidden" name="subjectId" value="${subjectId}">
						<input type="hidden" name="sort" value="popularity">
						<button type="submit" class="btn btn-link">
							<my:Locale value="page.tests.popularity"/>
						</button>
					</form>
				</th>
				<th>
					<form method="post" action="controller">
						<input type="hidden" name="command" value="testCommand">
						<input type="hidden" name="subjectId" value="${subjectId}">
						<input type="hidden" name="sort" value="name">
						<button type="submit" class="btn btn-link">
							<my:Locale value="page.tests.passed.name"/>
						</button>
					</form>
				</th>
				<th><my:Locale value="page.tests.deadline" /></th>
				<th><my:Locale value="page.tests.score" /></th>
				<th><my:Locale value="page.tests.duration" /></th>
			</tr>
			</thead>
			<c:forEach items="${tests}" var="test">
				<thead>
						<tr>
							<td>
								<c:choose>
									<c:when test="${role == 'admin'}">
										<p>${test.level}</p>
									</c:when>
									<c:otherwise>
										<%--<p>${test.testLevel}</p> --%>
										<p>${test.level}</p>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${role == 'admin'}">
										<p>${test.popularity}</p>
									</c:when>
									<c:otherwise>
										<%--<p>${test.testPopularity}</p>--%>
										<p>${test.popularity}</p>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<%--<p>${test.testName}</p>  --%>
								<form method="post" action="controller">
									<c:choose>
										<c:when test="${role == 'admin'}">
											<input type="hidden" name="testId" value="${test.id}">
										</c:when>
										<c:otherwise>
											<%--<input name="testId" value="${test}">  --%>
											<%--<input type="hidden" name="testId" value="${test.testId}">--%>
											<input type="hidden" name="testId" value="${test.id}">
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="command" value="goToSolveTestCommand">
									<c:choose>
										<c:when test="${role == 'admin'}">
											<button type="submit" class="btn btn-link">${test.name}</button>
										</c:when>
										<c:otherwise>
											<form method="post" action="controller">
												<c:choose>
													<c:when test="${role == 'admin'}">
														<input type="hidden" name="testId" value="${test.id}">
													</c:when>
													<c:otherwise>
														<%--<input type="hidden" name="testId" value="${test.testId}">--%>
														<input type="hidden" name="testId" value="${test.id}">
													</c:otherwise>
												</c:choose>
												<input type="hidden" name="command" value="goToSolveTestCommand">
												<c:choose>
													<c:when test="${role == 'admin'}">
														<button type="submit" class="btn btn-link">${test.name}</button>
													</c:when>
													<c:otherwise>
														<%--<button type="submit" class="btn btn-success profile">${test.testName}</button>--%>
														<button type="submit" class="btn btn-link">${test.name}</button>
													</c:otherwise>
												</c:choose>
											</form>
										</c:otherwise>
									</c:choose>
								</form>
							</td>
							<td>
								<p>${test.deadline}</p>
							</td>
							<td>
								<p>${test.score}</p>
							</td>
							<td>
								<c:choose>
									<c:when test="${role == 'admin'}">
										<p>${test.duration}</p>
									</c:when>
									<c:otherwise>
										<%--<p>${test.testDuration}</p>--%>
										<p>${test.duration}</p>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
				</thead>
			</c:forEach>
		</table>
	</div>
	<br/>
</body>
</html>
