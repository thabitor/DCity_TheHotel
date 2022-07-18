<%@ page import="services.HotelService" %>
<%@ page import="daos.ClientDAO" %>
<%@ page import="entities.Client" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ClientDAO clientDAO = new ClientDAO(service.getManager());
    List<Client> clientList = clientDAO.getAll();
%>

<html>
<head>
    <title>My reservations</title>
</head>
<body>

<form action="../reservations" method="get">
    <label for="email">Enter your email address:</label>
    <input name="client_email" id="email">
    <button type="submit">Get reservations</button>
</form>

<form action="all" method="get">
    <label for="client">Choose a client:</label>
    <select name="client_id" id="client">
        <% for (Client client : clientList) { %>
        <option value="<%= client.getClientId() %>"><%= client.getFirstName() %> <%= client.getLastName() %></option>
        <% } %>
    </select>
    <button type="submit">Get reservations</button>
</form>

</body>
</html>
