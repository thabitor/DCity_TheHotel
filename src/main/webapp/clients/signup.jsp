<%@ page import="daos.ClientDAO" %>
<%@ page import="services.HotelService" %>
<%@ page import="entities.Client" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ClientDAO clientDAO = new ClientDAO(service.getManager());
//    String id = request.getParameter("client_id"); // these variables change everytime we load this page
//    if(id == null) {
//        response.setStatus(404);
//        return;
//    }
//    Client client = clientDAO.get(Integer.parseInt(id));
%>
<html>
<head>
    <title>Add client</title>
</head>
<body>
<h1>Create a new account</h1>
<form action="../clients" method="post">
    <input type="hidden" name="client_id" value="1">
    <div>
        <label for="first_name">First name</label>
        <input type="text" id="first_name" name="first_name">
    </div>
    <div>
        <label for="last_name">Last name</label>
        <input type="text" id="last_name" name="last_name">
    </div>
    <div>
        <label for="birth_date">Date of birth</label>
        <input type="date" id="birth_date" name="birth_date">
    </div>
    <div>
        <label for="mail">Email address</label>
        <input type="text" id="mail" name="mail">
    </div>
    <div>
        <label for="telephone">Phone number</label>
        <input type="text" id="telephone" name="telephone">
    </div>
    <button type="submit">Sign up</button>
</form>
</body>
</html>
