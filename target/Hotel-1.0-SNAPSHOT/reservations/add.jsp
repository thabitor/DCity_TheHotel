<%@ page import="java.time.LocalDate" %>
<%@ page import="services.HotelService" %>
<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 15:05
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
%>
<html>
<head>
    <title>Add reservation</title>
</head>
<body>
    <form action="add" method="post">
        <input type="hidden" name="client_id" value="1">
        <input type="hidden" name="room_id" value="<%= room.getRoomId() %>">
        <input type="hidden" name="capacity" value="<%= room.getCapacity() %>">
        <input type="hidden" name="price" value="<%= room.getPrice() %>">
        <div>
            <label for="date_start">date_start</label>
            <input type="date" id="date_start" name="date_start" value="<%= LocalDate.now() %>">
        </div>
        <div>
            <label for="date_end">date_end</label>
            <input type="date" id="date_end" name="date_end" value="<%= LocalDate.now().plusDays(1) %>">
        </div>
        <button type="submit">make booking</button>
    </form>
</body>
</html>
