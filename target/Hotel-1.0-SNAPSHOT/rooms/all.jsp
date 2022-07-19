<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="services.HotelService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    RoomDAO roomDAO = new RoomDAO(service.getManager());
    List<Room> rooms = roomDAO.getAll();
%>
<%@ include file="../header.jsp" %>
<div class="container">
    <h2>Rooms & Tariff</h2>
    <!-- form -->
    <div class="row">
        <% for (Room room : rooms) { %>
        <div class="col-sm-6 wowload fadeInUp">
            <div class="rooms"><img src="../images/photos/<%= room.getRoomId() %>.jpg" class="img-responsive">
                <div class="info"><h3><%= room.getBeds() %>-bed Suite | Capacity: <%= room.getCapacity() %> people</h3>
                    <p> <%= room.getDescription() %></p>
                    <a href="room.jsp?room_id=<%= room.getRoomId() %>" class="btn btn-default">Check Details</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
<%--    <div class="text-center">--%>
<%--        <ul class="pagination">--%>
<%--            <li class="disabled"><a href="#">«</a></li>--%>
<%--            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>--%>
<%--            <li><a href="#">2</a></li>--%>
<%--            <li><a href="#">3</a></li>--%>
<%--            <li><a href="#">4</a></li>--%>
<%--            <li><a href="#">5</a></li>--%>
<%--            <li><a href="#">»</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
</div>
<%@ include file="../footer.jsp" %>