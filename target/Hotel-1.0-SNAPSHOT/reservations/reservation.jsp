<%@ page import="services.HotelService" %>
<%@ page import="daos.ReservationDAO" %>
<%@ page import="entities.Reservation" %>
<%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    String id = request.getParameter("id"); // these variables change everytime we load this page
    if(id == null) {
        response.setStatus(404);
        return;
    }
    Reservation reservation = reservationDAO.get(Integer.parseInt(id));
%>
<html>
<head>
    <title>Reservation details</title>
</head>
<body>
    <h1>Room details</h1>
    <ul>
        <li>
            <div>
                <p><span>reservation_id:</span> <%= reservation.getReservationId() %></p>
                <p><span>client_id:</span> <%= reservation.getClient().getClientId() %></p>
                <p><span>date_start:</span> <%= reservation.getDateStart() %></p>
                <p><span>date_end:</span> <%= reservation.getDateEnd() %></p>
                <p><span>price:</span> <%= reservation.getPrice() %></p>
            </div>
        </li>
    </ul>
</body>
</html>
