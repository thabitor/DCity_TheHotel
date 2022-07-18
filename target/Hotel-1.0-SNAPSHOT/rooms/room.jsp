<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page import="services.HotelService" %>
<%@ page import="entities.Reservation" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    RoomDAO roomDAO = new RoomDAO(service.getManager());
    String id = request.getParameter("id"); // these variables change everytime we load this page
    if(id == null) {
        response.setStatus(404);
        return;
    }
    Room room = roomDAO.get(Integer.parseInt(id));
    List<Reservation> reservations = room.getReservations();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Room details</h1>
    <ul>
        <li>
            <div>
                <p><span>room_id:</span> <%= room.getRoomId() %></p>
                <p><span>description:</span> <%= room.getDescription() %></p>
                <p><span>floor:</span> <%= room.getFloor() %></p>
                <p><span>capacity:</span> <%= room.getCapacity() %></p>
                <p><span>beds:</span> <%= room.getBeds() %></p>
                <p><span>price:</span> $<%= room.getPrice() %></p>
            </div>
        </li>
    </ul>
<%--    <% for (Reservation reservation : reservations) { %>--%>
<%--    <li>--%>
<%--        <div>--%>
<%--            <p><span>reservation_id:</span> <%= reservation.getReservationId() %></p>--%>
<%--            <p><span>client_id:</span> <%= reservation.getClient().getClientId() %></p>--%>
<%--            <p><span>date_start:</span> <%= reservation.getDateStart() %></p>--%>
<%--            <p><span>date_end:</span> <%= reservation.getDateEnd() %></p>--%>
<%--            <p><span>price:</span> <%= reservation.getPrice() %></p>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <% } %>--%>
    <div>
        <a href="../reservations/add?id=<%= room.getRoomId() %>">book this room</a>
    </div>
    <div>
        <a href="../rooms">back to rooms</a>
    </div>
</body>
</html>
