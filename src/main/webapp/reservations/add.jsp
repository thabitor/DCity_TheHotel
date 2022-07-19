<%@ page import="java.time.LocalDate" %>
<%@ page import="services.HotelService" %>
<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    RoomDAO roomDAO = new RoomDAO(service.getManager());
    String id = request.getParameter("room_id"); // these variables change everytime we load this page
    if(id == null) {
        response.setStatus(404);
        return;
    }
    Room room = roomDAO.get(Integer.parseInt(id));
%>
<%@ include file="../header.jsp" %>
<div class="container">
    <%
        String message="";
        if(request.getAttribute("message") != null)
            message = request.getAttribute("message").toString();
            System.out.println(message);
    %>
    <p><%= message %></p>
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
        <button type="submit" class="btn btn-default">Make booking</button>
    </form>
</div>
<%@ include file="../footer.jsp" %>