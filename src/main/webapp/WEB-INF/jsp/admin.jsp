<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="my" uri="/WEB-INF/locale.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable( {
                "pagingType": "full_numbers"
            } );
        } );
    </script>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <title><my:Locale value="page.admin.title"/></title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="col-5 offset-md-3">
    <h4>
        <my:Locale value="page.admin.subjects.all"/>
    </h4>
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th><my:Locale value="page.admin.subjects.name"/></th>
            <th><my:Locale value="page.admin.subjects.edit"/></th>
            <th><my:Locale value="page.admin.subjects.delete"/></th>
        </tr>
        </thead>
        <c:forEach items="${subjects}" var="subject">
        <tbody>
            <tr>
                <td>
                    <form action="controller" method="post">
                        <input type="hidden" name="subject_id" value="${subject.id}">
                        <input type="text" id="subject_name" name="subject_name" value="${subject.name}">
                </td>
                <td>
                    <input type="hidden" name="command" value="updateSubjectCommand">
                    <button type="submit" class="spacebtn btn btn btn-primary">
                        <my:Locale value="page.admin.subjects.edit"/>
                    </button>
                    </form>
                </td>
                <td>
                    <form>
                        <input type="hidden" name="subject_id" value="${subject.id}">
                        <input type="hidden" name="command" value="deleteSubjectCommand">
                        <button type="submit" class="spacebtn btn btn-danger">
                            <my:Locale value="page.admin.subjects.delete"/>
                        </button>
                    </form>
                </td>
            </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
<div class="col-6 offset-md-4">
    <c:if test="${errorMessage!=\"\"}">
        <div>
            <p>${errorMessage}</p>
        </div>
    </c:if>
</div>
<div class="col-6 offset-md-4">
    <h4>
        <my:Locale value="page.admin.subjects.newcreate"/>
    </h4>
    <form method="post" action="controller">
        <input name="name" value="${subject.name}"
               placeholder="<my:Locale value="page.admin.subjects.newcreate"/>">
        <input type="hidden" name="command" value="createSubjectCommand">
        <input type="submit"
               value="<my:Locale value="page.admin.subjects.create" />"
               class="spacebtn btn btn-success"/>
    </form>
</div>

<%-- ==============TESTS============ --%>
<div class="col-6 offset-md-2">
    <h4>
        <my:Locale value="page.admin.tests.all"/>
    </h4>
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th><my:Locale value="page.admin.tests.subjectname"/></th>
            <th><my:Locale value="page.admin.tests.name"/></th>
            <th><my:Locale value="page.admin.tests.name"/></th>
            <th><my:Locale value="page.admin.tests.score"/></th>
            <th><my:Locale value="page.admin.tests.deadline"/></th>
            <th><my:Locale value="page.admin.tests.level"/></th>
            <th><my:Locale value="page.admin.tests.popularity"/></th>
            <th><my:Locale value="page.admin.tests.duration"/></th>
            <th><my:Locale value="page.admin.tests.edit"/></th>
            <th><my:Locale value="page.admin.tests.delete"/></th>
        </tr>
        </thead>
        <c:forEach var="test" items="${tests}">
        <tbody>
        <tr>
            <td>
                <p>${test.subject.name }</p>
            </td>
            <td>
                <div>
                    <form method="POST" action="controller">
                        <input type="hidden" name="testId" value="${test.id}"> <input
                            type="hidden" name="command" value="goToUpdateTestCommand">
                        <button type="submit" class="btn btn-link">${test.name}</button>
                    </form>
                </div>
            </td>
            <td>
                <form action="controller" method="post">
                    <input type="hidden" name="test_id" value="${test.id}"> <input
                        type="text" id="test_name" name="test_name" value="${test.name}">
            </td>
            <td>
                <div>
                        <%--<select name="test_score">
                            <c:forEach var = "i" begin = "1" end = "30">
                                <option value="${i}"
                                    <c:if test="${test.score == i }">selected</c:if>>${i}
                                </option>
                            </c:forEach>
                        </select>  --%>
                    <p>${test.score}</p>
                </div>
            </td>
            <td>
                <input type="datetime-local" id="deadline" name="deadline" value="${test.deadline}" min="2021-06-01T00:00" max="2030-06-14T00:00">
            </td>
            <td>
                <div>
                    <select name="test_level">
                        <c:forEach var="i" begin="1" end="5">
                            <option value="${i}"
                                    <c:if test="${test.level == i }">selected</c:if>>${i}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </td>
            <td>
                <p>${test.popularity}</p>
            </td>
            <td>
                <div>
                    <select name="test_duration">
                        <c:forEach var="i" begin="1" end="60">
                            <option value="${i}"
                                    <c:if test="${test.duration == i }">selected</c:if>>${i}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </td>
            <td>
                <input type="hidden" name="command" value="updateTestCommand">
                <button type="submit" class="spacebtn btn btn btn-primary">
                    <my:Locale value="page.admin.tests.edit" />
                </button>
                </form>
            </td>
            <td>
                <form>
                    <input type="hidden" name="test_id" value="${test.id}">
                    <input type="hidden" name="command" value="deleteTestCommand">
                    <button type="submit" class="spacebtn btn btn-danger">
                        <my:Locale value="page.admin.tests.delete" />
                    </button>
                </form>
            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
