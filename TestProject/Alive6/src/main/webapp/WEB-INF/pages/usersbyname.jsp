<!DOCTYPE html>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
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
            font-size: 14px;
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
            font-size: 14px;
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
<body>
<a href="../../index.jsp">Back to list of users</a>

<br/>
<br/>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5 col-lg-offset-1">
            <div class="text">Found results</div>
            <c:if test="${!empty userListByName}">
                <table class="table table-striped table-bordered">
                    <tr class="success">
                        <th width="80">ID</th>
                        <th width="120">Name</th>
                        <th width="60">Age</th>
                        <th width="120">IsAdmin</th>
                        <th width="120">CreatedDate</th>
                        <th width="60">Edit</th>
                        <th width="60">Delete</th>
                    </tr>
                    <c:forEach items="${userListByName}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                            <td>${user.age}</td>
                            <td>${user.sAdmin}</td>
                            <td>${user.createdDate}</td>
                            <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                            <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
        <div class="col-lg-3 col-lg-offset-1">
        </div>
    </div>
</div>
</body>



