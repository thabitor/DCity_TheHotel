<%@ page import="services.HotelService" %>
<%@ page import="daos.ReservationDAO" %>
<%@ page import="entities.Reservation" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
//    String clientEmail = request.getParameter("client_email");
//    HotelService service = HotelService.getInstance();
//    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
//    List<Reservation> reservations = reservationDAO.getAll().stream()
//            .filter(r -> r.getClient().getMail() == clientEmail)
//            .collect(Collectors.toList());
%>

<html>
<head>
    <title>My reservations</title>
</head>
<body>

<form action="../reservations" method="get">
    <label for="email">Enter your email address:</label>
    <input name="client_email" id="email">
    <button type="submit">Get reservation!</button>
</form>
</body>
</html>
