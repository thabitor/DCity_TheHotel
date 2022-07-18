<%@ page import="daos.ReservationDAO" %>
<%@ page import="services.HotelService" %>
<%@ page import="entities.Room" %>
<%@ page import="entities.Client" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="entities.Reservation" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    String clientEmail = request.getParameter("email"); // these variables change everytime we load this page
    int capacity = Integer.parseInt(request.getParameter("capacity"));

    if(id == null) {
        response.setStatus(404);
        return;
    }
    Room room = roomDAO.get(Integer.parseInt(id));
    Client client = new Client();
    Reservation reservation = new Reservation();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="add" method="post">
    <input type="hidden" name="client_id" value="<%= client.setClientId() %>">
    <input type="hidden" name="reservation_id" value="<%= reservation.setReservationId(); %>">
    <input type="hidden" name="room_id" value="<%=reservation.getRoom().getRoomId() %>">
    <input type="hidden" name="price" value="<%= %>">
    <div>
        <label for="capacity">Number of guests</label>
        <input type="number" name="capacity" id="capacity" value="<%= room.getCapacity() %>">
    </div>
    <div>
        <label for="date_start">Checkin date</label>
        <input type="date" id="date_start" name="date_start" value="<%= LocalDate.now() %>">
    </div>
    <div>
        <label for="date_end">Checkout date</label>
        <input type="date" id="date_end" name="date_end" value="<%= LocalDate.now().plusDays(1) %>">
    </div>
    <div>
        <label for="email">Email address</label>
        <input type="email" id="email" name="email">
    </div>
    <button type="submit">make booking</button>
</form>
</body>
</html>
