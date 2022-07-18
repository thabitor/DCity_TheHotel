<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="services.HotelService" %>
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
    List<Room> rooms = roomDAO.getAll();
%>
<html>
<head>
    <title>Rooms</title>
</head>
<body>
<div>
    <h1>Room list</h1>
    <ul>
        <% for (Room room : rooms) { %>
        <li>
            <div>
                <p><span>id:</span> <%= room.getRoomId() %></p>
                <p><span>description:</span> <%= room.getDescription() %></p>
                <p><span>floor:</span> <%= room.getFloor() %></p>
                <p><span>capacity:</span> <%= room.getCapacity() %></p>
                <p><span>beds:</span> <%= room.getBeds() %></p>
                <p><span>price:</span> $<%= room.getPrice() %></p>
                <p><a href="../rooms?id=<%= room.getRoomId() %>">room details</a></p>
            </div>
        </li>
        <% } %>
    </ul>
</div>


</body>
</html>
