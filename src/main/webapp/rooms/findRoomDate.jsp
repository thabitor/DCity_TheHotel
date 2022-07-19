<%@ page import="java.time.LocalDate" %>
<%@ page import="services.HotelService" %>
<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page import="entities.Reservation" %>
<%@ page import="daos.ReservationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LocalDate dateToLook = LocalDate.parse(request.getParameter("date_search"));
    HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    List<Room> roomsAvailable = reservationDAO.getRoomsDate(dateToLook);

%>
<html>
<head>
    <title>Rooms Available</title>
</head>
<body>
<div>
    <h1>Available rooms</h1>
    <ul>
        <% for (Room room: roomsAvailable) { %>
        <li>
            <div>
                <p><span>Room id:</span> <%= room.getRoomId() %></p>
                <p><span>Description:</span> <%= room.getDescription()%></p>
                <p><span>Floor:</span> <%= room.getFloor()%></p>
                <p><span>Capacity:</span> <%=room.getCapacity() %></p>
                <p><span>Beds:</span> <%= room.getBeds()%></p>
                <p><span>Price:</span> <%= room.getPrice()%></p>
                <p><a href="../reservations?room_id=<%= room.getRoomId() %>">Book this room</a></p>
            </div>
        </li>
        <% } %>
    </ul>
</div>

</body>
</html>