<div class="col-6 offset-md-4">
    <h4>
        <my:Locale value="page.admin.tests.newcreate"/>
    </h4>
    <form method="post" action="controller">
        <div>
            <label for="subject_id">
                <my:Locale value="page.admin.tests.new.subject"/>
            </label>
            <select name="subject_id">
                <c:forEach var="subject" items="${subjects}">
                    <option value="${subject.id}">${subject.name}</option>
                </c:forEach>
            </select>
        </div>
        <br/>
        <label for="test_name"><my:Locale value="page.admin.tests.new.name"/></label>
        <input name="test_name" value="${test.name}" placeholder="<my:Locale value="page.admin.tests.new.name"/>">
        <br/> <label for="deadline"><my:Locale value="page.admin.tests.new.deadline"/></label>
        <input type="datetime-local" id="deadline" name="deadline" value="2021-06-01T00:00" min="2021-06-01T00:00"
               max="2030-06-14T00:00"><br/>
        <div>
            <label for="level"><my:Locale value="page.admin.tests.new.level"/></label>
            <select name="level">
                <c:forEach var="i" begin="1" end="5">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label for="duration"><my:Locale value="page.admin.tests.new.duration"/></label>
            <select name="duration">
                <c:forEach var="i" begin="1" end="60">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" name="command" value="createTestCommand">
        <input type="submit"
               value="<my:Locale value="page.admin.tests.create" />"
               class="spacebtn btn btn-success"></input>
    </form>
</div>

<%-- =====================USERS========================== --%>

<div class="col-5 offset-md-3">
    <h4>
        <my:Locale value="page.admin.users.all"/>
    </h4>
    <table id="example" class="table table-striped table-dark">
        <thead>
        <tr>
            <th><my:Locale value="page.admin.users.name"/></th>
            <th><my:Locale value="page.admin.users.password"/></th>
            <th><my:Locale value="page.admin.users.role"/></th>
            <th><my:Locale value="page.admin.users.edit"/></th>
        </tr>
        </thead>
        <c:forEach items="${users}" var="user">
            <tr>
                <form action="controller" method="post">
                    <td><input type="hidden" name="user_id" value="${user.id}">
                        <input type="text" id="user_name" name="user_name"
                               value="${user.name}"></td>
                    <td><input type="password" id="user_password"
                               name="user_password" value="${user.password}"></td>
                    <td>
                        <div>
                            <select name="role_id">
                                <c:forEach var="role" items="${roles}">
                                    <option value="${role.id}"
                                            <c:if test="${user.role.name == role.name }">selected</c:if>>${role.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td><input type="hidden" name="command"
                               value="updateUserCommand">
                        <button type="submit" class="spacebtn btn btn btn-primary">
                            <my:Locale value="page.admin.users.edit"/>
                        </button>
                    </td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>