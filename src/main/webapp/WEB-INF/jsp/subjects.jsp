<%@ taglib prefix="my" uri="/WEB-INF/locale.tld"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/locale.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title><my:Locale value="page.subjects.title" /></title>
<link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-2 offset-md-5">
		<table class="table table-striped table-dark">
			<thead>
			<tr>
				<th><my:Locale value="page.subject.yours" /></th>
			</tr>
			</thead>
			<c:forEach items="${subjects}" var="subject">
				<div>
					<form method="post">
						<tbody>
						<tr>
							<td>
								<div>
									<form method="post" action="controller">
										<input type="hidden" name="subjectId" value="${subject.id}">
										<input type="hidden" name="command" value="testCommand">
										<button type="submit" class="btn btn-link">${subject.name}</button>
									</form>
								</div>
							</td>
						</tr>
						</tbody>
					</form>
				</div>
			</c:forEach>
		</table>
	</div>
</body>
</html>
