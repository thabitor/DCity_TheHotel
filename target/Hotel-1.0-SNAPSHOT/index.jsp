<%@ page import="daos.ClientDAO" %>
<%@ page import="services.HotelService" %>
<%@ page import="entities.Client" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 11:36
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
    <title>The Hotel</title>
</head>
<body>
    <h1>The Hotel</h1>
    <p>Where your dreams come true... for sure</p>
    <a href="rooms">rooms list</a>
    <a href="reservations/add">Make a new reservation</a>
    <a href="reservations/findReservation.jsp">See my reservations</a>

    <form action="all" method="get">
        <label for="client">choose a client:</label>
        <select name="client_id" id="client">
        <% for (Client client : clientList) { %>
            <option value="<%= client.getClientId() %>"><%= client.getFirstName() %> <%= client.getLastName() %></option>
        <% } %>
        </select>
        <button type="submit">get reservations</button>
    </form>
    <form action="findRoomDate" method="post">
        <label for="date_search">Looking for a date ? </label>
        <input type="date" name="date_search" id="date_search">
        <button type="submit">check this date</button>
    </form>

</body>
</html>
