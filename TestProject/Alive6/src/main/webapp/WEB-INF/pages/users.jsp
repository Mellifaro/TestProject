<!DOCTYPE html>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 16px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 16px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
        .text {
            font-family: "Times New Roman", sans-serif;
            font-size: 30px;
            text-align:  center;
        }
        .text1 {
            font-family: "Times New Roman", sans-serif;
            font-size: 30px;
            text-align:  left;
        }
        .text2 {
            font-family: "Times New Roman", sans-serif;
            font-size: 14px;
            text-align:  center;
        }
    </style>
</head>

<body style="background-color:#F8F9F3">

<br/>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5 col-lg-offset-1">
            <a href="../../index.jsp">Back to main menu</a>
           <div class="text">User List</div>

                <c:if test="${!empty listUsers}">
                    <table table class="table table-striped table-bordered">
                        <tr class="success">
                            <th width="80">ID</th>
                            <th width="120">Name</th>
                            <th width="60">Age</th>
                            <th width="80">IsAdmin</th>
                            <th width="130">CreatedDate</th>
                            <th width="60">Edit</th>
                            <th width="60">Delete</th>
                        </tr>
                        <c:forEach items="${listUsers}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                                <td>${user.age}</td>
                                <td>${user.sAdmin}</td>
                                <td><fmt:formatDate type="date" value="${user.createdDate}" /></td>
                                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <div class="text2"><nav>
                <ul class="pagination">
                    <li><a href="<c:url value='/page/0'/>">Prev</a></li>
                    <li><a href="#">${pageNumber}</a></li>
                    <li><a href="<c:url value='/page/1'/>">Next</a></li>
                </ul>
                </nav></div>
            </div>

        <div class="col-lg-3 col-lg-offset-1">
            <div class="row">
                <br/>
                <br/>
                <div class="text1">Add new user</div>

            <c:url var="addAction" value="/users/add"/>

            <form:form action="${addAction}" commandName="user" >


                <table>
                    <c:if test="${!empty user.name}">
                        <tr>
                            <td>
                                <form:label path="id">
                                    <spring:message text="ID"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" size="8" disabled="true" class="form-control"/>
                                <form:hidden path="id"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <form:label path="name">
                                <spring:message text="name"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="name" class="form-control" maxlength="25"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="age">
                                <spring:message text="age"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="age" type='number' min="1" max="99" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="sAdmin">
                                <spring:message text="isAdmin"/>
                            </form:label>
                        </td>
                        <td>
                            <form:checkbox path="sAdmin" name="_active" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty user.name}">
                                <input type="submit"
                                       class="btn btn-primary" value="<spring:message text="Edit User"/>"/>
                            </c:if>
                            <c:if test="${empty user.name}">
                                <input type="submit"
                                       class="btn btn-primary" value="<spring:message text="Add User"/>"/>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </form:form>

            </div>
            <div class="row">
                <br/>
                <br/>
                <div class="text1">Find user by name</div>



                <form action="/usernames" method="get">
                       <input type="text" class="form-control" maxlength="25" placeholder="username" name="username">
                       <input type="submit" class="btn btn-primary" name="sumbitB" value="Find">
                </form>

            </div>
        </div>
    </div>
</div>



</body>
</html>
