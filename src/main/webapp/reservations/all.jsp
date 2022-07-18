<%@ page import="services.HotelService" %>
<%@ page import="daos.ReservationDAO" %>
<%@ page import="entities.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String clientEmail = request.getParameter("client_email");
    HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    List<Reservation> reservations = reservationDAO.getAll();

    if (clientEmail == null && request.getParameter("client_id") != null) {
        int clientId = Integer.parseInt(request.getParameter("client_id"));
        reservations = reservations.stream()
                .filter(r -> r.getClient().getClientId() == clientId)
                .collect(Collectors.toList());
    } else {
        reservations = reservations.stream()
                .filter(r -> r.getClient().getMail().equals(clientEmail))
                .collect(Collectors.toList());
    }
%>
<html>
<head>
    <title>All reservation</title>
</head>
<body>
<div>
    <h1>Reservation list</h1>
    <ul>
        <% for (Reservation reservation : reservations) { %>
        <li>
            <div>
                <p><span>Reservation from </span> <%= reservation.getDateStart() %> <span> to </span> <%= reservation.getDateEnd() %></p>
                <p><span>Reservation number:</span> <%= reservation.getReservationId() %></p>
                <p><span>Number of guests:</span> <%= reservation.getCapacity() %></p>
                <p><span>Room description:</span> <%= reservation.getRoom().getDescription() %></p>
                <p><span>price:</span> <%= reservation.getPrice() %></p>
                <p><a href="../reservations?reservation_id=<%= reservation.getReservationId() %>">reservation details</a></p>
            </div>
        </li>
        <% } %>
    </ul>
</div>

</body>
</html>


<%--&client_email=<%= reservation.getClient().getMail() %>--%>